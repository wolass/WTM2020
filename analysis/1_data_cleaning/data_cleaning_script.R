# Load packages

pacman::p_load(tidyverse, here,devtools,naniar,jsonlite,data.table,chron)

# Load data sets

# Nadpisalem w skrypcie zeby zmienne stale nadpisywaly NA np. dla gender
source('analysis/data/raw_data/data/WTM2020_R_2020-12-16_1519.r')

# Load Temperature data for each patient!
final_df <- list()
##Load jsons
convert_fun <- function(nazwa){
value <- nazwa[ , grepl( "value" , names(nazwa) ) ]
value <- t(value)
rownames(value) <- NULL
date <- nazwa[ , grepl( "time" , names(nazwa) ) ]
date <- t(date)
rownames(date) <- NULL
nazwa <- data.frame(date,value)
nazwa <- nazwa %>% mutate(day = substr(nazwa$date,9,10),
                          diff_value=value-lag(value),
                          location=ifelse(value>22,"skin","out"),
                          time=substr(date,12,19),
                          condition=ifelse(diff_value < c(-0.15),"unstable","stable"))
}

#pacjent2
pacjent2 <- rjson::fromJSON(file= "analysis/data/raw_data/data/DANE Z CZUJNIKÓW/1. Wszystkie dane w formacie .json/pacjent2.json")
pacjent2 <- as.data.frame(pacjent2)
pacjent2 <- convert_fun(pacjent2)
pacjent2$time <- as.ITime(pacjent2$time)
pacjent2$date <- as.Date(pacjent2$date)
final_df$pacjent2 <- pacjent2
#pacjent3
pacjent3 <- rjson::fromJSON(file= "analysis/data/raw_data/data/DANE Z CZUJNIKÓW/1. Wszystkie dane w formacie .json/pacjent3.json")
pacjent3 <- as.data.frame(pacjent3)
pacjent3 <- convert_fun(pacjent3)
final_df$pacjent3 <- pacjent3
#pacjent4
pacjent4 <- rjson::fromJSON(file= "analysis/data/raw_data/data/DANE Z CZUJNIKÓW/1. Wszystkie dane w formacie .json/pacjent4.json")
pacjent4 <- as.data.frame(pacjent4)
pacjent4 <- convert_fun(pacjent4)
final_df$pacjent4 <- pacjent4
#pacjent5
pacjent5 <- rjson::fromJSON(file= "analysis/data/raw_data/data/DANE Z CZUJNIKÓW/1. Wszystkie dane w formacie .json/pacjent5.json")
pacjent5 <- as.data.frame(pacjent5)
pacjent5 <- convert_fun(pacjent5)
final_df$pacjent5 <- pacjent5
#pacjent6
pacjent6 <- rjson::fromJSON(file= "analysis/data/raw_data/data/DANE Z CZUJNIKÓW/1. Wszystkie dane w formacie .json/pacjent6.json")
pacjent6 <- as.data.frame(pacjent6)
pacjent6 <- convert_fun(pacjent6)
final_df$pacjent6 <- pacjent6
#pacjent7
pacjent7 <- rjson::fromJSON(file= "analysis/data/raw_data/data/DANE Z CZUJNIKÓW/1. Wszystkie dane w formacie .json/pacjent7.json")
pacjent7 <- as.data.frame(pacjent7)
pacjent7 <- convert_fun(pacjent7)
final_df$pacjent7 <- pacjent7
#pacjent8
pacjent8 <- rjson::fromJSON(file= "analysis/data/raw_data/data/DANE Z CZUJNIKÓW/1. Wszystkie dane w formacie .json/pacjent8.json")
pacjent8 <- as.data.frame(pacjent8)
pacjent8 <- convert_fun(pacjent8)
final_df$pacjent8 <- pacjent8
#pacjent9
pacjent9 <- rjson::fromJSON(file= "analysis/data/raw_data/data/DANE Z CZUJNIKÓW/1. Wszystkie dane w formacie .json/pacjent9.json")
pacjent9 <- as.data.frame(pacjent9)
pacjent9 <- convert_fun(pacjent9)
final_df$pacjent9 <- pacjent9
#pacjent10
pacjent10 <- rjson::fromJSON(file= "analysis/data/raw_data/data/DANE Z CZUJNIKÓW/1. Wszystkie dane w formacie .json/pacjent10.json")
pacjent10 <- as.data.frame(pacjent10)
pacjent10 <- convert_fun(pacjent10)
final_df$pacjent10 <- pacjent10
#pacjent11
pacjent11 <- rjson::fromJSON(file= "analysis/data/raw_data/data/DANE Z CZUJNIKÓW/1. Wszystkie dane w formacie .json/pacjent11.json")
pacjent11 <- as.data.frame(pacjent11)
#pacjent12
pacjent12 <- rjson::fromJSON(file= "analysis/data/raw_data/data/DANE Z CZUJNIKÓW/1. Wszystkie dane w formacie .json/pacjent12.json")
pacjent12 <- as.data.frame(pacjent12)
#pacjent13
pacjent13 <- rjson::fromJSON(file= "analysis/data/raw_data/data/DANE Z CZUJNIKÓW/1. Wszystkie dane w formacie .json/pacjent13.json")
pacjent13 <- as.data.frame(pacjent13)
#pacjent14.1
pacjent14_1 <- rjson::fromJSON(file= "analysis/data/raw_data/data/DANE Z CZUJNIKÓW/1. Wszystkie dane w formacie .json/pacjent14(I.część cz.098).json")
pacjent14_1 <- as.data.frame(pacjent14_1)
#pacjent14.2
pacjent14_2 <- rjson::fromJSON(file= "analysis/data/raw_data/data/DANE Z CZUJNIKÓW/1. Wszystkie dane w formacie .json/pacjent14(II.część cz.102).json")
pacjent14_2 <- as.data.frame(pacjent14_2)
#pacjent15
pacjent15 <- rjson::fromJSON(file= "analysis/data/raw_data/data/DANE Z CZUJNIKÓW/1. Wszystkie dane w formacie .json/pacjent15.json")
pacjent15 <- as.data.frame(pacjent15)
#pacjent16
pacjent16 <- rjson::fromJSON(file= "analysis/data/raw_data/data/DANE Z CZUJNIKÓW/1. Wszystkie dane w formacie .json/pacjent16.json")
pacjent16 <- as.data.frame(pacjent16)
#pacjent17
pacjent17 <- rjson::fromJSON(file= "analysis/data/raw_data/data/DANE Z CZUJNIKÓW/1. Wszystkie dane w formacie .json/pacjent17.json")
pacjent17 <- as.data.frame(pacjent17)
#pacjent18
pacjent18 <- rjson::fromJSON(file= "analysis/data/raw_data/data/DANE Z CZUJNIKÓW/1. Wszystkie dane w formacie .json/pacjent18.json")
pacjent18 <- as.data.frame(pacjent18)
#pacjent19
pacjent19 <- rjson::fromJSON(file= "analysis/data/raw_data/data/DANE Z CZUJNIKÓW/1. Wszystkie dane w formacie .json/pacjent19.json")
pacjent19 <- as.data.frame(pacjent19)
#pacjent20
pacjent20 <- rjson::fromJSON(file= "analysis/data/raw_data/data/DANE Z CZUJNIKÓW/1. Wszystkie dane w formacie .json/pacjent20.json")
pacjent20 <- as.data.frame(pacjent20)
#pacjent21
pacjent21 <- rjson::fromJSON(file= "analysis/data/raw_data/data/DANE Z CZUJNIKÓW/1. Wszystkie dane w formacie .json/pacjent21.json")
pacjent21 <- as.data.frame(pacjent21)
#pacjent22
pacjent22 <- rjson::fromJSON(file= "analysis/data/raw_data/data/DANE Z CZUJNIKÓW/1. Wszystkie dane w formacie .json/pacjent22.json")
pacjent22 <- as.data.frame(pacjent22)
#pacjent24
pacjent24 <- rjson::fromJSON(file= "analysis/data/raw_data/data/DANE Z CZUJNIKÓW/1. Wszystkie dane w formacie .json/pacjent24.json")
pacjent24 <- as.data.frame(pacjent24)
#pacjent25
pacjent25 <- rjson::fromJSON(file= "analysis/data/raw_data/data/DANE Z CZUJNIKÓW/1. Wszystkie dane w formacie .json/pacjent25.json")
pacjent25 <- as.data.frame(pacjent25)
#pacjent26
pacjent26 <- rjson::fromJSON(file= "analysis/data/raw_data/data/DANE Z CZUJNIKÓW/1. Wszystkie dane w formacie .json/pacjent26.json")
pacjent26 <- as.data.frame(pacjent26)
#pacjent27
pacjent27 <- rjson::fromJSON(file= "analysis/data/raw_data/data/DANE Z CZUJNIKÓW/1. Wszystkie dane w formacie .json/pacjent27.json")
pacjent27 <- as.data.frame(pacjent27)
#pacjent28
pacjent28 <- rjson::fromJSON(file= "analysis/data/raw_data/data/DANE Z CZUJNIKÓW/1. Wszystkie dane w formacie .json/pacjent28.json")
pacjent28 <- as.data.frame(pacjent28)
#pacjent29
pacjent29 <- rjson::fromJSON(file= "analysis/data/raw_data/data/DANE Z CZUJNIKÓW/1. Wszystkie dane w formacie .json/pacjent29.json")
pacjent29 <- as.data.frame(pacjent29)
#pacjent30
pacjent30 <- rjson::fromJSON(file= "analysis/data/raw_data/data/DANE Z CZUJNIKÓW/1. Wszystkie dane w formacie .json/pacjent30.json")
pacjent30 <- as.data.frame(pacjent30)
#pacjent31
pacjent31 <- rjson::fromJSON(file= "analysis/data/raw_data/data/DANE Z CZUJNIKÓW/1. Wszystkie dane w formacie .json/pacjent31.json")
pacjent31 <- as.data.frame(pacjent31)
#pacjent32
pacjent32 <- rjson::fromJSON(file= "analysis/data/raw_data/data/DANE Z CZUJNIKÓW/1. Wszystkie dane w formacie .json/pacjent32.json")
pacjent32 <- as.data.frame(pacjent32)
#pacjent33
pacjent33 <- rjson::fromJSON(file= "analysis/data/raw_data/data/DANE Z CZUJNIKÓW/1. Wszystkie dane w formacie .json/pacjent33.json")
pacjent33 <- as.data.frame(pacjent33)
#pacjent34.1
pacjent34_1 <- rjson::fromJSON(file= "analysis/data/raw_data/data/DANE Z CZUJNIKÓW/1. Wszystkie dane w formacie .json/pacjent34(Icz.przed zmianą miejsca czujnika).json")
pacjent34_1 <- as.data.frame(pacjent34_1)
#pacjent34.2
pacjent34_2 <- rjson::fromJSON(file= "analysis/data/raw_data/data/DANE Z CZUJNIKÓW/1. Wszystkie dane w formacie .json/pacjent34(II.cz. po zmianie miejsca czujnika).json")
pacjent34_2 <- as.data.frame(pacjent34_2)
#pacjent35
pacjent35 <- rjson::fromJSON(file= "analysis/data/raw_data/data/DANE Z CZUJNIKÓW/1. Wszystkie dane w formacie .json/pacjent35.json")
pacjent35 <- as.data.frame(pacjent35)
#pacjent36
pacjent36 <- rjson::fromJSON(file= "analysis/data/raw_data/data/DANE Z CZUJNIKÓW/1. Wszystkie dane w formacie .json/pacjent36.json")
pacjent36 <- as.data.frame(pacjent36)
#pacjent37
pacjent37 <- rjson::fromJSON(file= "analysis/data/raw_data/data/DANE Z CZUJNIKÓW/1. Wszystkie dane w formacie .json/pacjent37.json")
pacjent37 <- as.data.frame(pacjent37)
#pacjent38
pacjent38 <- rjson::fromJSON(file= "analysis/data/raw_data/data/DANE Z CZUJNIKÓW/1. Wszystkie dane w formacie .json/pacjent38.json")
pacjent38 <- as.data.frame(pacjent38)
#pacjent40
pacjent40 <- rjson::fromJSON(file= "analysis/data/raw_data/data/DANE Z CZUJNIKÓW/1. Wszystkie dane w formacie .json/pacjent40.json")
pacjent40 <- as.data.frame(pacjent40)
#pacjent41
pacjent41 <- rjson::fromJSON(file= "analysis/data/raw_data/data/DANE Z CZUJNIKÓW/1. Wszystkie dane w formacie .json/pacjent41.json")
pacjent41 <- as.data.frame(pacjent41)
#pacjent42
pacjent42 <- rjson::fromJSON(file= "analysis/data/raw_data/data/DANE Z CZUJNIKÓW/1. Wszystkie dane w formacie .json/pacjent42.json")
pacjent42 <- as.data.frame(pacjent42)
#pacjent44
pacjent44 <- rjson::fromJSON(file= "analysis/data/raw_data/data/DANE Z CZUJNIKÓW/1. Wszystkie dane w formacie .json/pacjent44.json")
pacjent44 <- as.data.frame(pacjent44)
#pacjent45
pacjent45 <- rjson::fromJSON(file= "analysis/data/raw_data/data/DANE Z CZUJNIKÓW/1. Wszystkie dane w formacie .json/pacjent45.json")
pacjent45 <- as.data.frame(pacjent45)
#pacjent46
pacjent46 <- rjson::fromJSON(file= "analysis/data/raw_data/data/DANE Z CZUJNIKÓW/1. Wszystkie dane w formacie .json/pacjent46.json")
pacjent46 <- as.data.frame(pacjent46)
#pacjent47
pacjent47 <- rjson::fromJSON(file= "analysis/data/raw_data/data/DANE Z CZUJNIKÓW/1. Wszystkie dane w formacie .json/pacjent47.json")
pacjent47 <- as.data.frame(pacjent47)
#pacjent48
pacjent48 <- rjson::fromJSON(file= "analysis/data/raw_data/data/DANE Z CZUJNIKÓW/1. Wszystkie dane w formacie .json/pacjent48.json")
pacjent48 <- as.data.frame(pacjent48)
#pacjent49
pacjent49 <- rjson::fromJSON(file= "analysis/data/raw_data/data/DANE Z CZUJNIKÓW/1. Wszystkie dane w formacie .json/pacjent49.json")
pacjent49 <- as.data.frame(pacjent49)
#pacjent50
pacjent50 <- rjson::fromJSON(file= "analysis/data/raw_data/data/DANE Z CZUJNIKÓW/1. Wszystkie dane w formacie .json/pacjent50.json")
pacjent50 <- as.data.frame(pacjent50)
#pacjent51
pacjent51 <- rjson::fromJSON(file= "analysis/data/raw_data/data/DANE Z CZUJNIKÓW/1. Wszystkie dane w formacie .json/pacjent51.json")
pacjent51 <- as.data.frame(pacjent51)
#pacjent52
pacjent52 <- rjson::fromJSON(file= "analysis/data/raw_data/data/DANE Z CZUJNIKÓW/1. Wszystkie dane w formacie .json/pacjent52.json")
pacjent52 <- as.data.frame(pacjent52)
#pacjent53
pacjent53 <- rjson::fromJSON(file= "analysis/data/raw_data/data/DANE Z CZUJNIKÓW/1. Wszystkie dane w formacie .json/pacjent53.json")
pacjent53 <- as.data.frame(pacjent53)
#pacjent55
pacjent55 <- rjson::fromJSON(file= "analysis/data/raw_data/data/DANE Z CZUJNIKÓW/1. Wszystkie dane w formacie .json/pacjent55.json")
pacjent55 <- as.data.frame(pacjent55)
#pacjent56
pacjent56 <- rjson::fromJSON(file= "analysis/data/raw_data/data/DANE Z CZUJNIKÓW/1. Wszystkie dane w formacie .json/pacjent56.json")
pacjent56 <- as.data.frame(pacjent56)
#pacjent57
pacjent57 <- rjson::fromJSON(file= "analysis/data/raw_data/data/DANE Z CZUJNIKÓW/1. Wszystkie dane w formacie .json/pacjent57.json")
pacjent57 <- as.data.frame(pacjent57)

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

# Export the data to here::here("analysis/data/derived_data/clean_df.Rds")

write_rds(final_df, here("analysis/data/raw_data/clean_df.Rds"))
