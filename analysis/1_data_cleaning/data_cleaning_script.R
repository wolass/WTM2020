# Load packages

pacman::p_load(tidyverse, here,devtools,naniar,jsonlite,data.table,chron,ggpubr)

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

names_json <- list.files(folder,pattern = "pacjent")
names(json_data) <- names_json
names(json_data) <- substr(names(json_data),8,9)
names(json_data) <- as.numeric(names(json_data))

names(json_data)[6] <- 14.5
names(json_data)[28] <- 34.5
names_json <- names(json_data)
final_df$json_data <- json_data
#COMPARE
compare_fun <- function(pacjent) {
  compare_list <- list()

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
  comp <- comp %>% mutate(clock=substr(time,12,19) %>% as.ITime(),
                          day=substr(time,9,10) %>% as.integer(),
                          hour=substr(clock,1,2) %>% as.integer(),
                          diff_value=value-lag(value),
                          location=ifelse(value>22,"skin","out"),
                          condition=ifelse(diff_value < c(-0.15),"unstable","stable"))
  full_table <- comp

  plot <- ggline(data=comp,x="hour",y="value",add="mean_se",facet.by = "day") + scale_x_continuous(
    breaks = get_breaks(by = 3, from = 0))

  comp <- as.data.frame(comp)
  comp5 <- comp %>% summarise(min_temp=min(value,na.rm = T),mean_temp=mean(value,na.rm = T),sd_temp=sd(value,na.rm = T),max_temp=max(value,na.rm = T))
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

  comp <- merge(comp, comp4, by = "time2",all.y=T) %>% distinct()
  comp <- comp %>% mutate(diff_time = abs(difftime(time,time2,units="mins")))
  comp <- comp %>% filter(diff_time<=5)
  comp <- comp[,-5]
  comp <- comp %>% mutate(diff_value = abs(value-standard))
  comp$id <- pacjent
  comp2 <- comp %>% summarise(mean=mean(diff_value,na.rm = T),sd_error=sd(diff_value,na.rm = T))

  compare_list$comp <- comp
  compare_list$comp_mean <- comp5
  compare_list$plot <- plot
  compare_list$comp2 <- comp2
  compare_list$full_table <- full_table
  return(compare_list)
}
test <- compare_fun("2")

output <- map(names(json_data)
    ,compare_fun)
names(output) <- names_json

mean_frame <- bind_rows(lapply(output, `[`, c(4)))
mean_frame <- mean_frame$comp2
mean_frame$sd_error[is.na(mean_frame$sd_error)] <- 0
rownames(mean_frame) <- names_json
final_df$mean_frame <- mean_frame

final_df$output <- output

# Export the data to here::here("analysis/data/derived_data/clean_df.Rds")

write_rds(final_df, here("analysis/data/raw_data/clean_df.Rds"))
