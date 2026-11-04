
#libs and global settings 
library(tidyverse)
library(gtsummary)
library(knitr)
library(janitor)

here::i_am("final/code/0_clean.R")


## Load data
#Data loaded from data.cdc.gov via url.
data_url <- "https://data.cdc.gov/resource/atcp-73re.csv?$limit=50000"

raw_data <- read_csv(data_url) %>% 
  clean_names()

glimpse(raw_data)



#Clean data from loaded raw data 
clean_data <- raw_data %>%
  mutate(
    site_wval = as.numeric(site_wval)
  ) %>%
  filter(!is.na(week_end))

write_csv(
  clean_data,
  file = here::here("final", "Data" , "clean_data.csv")
  )

saveRDS(
  clean_data,
  file = here::here("final/data/clean_data.rds")
)

print("0_clean worked.")
