
library(ggplot2)


here::i_am("final/code/2_graph.R")


clean_data<-readRDS(
  file = here::here("final/data/clean_data.rds")
)


weekly_trends<-readRDS(
  file = here::here("final/data/weekly_trends.rds")
)




graph <- 
ggplot(weekly_trends, aes(x = week_end, y = mean_wval, color = pathogen_target)) +
  geom_line(linewidth = 1.1) +
  geom_point(size = 1.8, alpha = 0.7) +
  scale_color_brewer(palette = "Set1", name = "Pathogen") +
  scale_x_date(date_breaks = "1 month", date_labels = "%b %Y") +
  labs(
    title = "National Mean Wastewater Viral Activity Level: 2026",
    x = "Reporting Week End Date",
    y = "Mean Site WVAL"
  ) +
  theme_minimal(base_size = 12) +
  theme(
    legend.position = "top",
    panel.grid.minor = element_blank(),
    axis.text.x = element_text(angle = 45, hjust = 1),
    plot.title = element_text(face = "bold", size = 14)
  )


ggsave(
  graph,
  file = here::here("final/data/graph.png"),
  device ="png"
)


print("2_graph worked.")
