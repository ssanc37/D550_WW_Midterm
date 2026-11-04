R_LIBS_USER := C:/Users/sanch/AppData/Local/R/win-library/4.5
	export R_LIBS_USER


final/report.html: WW_project_v2.Rmd output/01_clean_data output/02_summary_table output/03_spatial_graph code/3_render.R
	Rscript code/3_render.R


output/01_clean_data: code/0_clean.R
	Rscript code/0_clean.R


output/02_summary_table: code/1_table.R
	Rscript code/1_table.R


output/03_spatial_graph: code/2_graph.R
	Rscript code/2_graph.R
