# Load packages

pacman::p_load(tidyverse, here)

# Load data sets

#tu powinien być skrypt

# Perform data cleaning

# Verify data integrity

# Add or remove variables

# Export the data to here::here("analysis/data/derived_data/clean_df.Rds")

write_rds(final_df, here("analysis/data/derived_data/clean_df.Rds")) # we want to use RDS files instead of csv. 
