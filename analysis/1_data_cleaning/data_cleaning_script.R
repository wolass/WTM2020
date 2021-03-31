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
final_df$data <- data
# Verify data integrity
vis_miss(data)

final_df$data <- data

# JSONs

json_files <- list.files(path = "analysis/data/raw_data/data/DANE Z CZUJNIKÓW/1. Wszystkie dane w formacie .json/",pattern = "pacjent")
for(i in length(json_files))
{
  setwd("analysis/data/raw_data/data/DANE Z CZUJNIKÓW/1. Wszystkie dane w formacie .json/")
  json_data <- purrr::map(json_files, fromJSON)
  setwd("../../../../../..")
}
names(json_data) <- json_files

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
                            clock=substr(time,12,19),
                            condition=ifelse(diff_value < c(-0.15),"unstable","stable"))

}

#convert na liscie
for(i in json_files){
  json_data[[i]] <- convert_fun(json_data[[i]])
  json_data[[i]]$clock <- as.ITime(json_data[[i]]$clock)
}
final_df$json_data <- json_data

# Export the data to here::here("analysis/data/derived_data/clean_df.Rds")

write_rds(final_df, here("analysis/data/raw_data/clean_df.Rds"))
