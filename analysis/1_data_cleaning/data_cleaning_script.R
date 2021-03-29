# Load packages

pacman::p_load(tidyverse, here,devtools,naniar)

# Load data sets

# Nadpisalem w skrypcie zeby zmienne stale nadpisywaly NA np. dla gender
source('analysis/data/raw_data/data/WTM2020_R_2020-12-16_1519.r')
# Perform data cleaning # Add or remove variables

vis_miss(data)
data$birthdate <- as.Date(data$birthdate)
data$years_old <- floor(as.numeric(difftime(as.Date(Sys.Date()),as.Date(data$birthdate),
                                            unit="weeks"))/52.25)
label(data$years_old)="Years old at first visit"

data <- data %>% filter(!is.na(years_old))
data = data[, colSums(is.na(data)) != nrow(data)]
# Verify data integrity
vis_miss(data)

# Export the data to here::here("analysis/data/derived_data/clean_df.Rmd")

final_df <- data
write_rds(final_df, here("analysis/data/raw_data/clean_df.Rds"))
