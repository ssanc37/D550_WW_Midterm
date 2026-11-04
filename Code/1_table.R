library(here)
library(gtsummary)
library(dplyr)



here::i_am("final/code/1_table.R")


clean_data<-readRDS(
  file = here::here("final/data/clean_data.rds")
)


summary_tbl <- clean_data %>%
  select(pathogen_target, site_wval_category, site_wval) %>%
  tbl_summary(
    by = pathogen_target,
    label = list(
      site_wval_category ~ "Activity Category",
      site_wval ~ "Site Metric (WVAL)"
    ),
    statistic = list(
      all_continuous() ~ "{mean} ({sd}) [Med: {median}]",
      all_categorical() ~ "{n} ({p}%)"
    ),
    missing = "no"
  ) %>%
  add_overall() %>%
  bold_labels()

summary_tbl


weekly_trends <- clean_data %>%
  group_by(week_end, pathogen_target) %>%
  summarize(
    mean_wval = mean(site_wval, na.rm = TRUE),
    facility_count = n(),
    .groups = "drop"
  )


saveRDS(
  summary_tbl,
  file = here::here("final/data/summary_tbl.rds")
)
saveRDS(
  weekly_trends,
  file = here::here("final/data/weekly_trends.rds")
)


print("1_table worked.")

