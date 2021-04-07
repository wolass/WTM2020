# Load packages

pacman::p_load(tidyverse, here,devtools,naniar,jsonlite,data.table,chron)

# Load data sets

# Nadpisalem w skrypcie zeby zmienne stale nadpisywaly NA np. dla gender
source('analysis/data/raw_data/data/WTM2020_R_2020-12-16_1519.r')
final_df <- list()
# Perform data cleaning # Add or remove variables

vis_miss(data)
data$birthdate <- as.Date(data$birthdate)
data$years_old <- floor(as.numeric(difftime(as.Date(Sys.Date()),as.Date(data$birthdate),
                                            unit="weeks"))/52.25)
label(data$years_old)="Years old at first visit"

data <- data %>% filter(!is.na(years_old))
data = data[, colSums(is.na(data)) != nrow(data)]
data <- as.data.frame(data)
# Verify data integrity
vis_miss(data)

final_df$data <- data

# JSONs
folder <- here("analysis/data/raw_data/data/DANE Z CZUJNIKÓW/1. Wszystkie dane w formacie .json/")

json_files <- paste0(folder,"/",list.files(path = folder,pattern = "pacjent"))

json_data <- purrr::map(json_files, fromJSON)

convert_fun <- function(nazwa){
  #value <- nazwa[ , grepl( "value" , names(nazwa) ) ]
  #value <- t(value)
  #rownames(value) <- NULL
  #date <- nazwa[ , grepl( "time" , names(nazwa) ) ]
  #date <- t(date)
  #rownames(date) <- NULL
  #nazwa <- data.frame(date,value)

  nazwa <- nazwa %>% mutate(day = substr(time,9,10),
                            diff_value=value-lag(value),
                            location=ifelse(value>22,"skin","out"),
                            clock=substr(time,12,19) %>% as.ITime(),
                            condition=ifelse(diff_value < c(-0.15),"unstable","stable"),
                            clock=as.ITime(clock)
                            )
}
names_json <- list.files(folder,pattern = "pacjent")
names(json_data) <- names_json
names(json_data) <- substr(names(json_data),8,9)
names(json_data) <- as.numeric(names(json_data))
json_data <-  map(json_data,convert_fun)

names(json_data)[6] <- 14.5
names(json_data)[28] <- 34.5
names_json <- names(json_data)
#COMPARE
compare_fun <- function(pacjent) {
  compare_list <- list()
  #pacjent <- as.character(pacjent)

  comp <- json_data[[pacjent]]
  pacjent <- substr(pacjent,1,2)
  comp2 <-
    data %>% filter(record_id == pacjent,
                    redcap_event_name == "end_of_study_visit_arm_1") %>% select(
                      patient_temperature,
                      patient_temperature_2,
                      patient_temperature_3,
                      patient_temperature_4,
                      patient_temperature_5,
                      patient_temperature_6
                    )
  comp2 <- t(comp2) %>% as.data.frame()
  comp2 <- comp2[!is.na(comp2)]

  comp3 <-
    data %>% filter(record_id == pacjent,
                    redcap_event_name == "end_of_study_visit_arm_1") %>% select(
                      date_and_time_of_measure,
                      date_and_time_of_measure_2,
                      date_and_time_of_measure_3,
                      date_and_time_of_measure_4,
                      date_and_time_of_measure_5,
                      date_and_time_of_measure_6
                    )
  comp3 <- t(comp3)
  comp$time <-lubridate::as_datetime(comp$time, tz = "Europe/Berlin")

  comp <- as.data.frame(comp)
  comp3 <-lubridate::ymd_hm(comp3[,1],tz = "Europe/Berlin")
  comp3 <- comp3[!is.na(comp3)]

  test_fun <- function(i){
    w <- which(abs(comp3[i]-comp$time) == min(abs(comp3[i]-comp$time)))
    w <- ceiling(sum(w)/length(w))
    return(w) }
  test <- map(1:length(comp3),test_fun)
  test <- unlist(test)
  comp <- comp[c(test),] %>% select(time,value)

  comp3 <- cbind(comp3,comp$time)
  comp4 <- cbind(comp3, comp2)
  colnames(comp4) <- c("time","time2", "standard")
  comp4 <- as.data.frame(comp4)
  comp4$time <- lubridate::as_datetime(comp4$time,tz = "Europe/Berlin")
  colnames(comp) <- c("time2","value")
  #comp <- distinct(comp)
  comp <- merge(comp, comp4, by = "time2",all.y=T) %>% distinct()

  compare_list$comp <- comp
  compare_list$comp2 <- comp2
  compare_list$comp3 <- comp3
  compare_list$comp4 <- comp4
  return(compare_list)
}
test <- compare_fun("2")


output <- map(names(json_data) #%>% as.numeric, # zamiast obiektu na wejściu funcji podałeś liczbę.
    ,compare_fun)
names(output) <- names_json

# Export the data to here::here("analysis/data/derived_data/clean_df.Rds")

write_rds(final_df, here("analysis/data/raw_data/clean_df.Rds"))
