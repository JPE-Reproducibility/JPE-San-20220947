###########################################################################
## master_inter.R  --  STAGE 1 driver (BTL / INTER pipeline)
##
## Reads the raw files (data/raw, data/input/excel), runs every prepare_*.R to
## build intermediate .Rdata (data/inter), then every tables_*.R to write the
## analysis CSVs (output/csv) that Stage 2 reads.
##
## This is the stage that runs INSIDE the CBS/BTL environment on the real
## microdata; on the synthetic run it does exactly the same thing on the fake
## raw files produced by Stage 0.
##
## Paths (process, raw, excel, data, temp, output, log) are inherited from
## master_all.R. This file does NOT rm(list=ls()), so it can be sourced by
## master_all without wiping the driver's objects.
###########################################################################

## ---- 0. Guard: paths must come from master_all.R ----
if (!exists("process") || !exists("data") || !exists("output") || !exists("log"))
  stop("Run this via master_all.R (it defines root and all paths).")

## ---- 1. Packages for this stage ----
inter_pkgs <- c("readxl", "data.table", "ggplot2", "haven", "lfe",
                "stargazer", "stringr", "lubridate", "survival", "plotrix")
for (p in inter_pkgs) {
  if (!requireNamespace(p, quietly = TRUE))
    stop("Missing required package: ", p, ". Install it, then re-run.")
  library(p, character.only = TRUE)
}

## ---- 2. Logging ----
## clear any sink left open by an earlier failed run, then open this stage's log.
## (several tables_*.R open their own sinks; the drain at the end closes those.)
while (sink.number() > 0) sink()
closeAllConnections()
setwd(process)
today <- lubridate::today()
sink(file = paste0(log, "log_inter_", today, ".txt"), split = TRUE)

## ---- 3. Build intermediates (prepare_*) ----
source(paste0(process, "prepare_population.R"))
source(paste0(process, "prepare_location.R"))
source(paste0(process, "prepare_education.R"))
source(paste0(process, "prepare_parents.R"))
source(paste0(process, "prepare_wages.R"))
source(paste0(process, "prepare_wages_total.R"))
source(paste0(process, "prepare_industry.R"))
source(paste0(process, "prepare_sector.R"))
source(paste0(process, "prepare_employment_history.R"))
source(paste0(process, "prepare_children_sample1.R"))
source(paste0(process, "prepare_parents_firms.R"))
source(paste0(process, "prepare_children_sample.R"))
source(paste0(process, "prepare_firm_location.R"))
source(paste0(process, "prepare_akm.R"))
source(paste0(process, "prepare_connections_indirect.R"))
source(paste0(process, "prepare_connections_type.R"))
source(paste0(process, "prepare_connections_id_pco.R"))
source(paste0(process, "prepare_connections_long.R"))
source(paste0(process, "prepare_connections_firm_rank.R"))
source(paste0(process, "prepare_children_first_job_data.R"))
source(paste0(process, "prepare_children_panel.R"))
source(paste0(process, "prepare_connections_indirect_multiple.R"))
source(paste0(process, "prepare_connections_type_multiple2.R"))
source(paste0(process, "prepare_children_first_job_data_multiple2.R"))
source(paste0(process, "prepare_children_sample1_25.R"))
source(paste0(process, "prepare_parents_firms_25.R"))
source(paste0(process, "prepare_children_sample_25.R"))
source(paste0(process, "prepare_connections_indirect_25.R"))
source(paste0(process, "prepare_connections_type_25.R"))
source(paste0(process, "prepare_wages_1927.R"))
source(paste0(process, "prepare_employment_history_1927.R"))
source(paste0(process, "prepare_children_sample1_1927.R"))
source(paste0(process, "prepare_parents_firms_1927.R"))
source(paste0(process, "prepare_children_sample_1927.R"))
source(paste0(process, "prepare_connections_indirect_1927.R"))
source(paste0(process, "prepare_connections_type_1927.R"))
source(paste0(process, "prepare_children_sample1_grad1.R"))
source(paste0(process, "prepare_parents_firms_grad1.R"))
source(paste0(process, "prepare_children_sample_grad1.R"))
source(paste0(process, "prepare_connections_indirect_grad1.R"))
source(paste0(process, "prepare_connections_type_grad1.R"))
source(paste0(process, "prepare_akm_children.R"))
source(paste0(process, "prepare_akm_res.R"))
source(paste0(process, "prepare_firm_duration.R"))
source(paste0(process, "prepare_connections_indirect_multiple_firm_size.R"))
source(paste0(process, "prepare_parents_firms_firm_size.R"))
source(paste0(process, "prepare_connections_type_multiple2_firm_size.R"))
source(paste0(process, "prepare_children_sample1_employment.R"))
source(paste0(process, "prepare_parents_firms_employment.R"))
source(paste0(process, "prepare_children_sample_employment.R"))
source(paste0(process, "prepare_connections_phantom_past_employment.R"))
source(paste0(process, "prepare_connections_firm_rank_multiple2.R"))
source(paste0(process, "prepare_children_panel_employment.R"))
source(paste0(process, "prepare_summary_children_multiple2.R"))
source(paste0(process, "prepare_children_panel_total_5years_multiple2.R"))

## ---- 4. Build the analysis CSVs (tables_*) ----
source(paste0(process, "tables_summary_children_multiple2.R"))
source(paste0(process, "tables_summary_firms.R"))
source(paste0(process, "tables_raw_emp_con.R"))
source(paste0(process, "tables_reg_emp_con.R"))
source(paste0(process, "tables_reg_emp_con_multiple2.R"))
source(paste0(process, "tables_retirement.R"))
source(paste0(process, "tables_reg_emp_con_exit.R"))
source(paste0(process, "tables_reg_balancing.R"))
source(paste0(process, "tables_reg_emp_con_placebo.R"))
source(paste0(process, "tables_reg_emp_con_long_figure.R"))
source(paste0(process, "tables_reg_emp_con_long_year.R"))
source(paste0(process, "tables_reg_salary_duration_con_multiple2.R"))
source(paste0(process, "tables_reg_salary_duration_con_event.R"))
source(paste0(process, "tables_children_panel.R"))
source(paste0(process, "tables_structural_data_multiple2.R"))
source(paste0(process, "tables_reg_emp_con_25.R"))
source(paste0(process, "tables_reg_emp_con_grad1.R"))
source(paste0(process, "tables_reg_emp_con_1927.R"))
source(paste0(process, "tables_reg_emp_con_1927_entry_age.R"))
source(paste0(process, "tables_reg_emp_con_one_job.R"))
source(paste0(process, "tables_reg_emp_con_multiple_jobs.R"))
source(paste0(process, "tables_reg_emp_con_long_firm.R"))
source(paste0(process, "tables_firm_var_sector.R"))
source(paste0(process, "tables_reg_emp_con_long_sector_sex.R"))
source(paste0(process, "tables_reg_emp_con_multiple2_firm_size.R"))
source(paste0(process, "tables_reg_children_panel_employment.R"))
source(paste0(process, "tables_reg_panel_total_5years_multiple2.R"))
source(paste0(process, "tables_hist_con.R"))
source(paste0(process, "tabels_hist_group_size.R"))
source(paste0(process, "tables_hist_con_firmsize_multiple2.R"))

## ---- 5. Close this stage's log + any sinks left open by the scripts ----
while (sink.number() > 0) sink()
closeAllConnections()

message("Stage 1 complete. Intermediates -> ", data, " | Analysis CSVs -> ", output)