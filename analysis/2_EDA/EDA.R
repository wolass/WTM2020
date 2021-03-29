# Load packages

pacman::p_load(tidyverse, here, ggpubr)

# Load data cleanded from 1_data_cleaning
df <- read_rds(here("analysis/data/raw_data/clean_df.Rds"))
first <- df %>% filter(redcap_event_name=="initial_visit_arm_1")
last <- df %>% filter(redcap_event_name=="end_of_study_visit_arm_1")
# Perform statistical description of the variables


# Describe the dataset in general. How many patients we have and what we see

# Identify features that are indicative of attaching the sensor

# Identify features that tell us about temperature change (increas decrease)

# Describe the temperature changes in time. What is daily difference sd and trend

# Identify and compare if we can see patterns that are in multiple patients.
# As an example I would as how many time the tempereature rose and wend down throught a day
# in a given patient.

# Cheack feasability of SPECTRUM ANALYSIS in the analysis of time series data

# Verify if the measurements from the Warmie sensor were similar to the measurements from the standard termometer
# Use Bland-Altman Plots here

# Ideas? modelling? suggestions?

# Export the findings from each section in a Rds file for the paper.
# to here::here("analysis/2_EDA/finding1_feature_extraction.Rmd")
# These objects can follow such structure

finding <- list(
  data,
  figures,
  tables
)



write_rds(final_df, here("analysis/data/derived_data/clean_df.Rmd"))
