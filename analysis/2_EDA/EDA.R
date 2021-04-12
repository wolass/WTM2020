# Load packages

pacman::p_load(tidyverse, here, ggpubr)

# Load data cleanded from 1_data_cleaning
df <- read_rds(here("analysis/data/raw_data/clean_df.Rds"))
data <- df$data %>% filter(record_id %in% names(df$json_data))
start <- data %>% filter(redcap_event_name=="initial_visit_arm_1")
end <- data %>% filter(redcap_event_name=="end_of_study_visit_arm_1")
output <- df$output
json_data <- df$json_data
mean_frame <- df$mean_frame
compare_frame <- bind_rows(lapply(output, `[`, c(2)))
compare_frame <- compare_frame$comp_mean
rownames(compare_frame) <- names(json_data)
final_df <- list()

## Perform statistical description of the variables

hist(end$patient_temperature,xlim=c(35,38),main="First Measurment",xlab="Temperature")
hist(end$patient_temperature_2,xlim=c(35,38),main="Second Measurment",xlab="Temperature")
hist(end$patient_temperature_3,xlim=c(35,38),main="Third Measurment",xlab="Temperature")
hist(end$patient_temperature_4,xlim=c(35,38),main="Fourth Measurment",xlab="Temperature")
hist(end$patient_temperature_5,xlim=c(35,38),main="Fifth Measurment",xlab="Temperature")
hist(end$patient_temperature_6,xlim=c(35,38),main="Sixth Measurment",xlab="Temperature")

start %>% summarise(mean_age=mean(years_old))

#no significant differences detected
summary(aov(data=end,patient_temperature~random.factor))
summary(aov(data=end,patient_temperature_2~random.factor))
summary(aov(data=end,patient_temperature_3~random.factor))
summary(aov(data=end,patient_temperature_4~random.factor))
summary(aov(data=end,patient_temperature_5~random.factor))
summary(aov(data=end,patient_temperature_6~random.factor))

#only last significant
summary(aov(data=end,patient_temperature~loc_detail_in_out.factor))
summary(aov(data=end,patient_temperature_2~loc_detail_in_out.factor))
summary(aov(data=end,patient_temperature_3~loc_detail_in_out.factor))
summary(aov(data=end,patient_temperature_4~loc_detail_in_out.factor))
summary(aov(data=end,patient_temperature_5~loc_detail_in_out.factor))
summary(aov(data=end,patient_temperature_6~loc_detail_in_out.factor))

#weird, second manual measurment significant difference between average temperatures
summary(aov(data=end,patient_temperature~gender.factor))
summary(aov(data=end,patient_temperature_2~gender.factor))
summary(aov(data=end,patient_temperature_3~gender.factor))
summary(aov(data=end,patient_temperature_4~gender.factor))
summary(aov(data=end,patient_temperature_5~gender.factor))
summary(aov(data=end,patient_temperature_6~gender.factor))


## Describe the dataset in general. How many patients we have and what we see

barplot_fun <- function(data,var,namex){
  var <- enquo(var)
  data <- data %>% rename(x=!!var)


a <- data %>%
  group_by(x) %>%
  count() %>%
  ggpubr::ggbarplot(
    x = "x",
    fill = "x",
    y = "n",
    label = TRUE, lab.col = "black", lab.vjust = 1.2,
    position = position_dodge2(),
    palette = get_palette(palette = "Oranges",5),
  )+labs(x=namex,y="Proportion")+
  font("xy.text", size = 10, color = "black")+
  theme(legend.position = "none")


a <- ggpar(a,
               font.x = c(11, "bold"),
               font.y = c(11, "bold"),
               font.legend = c(9,"bold"))
return(a)
}
barplot_fun(start,gender.factor,"Gender")
barplot_fun(start,surgery.factor,"Surgery exptected?")
barplot_fun(end,comfort.factor,"Sensor WARMIE rate of comfortable")
barplot_fun(start,random.factor,"Randomization group")

hist(start$years_old,ylim=c(0,20),col="lightblue",main = "Years old Histogram", xlab = "Years old")

mean_frame %>% summarise(mean=mean(mean,na.rm = T),sd_error=mean(sd_error))
compare_frame %>% summarise(min=min(min_temp),max=max(max_temp),mean=mean(mean_temp),sd=mean(sd_temp))


#The majority of patients do not have complete 6 observations compared to manual and sensory measurements. This is due to two conditions:
#- not all patients had 6 manual measurements
#- the nearest sensory measurement occurred at a distance of more than 5 minutes from the manual measurement


## Identify features that are indicative of attaching the sensor



## Identify features that tell us about temperature change (increas decrease)



## Describe the temperature changes in time. What is daily difference sd and trend



## Identify and compare if we can see patterns that are in multiple patients.

output[["10"]]$plot
output[["11"]]$plot
output[["12"]]$plot
output[["13"]]$plot
output[["14"]]$plot
output[["14.5"]]$plot
output[["15"]]$plot
output[["16"]]$plot
output[["17"]]$plot
output[["18"]]$plot
output[["19"]]$plot
output[["2"]]$plot
output[["20"]]$plot
output[["21"]]$plot
output[["22"]]$plot
output[["24"]]$plot
output[["25"]]$plot
output[["26"]]$plot
output[["27"]]$plot
output[["28"]]$plot
output[["29"]]$plot
output[["3"]]$plot
output[["30"]]$plot
output[["31"]]$plot
output[["32"]]$plot
output[["33"]]$plot
output[["34"]]$plot
output[["34.5"]]$plot
output[["35"]]$plot
output[["36"]]$plot
output[["37"]]$plot
output[["38"]]$plot
output[["4"]]$plot
output[["40"]]$plot
output[["41"]]$plot
output[["42"]]$plot
output[["44"]]$plot
output[["45"]]$plot
output[["46"]]$plot
output[["47"]]$plot
output[["48"]]$plot
output[["49"]]$plot
output[["5"]]$plot
output[["50"]]$plot
output[["51"]]$plot
output[["52"]]$plot
output[["53"]]$plot
output[["55"]]$plot
output[["56"]]$plot
output[["57"]]$plot
output[["6"]]$plot
output[["7"]]$plot
output[["8"]]$plot
output[["9"]]$plot

#During the day there is a certain patern, usually during the day temperatures were lower than evening/night.
#In addition, the lowest values often occurred during wake-up hours.

## As an example I would as how many time the tempereature rose and wend down throught a day
# in a given patient.


## Cheack feasability of SPECTRUM ANALYSIS in the analysis of time series data

## Verify if the measurements from the Warmie sensor were similar to the measurements from the standard termometer
# Use Bland-Altman Plots here

## Ideas? modelling? suggestions?

## Export the findings from each section in a Rds file for the paper.
# to here::here("analysis/2_EDA/finding1_feature_extraction.Rmd")
# These objects can follow such structure

finding <- list(
  data,
  figures,
  tables
)



write_rds(final_df, here("analysis/data/raw_data/clean_df.Rds"))
