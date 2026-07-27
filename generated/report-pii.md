## Potential Personal Identifiable Information (PII)

⚠️ We found the following instances of potentially personally identifying information. This may be completely legitimate but might be worth checking. *As a reminder, privacy legislation in many countries (e.g. GDPR in EU) prohibits the dissemination of personal identifiable information without prior (and documented) consent of individuals.* If indeed you want to publish such information with your replication package, you should probably have obtained IRB approval for this - please check!

**Summary:**
- Data files with PII indicators: 5
- Variables flagged in data: 7
- Code files with PII references: 112
- PII references in code: 3566

### Summary of Flagged Files

| File Type | File | Variables/References | PII Categories |
|-----------|------|----------------------|----------------|
| Data | `figure_reg_emp_con_long_firm.csv` | 1 | name |
| Data | `figure_reg_emp_con_long_sector_sex.csv` | 1 | name |
| Data | `table_hist_con_worker.csv` | 2 | sex, city |
| Data | `table_retirement.csv` | 1 | sex |
| Data | `table_summary_children_multiple2.csv` | 2 | city, sex |
| Code | `functions_moments.R` | 46 | lat, city, sex |
| Code | `functions_reg_emp_con.R` | 223 | child, name, birth, city, district, sex, lat, loc, location |
| Code | `functions_reg_emp_con_long.R` | 230 | child, lon, name, birth, city, district, sex, son, lat |
| Code | `functions_reg_emp_con_long_figure.R` | 47 | lon, block, loc, child, name, birth, city, district, sex |
| Code | `gen_figures.R` | 60 | city, gender, child, lat, lon, name, coord, sex |
| Code | `gen_tables.R` | 333 | child, name, city, gender, sex |
| Code | `master_all.R` | 9 | network, lat, minute, name |
| Code | `master_inter.R` | 29 | name, lat, loc, location, child, lon, sex |
| Code | `master_output.R` | 6 | name, lat |
| Code | `master_simulate.R` | 29 | lat, name, child, loc, birth, father, district, country, location |
| Code | `prepare_akm.R` | 46 | child, name, lat, birth, lname, son |
| Code | `prepare_akm_children.R` | 37 | name, lat, birth, lname, son, child |
| Code | `prepare_akm_res.R` | 27 | child, name, lat, birth |
| Code | `prepare_children_first_job_data.R` | 26 | child, name, sex, birth, city, district |
| Code | `prepare_children_first_job_data_multiple2.R` | 26 | child, name, sex, birth, city, district |
| Code | `prepare_children_panel.R` | 17 | child, name, birth, city, district, sex |
| Code | `prepare_children_panel_employment.R` | 20 | child, name, birth, city, district, sex |
| Code | `prepare_children_panel_employment_25.R` | 21 | child, name, city, district, sex |
| Code | `prepare_children_panel_employment_phantom_past.R` | 19 | child, name, birth, city, district, sex |
| Code | `prepare_children_panel_total_5years.R` | 21 | child, name, sex, city, district |
| Code | `prepare_children_panel_total_5years_multiple2.R` | 21 | child, name, sex, city, district |
| Code | `prepare_children_salary_30.R` | 25 | child, name, birth, lname |
| Code | `prepare_children_sample.R` | 14 | name, child |
| Code | `prepare_children_sample1.R` | 61 | name, child, lat, birth, city, father, mother, sex, loc, location, district, lname |
| Code | `prepare_children_sample1_1927.R` | 61 | name, child, lat, birth, city, father, mother, sex, loc, location, district, lname |
| Code | `prepare_children_sample1_25.R` | 59 | name, child, lat, birth, city, father, mother, sex, loc, location, district, lname |
| Code | `prepare_children_sample1_employment.R` | 59 | name, child, lat, birth, city, father, mother, sex, loc, location, district, lname |
| Code | `prepare_children_sample1_grad1.R` | 58 | name, child, lat, birth, city, father, mother, sex, loc, location, district, lname |
| Code | `prepare_children_sample_1927.R` | 14 | name, child |
| Code | `prepare_children_sample_25.R` | 14 | name, child |
| Code | `prepare_children_sample_employment.R` | 14 | name, child |
| Code | `prepare_children_sample_grad1.R` | 14 | name, child |
| Code | `prepare_connections_employment_rate_25_20.R` | 35 | birth, name, child, lname |
| Code | `prepare_connections_firm_rank.R` | 13 | child, name, lat |
| Code | `prepare_connections_firm_rank_multiple2.R` | 13 | child, name, lat |
| Code | `prepare_connections_id_pco.R` | 8 | birth, name |
| Code | `prepare_connections_indirect.R` | 47 | birth, lat, name, city, sex, child, lname |
| Code | `prepare_connections_indirect_1927.R` | 47 | birth, lat, name, city, sex, child, lname |
| Code | `prepare_connections_indirect_25.R` | 47 | birth, lat, name, city, sex, child, lname |
| Code | `prepare_connections_indirect_grad1.R` | 47 | birth, lat, name, city, sex, child, lname |
| Code | `prepare_connections_indirect_multiple.R` | 8 | birth, name |
| Code | `prepare_connections_indirect_multiple_firm_size.R` | 8 | birth, name |
| Code | `prepare_connections_long.R` | 67 | birth, name, lname, child, lat, city, sex, lon |
| Code | `prepare_connections_phantom_past_employment.R` | 32 | birth, name, child, lname |
| Code | `prepare_connections_type.R` | 13 | name |
| Code | `prepare_connections_type_1927.R` | 8 | name |
| Code | `prepare_connections_type_25.R` | 8 | name |
| Code | `prepare_connections_type_grad1.R` | 8 | name |
| Code | `prepare_connections_type_multiple2.R` | 8 | name |
| Code | `prepare_connections_type_multiple2_firm_size.R` | 8 | name |
| Code | `prepare_duration_first_job.R` | 14 | child, name |
| Code | `prepare_education.R` | 19 | name, lname, school, lat, birth |
| Code | `prepare_employment_history.R` | 4 | name |
| Code | `prepare_employment_history_1927.R` | 4 | name |
| Code | `prepare_firm_duration.R` | 10 | name, child, lat |
| Code | `prepare_firm_location.R` | 26 | name, child, loc, location, lname, lat |
| Code | `prepare_firm_year.R` | 16 | child, name |
| Code | `prepare_industry.R` | 22 | name, lname, lat |
| Code | `prepare_location.R` | 13 | name, lname, district, city, loc, location |
| Code | `prepare_parents.R` | 11 | lat, name, father, mother |
| Code | `prepare_parents_firms.R` | 21 | name, child, birth, lon |
| Code | `prepare_parents_firms_1927.R` | 23 | name, child, birth, lon |
| Code | `prepare_parents_firms_25.R` | 23 | name, child, birth, lon |
| Code | `prepare_parents_firms_employment.R` | 23 | name, child, birth, lon |
| Code | `prepare_parents_firms_firm_size.R` | 21 | name, child, birth |
| Code | `prepare_parents_firms_grad1.R` | 23 | name, child, birth, lon |
| Code | `prepare_population.R` | 32 | lat, name, lname, father, mother, birth, country, sex, city |
| Code | `prepare_sector.R` | 11 | lon, name |
| Code | `prepare_summary_children_multiple2.R` | 25 | child, name, sex, birth, city |
| Code | `prepare_wages.R` | 35 | lat, name, birth, lname |
| Code | `prepare_wages_1927.R` | 35 | lat, name, birth, lname |
| Code | `prepare_wages_total.R` | 38 | son, child, lat, name, birth, lname |
| Code | `simulate_all_population.R` | 20 | lat, name, birth, father, mother, child, country, son |
| Code | `simulate_crosswalks.R` | 12 | lat, birth, country, name, loc |
| Code | `simulate_education.R` | 7 | lat, birth |
| Code | `simulate_hardi.R` | 2 | lat |
| Code | `simulate_location.R` | 11 | lat, loc, location, district, city, name, son |
| Code | `simulate_wages.R` | 22 | lat, name, child, birth, son |
| Code | `tabels_hist_group_size.R` | 17 | child, name, city, sex, district |
| Code | `tables_children_panel.R` | 12 | child, name, city, sex, district |
| Code | `tables_firm_var_sector.R` | 21 | name, child, son |
| Code | `tables_hist_con.R` | 68 | name, child, city, sex, lon |
| Code | `tables_hist_con_firmsize_multiple2.R` | 8 | name |
| Code | `tables_raw_emp_con.R` | 10 | child, name |
| Code | `tables_reg_balancing.R` | 22 | name, child |
| Code | `tables_reg_children_panel_employment.R` | 4 | child, name |
| Code | `tables_reg_emp_con.R` | 38 | name, child, city, sex |
| Code | `tables_reg_emp_con_1927.R` | 38 | name, child, city, sex |
| Code | `tables_reg_emp_con_1927_entry_age.R` | 36 | name, child, birth, city, sex |
| Code | `tables_reg_emp_con_25.R` | 38 | name, child, city, sex |
| Code | `tables_reg_emp_con_exit.R` | 22 | name, child |
| Code | `tables_reg_emp_con_grad1.R` | 38 | name, child, city, sex |
| Code | `tables_reg_emp_con_long_figure.R` | 34 | lon, name, child, sex, city |
| Code | `tables_reg_emp_con_long_firm.R` | 24 | lon, name, child |
| Code | `tables_reg_emp_con_long_sector_sex.R` | 27 | lon, name, sex, child |
| Code | `tables_reg_emp_con_long_year.R` | 26 | lon, name, child |
| Code | `tables_reg_emp_con_multiple2.R` | 32 | name, child, city, sex |
| Code | `tables_reg_emp_con_multiple2_firm_size.R` | 29 | name, child |
| Code | `tables_reg_emp_con_multiple_jobs.R` | 35 | name, child |
| Code | `tables_reg_emp_con_one_job.R` | 49 | name, child, city, sex |
| Code | `tables_reg_emp_con_placebo.R` | 34 | lon, name, child, city, sex |
| Code | `tables_reg_panel_total_5years_multiple2.R` | 4 | child, name |
| Code | `tables_reg_salary_duration_con_event.R` | 21 | child, name, city, sex, district |
| Code | `tables_reg_salary_duration_con_multiple2.R` | 41 | child, name, city, sex, district |
| Code | `tables_retirement.R` | 41 | lat, name, birth, sex, lname |
| Code | `tables_structural_data_multiple2.R` | 29 | child, name, birth, city, sex |
| Code | `tables_summary_children_multiple2.R` | 17 | child, name, city, sex |
| Code | `tables_summary_firms.R` | 4 | name |
| Code | `‏‏functions_reg_emp_con_25.R` | 33 | child, name, birth, city, district, sex |
| Code | `‏‏tables_reg_emp_con_event_multiple2.R` | 24 | name, child |
| Code | `‏‏‏‏functions_reg_emp_con_grad1.R` | 33 | child, name, birth, city, district, sex |
| Code | `‏‏‏‏tables_reg_emp_con_long_int.r` | 23 | lon, name, child |

*See [Appendix](report-pii-appendix.md) for detailed listing of all flagged instances.*
