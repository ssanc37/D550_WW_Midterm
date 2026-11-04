# Data_550_WW_Midterm READ.me 


Repository at https://github.com/ssanc37/D550_WW_Midterm
Repository for the midterm project evaluating wastewater surveillance datasets using quantitative and statistical methods.

## Repository Contents
- **`final/code/`**: Scripts to render the final HTML report
0_clean.R
1_table.R
2_graph.R 
3_render.R

- **`final/Data/`**: The processed dataset generated automatically by the pipeline
clean_data.csv
clean_data.rds
summary_tbl.rds
weekly_trends.rds
graph.png

- **`final/WW_project_v1.Rmd`**: Full version of report, no make or git use
- **`final/WW_project_v1.html`**: HTML version of markdown report 
- **`final/WW_project_v2.Rmd`**: The primary R Markdown report 
- **`final/WW_project_v2.html`**: HTML version of markdown report 
- **`Makefile`**: Automation script to execute the data pipeline and render the report.

---

## How to Generate the Final Report

You can compile the entire project from the command line using GNU Make:
```
make