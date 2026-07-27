## Appendix: Detailed PII Detection Results

*Generated on 2026-07-27 12:39:47*

This appendix lists all detected instances of potential personally identifiable information (PII) in the project files. Each entry shows the matched PII terms and, for data files, sample values to help verify whether the flagged content is indeed sensitive.

### Data Files

**/replication-package/labor_networks/output/csv_real/figure_reg_emp_con_long_firm.csv**

- Variable: `list_l_names`
  - Matched terms: name
  - Sample values: bin_var, diff1, diff1_sd

**/replication-package/labor_networks/output/csv_real/figure_reg_emp_con_long_sector_sex.csv**

- Variable: `list_l_names`
  - Matched terms: name
  - Sample values: did1, did1_sd, did1_lb

**/replication-package/labor_networks/output/csv_real/table_hist_con_worker.csv**

- Variable: `ethnicity`
  - Matched terms: city
  - Sample values: -1, 0, 1
- Variable: `sex`
  - Matched terms: sex
  - Sample values: -1, 0, 1

**/replication-package/labor_networks/output/csv_real/table_retirement.csv**

- Variable: `sex`
  - Matched terms: sex
  - Sample values: 0, 1

**/replication-package/labor_networks/output/csv_real/table_summary_children_multiple2.csv**

- Variable: `ethnicity`
  - Matched terms: city
  - Sample values: 0.288864433031711, 0.0, 1.0
- Variable: `sex`
  - Matched terms: sex
  - Sample values: 0.428308107569541, 0.489711698286238, 0.277142812348118

### Code Files

**/replication-package/labor_networks/code/inter/functions_moments.R**

- Line 1: lat
  ```
  # calculate moments
  ```
- Line 32: city
  ```
  by = c( "year","ethnicity", "job_type")]
  ```
- Line 33: city
  ```
  d <- CJ( year = 1:T, ethnicity=0:1, job_type=1:Y)
  ```
- Line 34: city
  ```
  table_temp <- merge(table_temp,d,by = c("year","ethnicity", "job_type"),all = TRUE)
  ```
- Line 38: city
  ```
  by = c( "year","ethnicity")]
  ```
- Line 40: city
  ```
  table_temp <- merge(table_temp,table_temp1, by =  c( "year","ethnicity") )
  ```
- Line 42: city
  ```
  table_temp <- table_temp[ethnicity == 1 & job_type > 1]
  ```
- Line 70: sex
  ```
  # matches by sex-y groups
  ```
- Line 72: sex
  ```
  by = c( "year","sex", "job_type")]
  ```
- Line 73: sex
  ```
  d <- CJ( year = 1:T, sex=0:1, job_type=1:Y)
  ```
- Line 74: sex
  ```
  table_temp <- merge(table_temp,d,by = c("year","sex", "job_type"),all = TRUE)
  ```
- Line 78: sex
  ```
  by = c( "year","sex")]
  ```
- Line 80: sex
  ```
  table_temp <- merge(table_temp,table_temp1, by =  c( "year","sex") )
  ```
- Line 82: sex
  ```
  table_temp <- table_temp[sex == 1 & job_type > 1]
  ```
- Line 95: city
  ```
  by = c( "year","ethnicity", "con_type")]
  ```
- Line 96: city
  ```
  d <- CJ( year = 1:T, ethnicity=0:1, con_type=0:C)
  ```
- Line 97: city
  ```
  table_temp <- merge(table_temp,d,by = c("year","ethnicity", "con_type"),all = TRUE)
  ```
- Line 101: city
  ```
  by = c( "year","ethnicity")]
  ```
- Line 103: city
  ```
  table_temp <- merge(table_temp,table_temp1, by =  c( "year","ethnicity") )
  ```
- Line 105: city
  ```
  table_temp <- table_temp[ethnicity == 1 & con_type > 0]
  ```
- Line 133: sex
  ```
  # matches by sex-c groups
  ```
- Line 135: sex
  ```
  by = c( "year","sex", "con_type")]
  ```
- Line 136: sex
  ```
  d <- CJ( year = 1:T, sex=0:1, con_type=0:C)
  ```
- Line 137: sex
  ```
  table_temp <- merge(table_temp,d,by = c("year","sex", "con_type"),all = TRUE)
  ```
- Line 141: sex
  ```
  by = c( "year","sex")]
  ```
- Line 143: sex
  ```
  table_temp <- merge(table_temp,table_temp1, by =  c( "year","sex") )
  ```
- Line 145: sex
  ```
  table_temp <- table_temp[sex == 1 & con_type > 0]
  ```
- Line 176: city
  ```
  # wages by ethnicity groups
  ```
- Line 177: city
  ```
  table_temp <- sdata[,.(w = mean(y1)) , by = c("year", "ethnicity")]
  ```
- Line 178: city
  ```
  table_temp[ethnicity == 0,w_temp := w]
  ```
- Line 181: city
  ```
  table_temp <- table_temp[ethnicity == 1]
  ```
- Line 192: sex
  ```
  # wages by sex groups
  ```
- Line 193: sex
  ```
  table_temp <- sdata[,.(w = mean(y1)) , by = c("year", "sex")]
  ```
- Line 194: sex
  ```
  table_temp[sex == 0,w_temp := w]
  ```
- Line 197: sex
  ```
  table_temp <- table_temp[sex == 1]
  ```
- Line 219: lat
  ```
  ## 9. relative wages by gy groups
  ```
- Line 221: city
  ```
  # wages by ethnicity groups
  ```
- Line 222: city
  ```
  table_temp <- sdata[ethnicity == 1,.(w = mean(y1)) , by = c("year", "job_type")]
  ```
- Line 241: sex
  ```
  # wages by sex groups
  ```
- Line 242: sex
  ```
  table_temp <- sdata[sex == 1,.(w = mean(y1)) , by = c("year", "job_type")]
  ```
- Line 255: lat
  ```
  ## 10. relative wages by gc groups
  ```
- Line 257: city
  ```
  # wages by ethnicity groups
  ```
- Line 258: city
  ```
  table_temp <- sdata[ethnicity == 1,.(w = mean(y1)) , by = c("year", "con_type")]
  ```
- Line 277: sex
  ```
  # wages by sex groups
  ```
- Line 278: sex
  ```
  table_temp <- sdata[sex == 1,.(w = mean(y1)) , by = c("year", "con_type")]
  ```
- Line 291: lat
  ```
  ## 11. relative wages by yc groups
  ```

**/replication-package/labor_networks/code/inter/functions_reg_emp_con.R**

- Line 5: child
  ```
  get.reg.emp.con.data <- function(df_children,
  ```
- Line 9: name
  ```
  filename <- paste0(data,connections_file )
  ```
- Line 10: name
  ```
  load(filename)
  ```
- Line 13: child
  ```
  df_connections <- merge(df_connections,df_children[,.(id,year)], by = "id")
  ```
- Line 16: child
  ```
  # gen groups of children
  ```
- Line 17: child
  ```
  df_children[,education := 1* (education > 0)]
  ```
- Line 18: birth, child, city, district, sex
  ```
  df_groups <- df_children[,.(n = .N), by = c("year","birth_year","ethnicity","sex","education","distr
  ```
- Line 21: birth, child, city, district, sex
  ```
  df_children = merge(df_children,df_groups, by = c("year","birth_year","ethnicity","sex","education",
  ```
- Line 24: child
  ```
  # get the group of each child in the connections data
  ```
- Line 25: child
  ```
  df_connections <- merge(df_children[,.(id,group)], df_connections, by = "id")
  ```
- Line 29: child
  ```
  df_employment <- df_children[,.(id,id_firm)]
  ```
- Line 38: child
  ```
  df_employment_group <- merge(df_employment_group,df_children[,.(id,group)], by = "id")
  ```
- Line 45: child
  ```
  # get the number of children in each group
  ```
- Line 94: city, sex
  ```
  df_reg <- merge(df_reg,df_groups[,.(group,ethnicity,sex,education)], by = "group")
  ```
- Line 102: child
  ```
  get.reg.emp.con.data.multiple2 <- function(df_children,
  ```
- Line 106: name
  ```
  filename <- paste0(data,connections_file )
  ```
- Line 107: name
  ```
  load(filename)
  ```
- Line 110: child
  ```
  df_connections <- merge(df_connections,df_children[,.(id,year)], by = "id")
  ```
- Line 113: child
  ```
  # gen groups of children
  ```
- Line 114: child
  ```
  df_children[,education := 1* (education > 0)]
  ```
- Line 115: birth, child, city, district, sex
  ```
  df_groups <- df_children[,.(n = .N), by = c("year","birth_year","ethnicity","sex","education","distr
  ```
- Line 118: birth, child, city, district, sex
  ```
  df_children = merge(df_children,df_groups, by = c("year","birth_year","ethnicity","sex","education",
  ```
- Line 121: child
  ```
  # get the group of each child in the connections data
  ```
- Line 122: child
  ```
  df_connections <- merge(df_children[,.(id,group)], df_connections, by = "id")
  ```
- Line 126: child
  ```
  df_employment <- df_children[,.(id,id_firm)]
  ```
- Line 135: child
  ```
  df_employment_group <- merge(df_employment_group,df_children[,.(id,group)], by = "id")
  ```
- Line 142: child
  ```
  # get the number of children in each group
  ```
- Line 179: city, sex
  ```
  df_reg <- merge(df_reg,df_groups[,.(group,ethnicity,sex,education)], by = "group")
  ```
- Line 188: child
  ```
  get.reg.emp.con.data.multiple2.firm.size <- function(df_children,min_size,max_size,type) {
  ```
- Line 194: name
  ```
  filename <- paste0(data,connections_file )
  ```
- Line 195: name
  ```
  load(filename)
  ```
- Line 198: child
  ```
  df_connections <- merge(df_connections,df_children[,.(id,year)], by = "id")
  ```
- Line 212: child
  ```
  # gen groups of children
  ```
- Line 213: child
  ```
  df_children[,education := 1* (education > 0)]
  ```
- Line 214: birth, child, city, district, sex
  ```
  df_groups <- df_children[,.(n = .N), by = c("year","birth_year","ethnicity","sex","education","distr
  ```
- Line 217: birth, child, city, district, sex
  ```
  df_children = merge(df_children,df_groups, by = c("year","birth_year","ethnicity","sex","education",
  ```
- Line 220: child
  ```
  # get the group of each child in the connections data
  ```
- Line 221: child
  ```
  df_connections <- merge(df_children[,.(id,group)], df_connections, by = "id")
  ```
- Line 225: child
  ```
  df_employment <- df_children[,.(id,id_firm)]
  ```
- Line 234: child
  ```
  df_employment_group <- merge(df_employment_group,df_children[,.(id,group)], by = "id")
  ```
- Line 241: child
  ```
  # get the number of children in each group
  ```
- Line 278: city, sex
  ```
  df_reg <- merge(df_reg,df_groups[,.(group,ethnicity,sex,education)], by = "group")
  ```
- Line 287: child
  ```
  get.reg.emp.con.data.multiple <- function(df_children,
  ```
- Line 291: name
  ```
  filename <- paste0(data,connections_file )
  ```
- Line 292: name
  ```
  load(filename)
  ```
- Line 295: child
  ```
  df_connections <- merge(df_connections,df_children[,.(id,year)], by = "id")
  ```
- Line 298: child
  ```
  # gen groups of children
  ```
- Line 299: child
  ```
  df_children[,education := 1* (education > 0)]
  ```
- Line 300: birth, child, city, district, sex
  ```
  df_groups <- df_children[,.(n = .N), by = c("year","birth_year","ethnicity","sex","education","distr
  ```
- Line 303: birth, child, city, district, sex
  ```
  df_children = merge(df_children,df_groups, by = c("year","birth_year","ethnicity","sex","education",
  ```
- Line 306: child
  ```
  # get the group of each child in the connections data
  ```
- Line 307: child
  ```
  df_connections <- merge(df_children[,.(id,group)], df_connections, by = "id")
  ```
- Line 311: child
  ```
  df_employment <- df_children[,.(id,id_firm)]
  ```
- Line 320: child
  ```
  df_employment_group <- merge(df_employment_group,df_children[,.(id,group)], by = "id")
  ```
- Line 327: child
  ```
  # get the number of children in each group
  ```
- Line 360: city, sex
  ```
  df_reg <- merge(df_reg,df_groups[,.(group,ethnicity,sex,education)], by = "group")
  ```
- Line 372: child
  ```
  get.reg.emp.con.data.exit <- function(df_children) {
  ```
- Line 375: name
  ```
  filename <- paste0(data, "connections_type.Rdata")
  ```
- Line 376: name
  ```
  load(filename)
  ```
- Line 379: child
  ```
  df_connections <- merge(df_connections,df_children[,.(id,year)], by = "id")
  ```
- Line 382: child
  ```
  # gen groups of children
  ```
- Line 383: child
  ```
  df_children[,education := 1* (education > 0)]
  ```
- Line 384: birth, child, city, district, sex
  ```
  df_groups <- df_children[,.(n = .N), by = c("year","birth_year","ethnicity","sex","education","distr
  ```
- Line 387: birth, child, city, district, sex
  ```
  df_children = merge(df_children,df_groups, by = c("year","birth_year","ethnicity","sex","education",
  ```
- Line 390: child
  ```
  # get the group of each child in the connections data
  ```
- Line 391: child
  ```
  df_connections <- merge(df_children[,.(id,group)], df_connections, by = "id")
  ```
- Line 395: child
  ```
  df_employment <- df_children[,.(id,id_firm)]
  ```
- Line 404: child
  ```
  df_employment_group <- merge(df_employment_group,df_children[,.(id,group)], by = "id")
  ```
- Line 411: child
  ```
  # get the number of children in each group
  ```
- Line 432: child
  ```
  rm(df_children,df_employment)
  ```
- Line 435: name
  ```
  filename <- paste0(data, "connections_id_pco.Rdata")
  ```
- Line 436: name
  ```
  load(filename)
  ```
- Line 440: lat
  ```
  # load the population data
  ```
- Line 441: lat, name
  ```
  filename <- paste0(data, "population.Rdata")
  ```
- Line 442: name
  ```
  load(filename)
  ```
- Line 443: birth, lat, sex
  ```
  df_population <- df[,.(id,birth_year,sex,death_year)]
  ```
- Line 446: sex
  ```
  # get the age, sex, and death year of the coworkers
  ```
- Line 447: lat
  ```
  df_connections <- merge(df_connections,df_population, by.x = "id_pco", by.y = "id", all.x = TRUE)
  ```
- Line 448: lat
  ```
  rm(df_population)
  ```
- Line 457: birth, sex
  ```
  df_connections[,retirement := 1 * ( ((sex == 0 )& (year + max_lag  - birth_year == 67)) | ((sex == 1
  ```
- Line 490: child
  ```
  get.reg.emp.con.data.placebo <- function(df_children) {
  ```
- Line 494: name
  ```
  filename <- paste0(data, "connections_type.Rdata")
  ```
- Line 495: name
  ```
  load(filename)
  ```
- Line 498: child
  ```
  df_connections <- merge(df_connections,df_children[,.(id,year)], by = "id")
  ```
- Line 501: child
  ```
  # gen groups of children
  ```
- Line 502: child
  ```
  df_children[,education := 1* (education > 0)]
  ```
- Line 503: birth, child, city, district, sex
  ```
  df_groups <- df_children[,.(n = .N), by = c("year","birth_year","ethnicity","sex","education","distr
  ```
- Line 506: birth, child, city, district, sex
  ```
  df_children = merge(df_children,df_groups, by = c("year","birth_year","ethnicity","sex","education",
  ```
- Line 508: child
  ```
  # for each child, find another random child at the same group
  ```
- Line 509: child
  ```
  df_children[,id_placebo := sample(id), by = "group"]
  ```
- Line 513: child
  ```
  df_connections <- merge(df_children[,.(id,id_placebo,group)], df_connections, by = "id")
  ```
- Line 517: child
  ```
  df_employment <- df_children[,.(id,id_firm)]
  ```
- Line 526: child
  ```
  df_employment_group <- merge(df_employment_group,df_children[,.(id,group)], by = "id")
  ```
- Line 533: child
  ```
  # get the number of children in each group
  ```
- Line 554: child
  ```
  rm(df_children,df_employment)
  ```
- Line 586: city, sex
  ```
  df_reg <- merge(df_reg,df_groups[,.(group,ethnicity,sex,education)], by = "group")
  ```
- Line 596: child
  ```
  get.reg.balancing.data <- function(df_children) {
  ```
- Line 598: loc, location
  ```
  # load the firm locations of firms in the 5-500 dataset
  ```
- Line 599: loc, location, name
  ```
  filename <- paste0(data, "firm_location.Rdata")
  ```
- Line 600: name
  ```
  load(filename)
  ```
- Line 605: name
  ```
  filename <- paste0(data, "firm_industry.Rdata")
  ```
- Line 606: name
  ```
  load(filename)
  ```
- Line 616: name
  ```
  filename <- paste0(data, "parents_firms.Rdata")
  ```
- Line 617: name
  ```
  load(filename)
  ```
- Line 627: name
  ```
  filename <- paste0(data, "connections_type.Rdata")
  ```
- Line 628: name
  ```
  load(filename)
  ```
- Line 631: child
  ```
  df_connections <- merge(df_connections,df_children[,.(id,year)], by = "id")
  ```
- Line 634: child
  ```
  # gen groups of children
  ```
- Line 635: child
  ```
  df_children[,education := 1* (education > 0)]
  ```
- Line 636: birth, child, city, district, sex
  ```
  df_groups <- df_children[,.(n = .N), by = c("year","birth_year","ethnicity","sex","education","distr
  ```
- Line 639: birth, child, city, district, sex
  ```
  df_children = merge(df_children,df_groups, by = c("year","birth_year","ethnicity","sex","education",
  ```
- Line 642: child
  ```
  # get the group of each child in the connections data
  ```
- Line 643: child
  ```
  df_connections <- merge(df_children[,.(id,group)], df_connections, by = "id")
  ```
- Line 666: child
  ```
  # get children information
  ```
- Line 667: child
  ```
  df_connections1 = merge(df_connections1,df_children[,.(id,X,Y)],
  ```
- Line 674: child, lat, loc, location
  ```
  # calculate the distance between the firm and the child locations
  ```
- Line 715: child
  ```
  df_employment <- df_children[,.(id,id_firm)]
  ```
- Line 724: child
  ```
  df_employment_group <- merge(df_employment_group,df_children[,.(id,group)], by = "id")
  ```
- Line 731: child
  ```
  # get the number of children in each group
  ```
- Line 752: child
  ```
  rm(df_children,df_employment,df_groups)
  ```
- Line 775: child
  ```
  get.reg.emp.con.data.rob1 <- function(df_children) {
  ```
- Line 778: name
  ```
  filename <- paste0(data, "connections_type_rob1.Rdata")
  ```
- Line 779: name
  ```
  load(filename)
  ```
- Line 782: child
  ```
  df_connections <- merge(df_connections,df_children[,.(id,year)], by = "id")
  ```
- Line 785: child
  ```
  # gen groups of children
  ```
- Line 786: child
  ```
  df_children[,education := 1* (education > 0)]
  ```
- Line 787: birth, child, city, district, sex
  ```
  df_groups <- df_children[,.(n = .N), by = c("year","birth_year","ethnicity","sex","education","distr
  ```
- Line 790: birth, child, city, district, sex
  ```
  df_children = merge(df_children,df_groups, by = c("year","birth_year","ethnicity","sex","education",
  ```
- Line 793: child
  ```
  # get the group of each child in the connections data
  ```
- Line 794: child
  ```
  df_connections <- merge(df_children[,.(id,group)], df_connections, by = "id")
  ```
- Line 798: child
  ```
  df_employment <- df_children[,.(id,id_firm)]
  ```
- Line 807: child
  ```
  df_employment_group <- merge(df_employment_group,df_children[,.(id,group)], by = "id")
  ```
- Line 814: child
  ```
  # get the number of children in each group
  ```
- Line 846: city, sex
  ```
  df_reg <- merge(df_reg,df_groups[,.(group,ethnicity,sex,education)], by = "group")
  ```
- Line 857: child
  ```
  get.reg.emp.con.data.rob2 <- function(df_children) {
  ```
- Line 860: name
  ```
  filename <- paste0(data, "connections_type_rob2.Rdata")
  ```
- Line 861: name
  ```
  load(filename)
  ```
- Line 864: child
  ```
  df_connections <- merge(df_connections,df_children[,.(id,year)], by = "id")
  ```
- Line 867: child
  ```
  # gen groups of children
  ```
- Line 868: child
  ```
  df_children[,education := 1* (education > 0)]
  ```
- Line 869: birth, child, city, district, sex
  ```
  df_groups <- df_children[,.(n = .N), by = c("year","birth_year","ethnicity","sex","education","distr
  ```
- Line 872: birth, child, city, district, sex
  ```
  df_children = merge(df_children,df_groups, by = c("year","birth_year","ethnicity","sex","education",
  ```
- Line 875: child
  ```
  # get the group of each child in the connections data
  ```
- Line 876: child
  ```
  df_connections <- merge(df_children[,.(id,group)], df_connections, by = "id")
  ```
- Line 880: child
  ```
  df_employment <- df_children[,.(id,id_firm)]
  ```
- Line 889: child
  ```
  df_employment_group <- merge(df_employment_group,df_children[,.(id,group)], by = "id")
  ```
- Line 896: child
  ```
  # get the number of children in each group
  ```
- Line 927: city, sex
  ```
  df_reg <- merge(df_reg,df_groups[,.(group,ethnicity,sex,education)], by = "group")
  ```
- Line 938: name
  ```
  run.reg.emp.con <- function(df_reg,name_dep_var = 'employment') {
  ```
- Line 940: name
  ```
  df_reg[,dep_var := get(name_dep_var)]
  ```
- Line 942: name
  ```
  df_reg[,dep_var_0 := get(paste0(name_dep_var,"_0"))]
  ```
- Line 959: name
  ```
  run.reg.emp.con.multiple <- function(df_reg,name_dep_var = 'employment') {
  ```
- Line 961: name
  ```
  df_reg[,dep_var := get(name_dep_var)]
  ```
- Line 963: name
  ```
  df_reg[,dep_var_0 := get(paste0(name_dep_var,"_0"))]
  ```
- Line 981: name
  ```
  run.reg.emp.con.multiple2 <- function(df_reg,name_dep_var = 'employment') {
  ```
- Line 983: name
  ```
  df_reg[,dep_var := get(name_dep_var)]
  ```
- Line 985: name
  ```
  df_reg[,dep_var_0 := get(paste0(name_dep_var,"_0"))]
  ```
- Line 1004: name
  ```
  run.reg.emp.con.event <- function(df_reg,name_dep_var = 'employment') {
  ```
- Line 1006: name
  ```
  df_reg[,dep_var := get(name_dep_var)]
  ```
- Line 1008: name
  ```
  df_reg[,dep_var_0 := get(paste0(name_dep_var,"_0"))] # to make sure this line is ok (I think it was 
  ```
- Line 1031: name
  ```
  run.reg.emp.con.event.multiple2 <- function(df_reg,name_dep_var = 'employment') {
  ```
- Line 1033: name
  ```
  df_reg[,dep_var := get(name_dep_var)]
  ```
- Line 1035: name
  ```
  df_reg[,dep_var_0 := get(paste0(name_dep_var,"_0"))] # to make sure this line is ok (I think it was 
  ```
- Line 1061: name
  ```
  run.reg.emp.con.exit <- function(df_reg,name_ind_var ) {
  ```
- Line 1063: name
  ```
  df_reg[,ind_var10 := get(paste0("con1",name_ind_var,"0"))]
  ```
- Line 1064: name
  ```
  df_reg[,ind_var11 := get(paste0("con1",name_ind_var,"1"))]
  ```
- Line 1065: name
  ```
  df_reg[,ind_var20 := get(paste0("con2",name_ind_var,"0"))]
  ```
- Line 1066: name
  ```
  df_reg[,ind_var21 := get(paste0("con2",name_ind_var,"1"))]
  ```
- Line 1087: name
  ```
  run.reg.emp.con.rob1 <- function(df_reg,name_dep_var = 'employment') {
  ```
- Line 1089: name
  ```
  df_reg[,dep_var := get(name_dep_var)]
  ```
- Line 1091: name
  ```
  df_reg[,dep_var_0 := get(paste0(name_dep_var,"_0"))]
  ```
- Line 1109: child
  ```
  get.statistics <- function(df_children,
  ```
- Line 1111: child
  ```
  df_children1 <- df_children
  ```
- Line 1112: child
  ```
  rm(df_children)
  ```
- Line 1114: child
  ```
  df_children1[,education := 1* (education > 0)]
  ```
- Line 1115: birth, child, city, district, sex
  ```
  df_groups <- df_children1[,.(n = .N), by = c("year","birth_year","ethnicity","sex","education","dist
  ```
- Line 1121: birth, child, city, district, sex
  ```
  df_children1 <- merge(df_children1,df_groups, by = c("year","birth_year","ethnicity","sex","educatio
  ```
- Line 1124: name
  ```
  filename <- paste0(data, connections_file)
  ```
- Line 1125: name
  ```
  load(filename)
  ```
- Line 1131: child
  ```
  df_children <- df_children1[V1 == cc]
  ```
- Line 1133: child
  ```
  df_connections <- merge(df_connections1,df_children[,.(id,year)], by = "id")
  ```
- Line 1136: child
  ```
  # get the group of each child in the connections data
  ```
- Line 1137: child
  ```
  df_connections <- merge(df_children[,.(id,group)], df_connections, by = "id")
  ```
- Line 1144: child
  ```
  # get the number of children in each group
  ```
- Line 1171: child
  ```
  workers <- df_children1[,.N]
  ```
- Line 1184: child
  ```
  get.statistics.size <- function(df_children,
  ```
- Line 1191: name
  ```
  filename <- paste0(data,connections_file )
  ```
- Line 1192: name
  ```
  load(filename)
  ```
- Line 1195: child
  ```
  df_connections <- merge(df_connections,df_children[,.(id,year)], by = "id")
  ```
- Line 1211: child
  ```
  df_children1 <- df_children
  ```
- Line 1212: child
  ```
  rm(df_children)
  ```
- Line 1214: child
  ```
  df_children1[,education := 1* (education > 0)]
  ```
- Line 1215: birth, child, city, district, sex
  ```
  df_groups <- df_children1[,.(n = .N), by = c("year","birth_year","ethnicity","sex","education","dist
  ```
- Line 1221: birth, child, city, district, sex
  ```
  df_children1 <- merge(df_children1,df_groups, by = c("year","birth_year","ethnicity","sex","educatio
  ```
- Line 1226: child
  ```
  df_children <- df_children1[V1 == cc]
  ```
- Line 1228: child
  ```
  df_connections <- merge(df_connections1,df_children[,.(id,year)], by = "id")
  ```
- Line 1231: child
  ```
  # get the group of each child in the connections data
  ```
- Line 1232: child
  ```
  df_connections <- merge(df_children[,.(id,group)], df_connections, by = "id")
  ```
- Line 1239: child
  ```
  # get the number of children in each group
  ```
- Line 1266: child
  ```
  workers <- df_children1[,.N]
  ```
- Line 1278: child
  ```
  get.statistics.exit <- function(df_children) {
  ```
- Line 1280: child
  ```
  df_children1 <- df_children
  ```
- Line 1281: child
  ```
  rm(df_children)
  ```
- Line 1283: child
  ```
  df_children1[,education := 1* (education > 0)]
  ```
- Line 1284: birth, child, city, district, sex
  ```
  df_groups <- df_children1[,.(n = .N), by = c("year","birth_year","ethnicity","sex","education","dist
  ```
- Line 1290: birth, child, city, district, sex
  ```
  df_children1 <- merge(df_children1,df_groups, by = c("year","birth_year","ethnicity","sex","educatio
  ```
- Line 1293: name
  ```
  filename <- paste0(data, "connections_type.Rdata")
  ```
- Line 1294: name
  ```
  load(filename)
  ```
- Line 1299: lat
  ```
  # load the population data
  ```
- Line 1300: lat, name
  ```
  filename <- paste0(data, "population.Rdata")
  ```
- Line 1301: name
  ```
  load(filename)
  ```
- Line 1302: birth, lat, sex
  ```
  df_population <- df[,.(id,birth_year,sex,death_year)]
  ```
- Line 1306: name
  ```
  filename <- paste0(data, "connections_id_pco.Rdata")
  ```
- Line 1307: name
  ```
  load(filename)
  ```
- Line 1313: child
  ```
  df_children <- df_children1[V1 == cc]
  ```
- Line 1315: child
  ```
  df_connections <- merge(df_connections1,df_children[,.(id,year)], by = "id")
  ```
- Line 1318: child
  ```
  # get the group of each child in the connections data
  ```
- Line 1319: child
  ```
  df_connections <- merge(df_children[,.(id,group)], df_connections, by = "id")
  ```
- Line 1326: sex
  ```
  # get the age, sex, and death year of the coworkers
  ```
- Line 1327: lat
  ```
  df_connections <- merge(df_connections,df_population, by.x = "id_pco", by.y = "id", all.x = TRUE)
  ```
- Line 1335: birth, sex
  ```
  df_connections[,retirement := 1 * ( ((sex == 0 )& (year + max_lag  - birth_year == 67)) | ((sex == 1
  ```
- Line 1359: child
  ```
  # get the number of children in each group
  ```
- Line 1426: child
  ```
  workers <- df_children1[,.N]
  ```

**/replication-package/labor_networks/code/inter/functions_reg_emp_con_long.R**

- Line 5: child, lon
  ```
  get.reg.emp.con.data.long <- function(df_children) {
  ```
- Line 7: lon
  ```
  # load the long-connections file
  ```
- Line 8: lon, name
  ```
  filename <- paste0(data, "connections_long.Rdata")
  ```
- Line 9: name
  ```
  load(filename)
  ```
- Line 10: lon
  ```
  df_connections_long <- df
  ```
- Line 12: child, lon
  ```
  df_connections_long <- merge(df_connections_long,df_children[,.(id)], by = "id")
  ```
- Line 15: name
  ```
  filename <- paste0(data, "connections_type.Rdata")
  ```
- Line 16: name
  ```
  load(filename)
  ```
- Line 19: child
  ```
  df_connections <- merge(df_connections,df_children[,.(id,year)], by = "id")
  ```
- Line 21: lon
  ```
  # keep only con_type == 2 in the long file
  ```
- Line 22: lon
  ```
  df_connections_long <- merge(df_connections_long,df_connections[con_type == 2,.(id,id_firm)], by = c
  ```
- Line 24: child
  ```
  # gen groups of children
  ```
- Line 25: child
  ```
  df_children[,education := 1* (education > 0)]
  ```
- Line 26: birth, child, city, district, sex
  ```
  df_groups <- df_children[,.(n = .N), by = c("year","birth_year","ethnicity","sex","education","distr
  ```
- Line 29: birth, child, city, district, sex
  ```
  df_children = merge(df_children,df_groups, by = c("year","birth_year","ethnicity","sex","education",
  ```
- Line 32: child
  ```
  # get the group of each child in the connections datasets
  ```
- Line 33: child
  ```
  df_connections <- merge(df_children[,.(id,group)], df_connections, by = "id")
  ```
- Line 34: child, lon
  ```
  df_connections_long <- merge(df_children[,.(id,group)], df_connections_long, by = "id")
  ```
- Line 37: child
  ```
  df_employment <- df_children[,.(id,id_firm)]
  ```
- Line 45: child
  ```
  df_employment_group <- merge(df_employment_group,df_children[,.(id,group)], by = "id")
  ```
- Line 52: child
  ```
  # get the number of children in each group
  ```
- Line 71: child
  ```
  rm(df_children,df_employment,df_groups)
  ```
- Line 75: lon
  ```
  df_connections_groups_long <- df_connections_long[,
  ```
- Line 84: child, sex
  ```
  sex_child = mean(sex_child ),
  ```
- Line 85: sex
  ```
  sex_parent = mean(sex_parent ),
  ```
- Line 86: sex
  ```
  sex_pco = mean(sex_pco ),
  ```
- Line 87: child, city
  ```
  ethnicity_child = mean(ethnicity_child ),
  ```
- Line 88: city
  ```
  ethnicity_pco = mean(ethnicity_pco ),
  ```
- Line 89: child
  ```
  education_child = mean(education_child ),
  ```
- Line 90: child, sex
  ```
  same_sex_child_parent = mean(same_sex_child_parent ),
  ```
- Line 91: child, sex
  ```
  same_sex_child_pco = mean(same_sex_child_pco ),
  ```
- Line 92: child, city
  ```
  same_ethnicity_child_pco = mean(same_ethnicity_child_pco ),
  ```
- Line 96: lon
  ```
  rm(df_connections_long)
  ```
- Line 109: lon
  ```
  # merge df_connections_groups and df_connections_groups_long
  ```
- Line 110: lon
  ```
  df_connections1 <- merge(df_connections_groups,df_connections_groups_long, by = c("group", "id_firm"
  ```
- Line 121: child, sex
  ```
  df_connections1[is.na(sex_child ), sex_child := 0]
  ```
- Line 122: sex
  ```
  df_connections1[is.na(sex_parent ), sex_parent := 0]
  ```
- Line 123: sex
  ```
  df_connections1[is.na(sex_pco ), sex_pco := 0]
  ```
- Line 124: child, city
  ```
  df_connections1[is.na(ethnicity_child ), ethnicity_child := 0]
  ```
- Line 125: city
  ```
  df_connections1[is.na(ethnicity_pco ), ethnicity_pco := 0]
  ```
- Line 126: child
  ```
  df_connections1[is.na(education_child ), education_child := 0]
  ```
- Line 127: child, sex
  ```
  df_connections1[is.na(same_sex_child_parent ), same_sex_child_parent := 0]
  ```
- Line 128: child, sex
  ```
  df_connections1[is.na(same_sex_child_pco ), same_sex_child_pco := 0]
  ```
- Line 129: child, city
  ```
  df_connections1[is.na(same_ethnicity_child_pco ), same_ethnicity_child_pco := 0]
  ```
- Line 143: child, lon
  ```
  get.reg.emp.con.data.long.figure <- function(df_children) {
  ```
- Line 145: child
  ```
  first_year <- df_children[,min(year)]
  ```
- Line 146: child
  ```
  last_year <- df_children[,max(year)]
  ```
- Line 148: lon
  ```
  # load the long-connections file
  ```
- Line 151: lon, name
  ```
  filename <- paste0(data, "connections_long_",t,".Rdata")
  ```
- Line 152: name
  ```
  load(filename)
  ```
- Line 153: lon
  ```
  df_connections_long <- df
  ```
- Line 155: child, lon
  ```
  df_connections_long <- merge(df_connections_long,df_children[,.(id)], by = "id")
  ```
- Line 159: lon
  ```
  df_connections_long1 <- df_connections_long
  ```
- Line 161: lon
  ```
  df_connections_long1 <- rbind(df_connections_long1,df_connections_long)
  ```
- Line 164: lon
  ```
  df_connections_long <- df_connections_long1
  ```
- Line 165: lon
  ```
  rm(df_connections_long1)
  ```
- Line 168: name
  ```
  filename <- paste0(data, "connections_type.Rdata")
  ```
- Line 169: name
  ```
  load(filename)
  ```
- Line 172: child
  ```
  df_connections <- merge(df_connections,df_children[,.(id,year)], by = "id")
  ```
- Line 174: lon
  ```
  # keep only con_type == 1 | 2 in the long file
  ```
- Line 175: lon
  ```
  df_connections_long <- merge(df_connections_long,df_connections[con_type == 1 |con_type == 2,.(id,id
  ```
- Line 177: child
  ```
  # gen groups of children
  ```
- Line 178: child
  ```
  df_children[,education := 1* (education > 0)]
  ```
- Line 179: birth, child, city, district, sex
  ```
  df_groups <- df_children[,.(n = .N), by = c("year","birth_year","ethnicity","sex","education","distr
  ```
- Line 182: birth, child, city, district, sex
  ```
  df_children = merge(df_children,df_groups, by = c("year","birth_year","ethnicity","sex","education",
  ```
- Line 185: child
  ```
  # get the group of each child in the connections datasets
  ```
- Line 186: child
  ```
  df_connections <- merge(df_children[,.(id,group)], df_connections, by = "id")
  ```
- Line 187: child, lon
  ```
  df_connections_long <- merge(df_children[,.(id,group)], df_connections_long, by = "id")
  ```
- Line 190: child
  ```
  df_employment <- df_children[,.(id,id_firm)]
  ```
- Line 198: child
  ```
  df_employment_group <- merge(df_employment_group,df_children[,.(id,group)], by = "id")
  ```
- Line 205: child
  ```
  # get the number of children in each group
  ```
- Line 224: child
  ```
  rm(df_children,df_employment,df_groups)
  ```
- Line 238: lon
  ```
  list1 <- list(df_reg,df_connections_long)
  ```
- Line 249: child
  ```
  get.reg.emp.con.data.firm <- function(df_children) {
  ```
- Line 253: name
  ```
  filename <- paste0(data, "firms_duration_bins.Rdata")
  ```
- Line 254: name
  ```
  load(filename)
  ```
- Line 255: lon
  ```
  df_connections_long = df
  ```
- Line 258: name
  ```
  filename <- paste0(data, "firms_akm_res_bins.Rdata")
  ```
- Line 259: name
  ```
  load(filename)
  ```
- Line 260: lon
  ```
  df_connections_long = merge(df_connections_long,df, by = "id_firm")
  ```
- Line 264: name
  ```
  filename <- paste0(data, "firm_industry_sector.Rdata")
  ```
- Line 265: name
  ```
  load(filename)
  ```
- Line 266: lon
  ```
  df_connections_long <- merge(df_connections_long,df[,.(id_firm,main_sector)], by = c("id_firm"))
  ```
- Line 269: name
  ```
  filename <- paste0(data, "connections_type.Rdata")
  ```
- Line 270: name
  ```
  load(filename)
  ```
- Line 273: child
  ```
  df_connections <- merge(df_connections,df_children[,.(id,year)], by = "id")
  ```
- Line 275: lon
  ```
  # keep only con_type == 1 | 2 in the long file
  ```
- Line 276: lon
  ```
  df_connections_long <- merge(df_connections_long[,.(id_firm ,main_sector,
  ```
- Line 281: child
  ```
  # gen groups of children
  ```
- Line 282: child
  ```
  df_children[,education := 1* (education > 0)]
  ```
- Line 283: birth, child, city, district, sex
  ```
  df_groups <- df_children[,.(n = .N), by = c("year","birth_year","ethnicity","sex","education","distr
  ```
- Line 286: birth, child, city, district, sex
  ```
  df_children = merge(df_children,df_groups, by = c("year","birth_year","ethnicity","sex","education",
  ```
- Line 289: child
  ```
  # get the group of each child in the connections datasets
  ```
- Line 290: child
  ```
  df_connections <- merge(df_children[,.(id,group)], df_connections, by = "id")
  ```
- Line 291: child, lon
  ```
  df_connections_long <- merge(df_children[,.(id,group)], df_connections_long, by = "id")
  ```
- Line 294: child
  ```
  df_employment <- df_children[,.(id,id_firm)]
  ```
- Line 302: child
  ```
  df_employment_group <- merge(df_employment_group,df_children[,.(id,group)], by = "id")
  ```
- Line 309: child
  ```
  # get the number of children in each group
  ```
- Line 328: child
  ```
  rm(df_children,df_employment,df_groups)
  ```
- Line 342: lon
  ```
  list1 <- list(df_reg,df_connections_long)
  ```
- Line 352: child
  ```
  get.reg.emp.con.data.int <- function(df_children,children_vars,firm_vars) {
  ```
- Line 355: name
  ```
  filename <- paste0(data, "connections_type.Rdata")
  ```
- Line 356: name
  ```
  load(filename)
  ```
- Line 359: child
  ```
  df_connections <- merge(df_connections,df_children[,.(id,year)], by = "id")
  ```
- Line 362: child, name, son
  ```
  filename <- paste0(data, "akm_person_children_only.Rdata")
  ```
- Line 363: name
  ```
  load(filename)
  ```
- Line 364: son
  ```
  df_akm_person <- df[,.(id,year,person_rank )]
  ```
- Line 366: child, son
  ```
  df_akm_person <- merge(df_akm_person,df_children[,.(id,year)], by = c("id","year"))
  ```
- Line 368: name
  ```
  filename <- paste0(data, "akm_firm.Rdata")
  ```
- Line 369: name
  ```
  load(filename)
  ```
- Line 374: lon
  ```
  # keep only con_type == 1 | 2 in the long file
  ```
- Line 375: lon
  ```
  df_connections_long <- merge(df_akm_firm,
  ```
- Line 380: lon, son
  ```
  df_connections_long = merge(df_connections_long,df_akm_person,
  ```
- Line 382: lon, son
  ```
  df_connections_long[,gap:=firm_rank - person_rank]
  ```
- Line 383: lon
  ```
  df_connections_long[,firm_rank:=NULL]
  ```
- Line 384: lon, son
  ```
  df_connections_long[,person_rank:=NULL]
  ```
- Line 386: son
  ```
  rm(df_akm_person)
  ```
- Line 387: child
  ```
  # gen groups of children
  ```
- Line 388: child
  ```
  df_children[,education := 1* (education > 0)]
  ```
- Line 389: birth, child, city, district, sex
  ```
  df_groups <- df_children[,.(n = .N), by = c("year","birth_year","ethnicity","sex","education","distr
  ```
- Line 392: birth, child, city, district, sex
  ```
  df_children = merge(df_children,df_groups, by = c("year","birth_year","ethnicity","sex","education",
  ```
- Line 395: child
  ```
  # get the group of each child in the connections datasets
  ```
- Line 396: child
  ```
  df_connections <- merge(df_children[,.(id,group)], df_connections, by = "id")
  ```
- Line 397: child, lon
  ```
  df_connections_long <- merge(df_children[,.(id,group)], df_connections_long, by = "id")
  ```
- Line 400: child
  ```
  df_employment <- df_children[,.(id,id_firm)]
  ```
- Line 408: child
  ```
  df_employment_group <- merge(df_employment_group,df_children[,.(id,group)], by = "id")
  ```
- Line 415: child
  ```
  # get the number of children in each group
  ```
- Line 434: child
  ```
  rm(df_children,df_employment,df_groups)
  ```
- Line 448: lon
  ```
  list1 <- list(df_reg,df_connections_long)
  ```
- Line 457: lon
  ```
  run.reg.emp.con.long <- function(df_reg) {
  ```
- Line 467: child, sex
  ```
  sex_child +
  ```
- Line 468: sex
  ```
  sex_parent  +
  ```
- Line 469: sex
  ```
  sex_pco +
  ```
- Line 470: child, city
  ```
  ethnicity_child +
  ```
- Line 471: city
  ```
  ethnicity_pco +
  ```
- Line 472: child
  ```
  education_child +
  ```
- Line 473: child, sex
  ```
  same_sex_child_parent +
  ```
- Line 474: child, sex
  ```
  same_sex_child_pco+
  ```
- Line 475: child, city
  ```
  same_ethnicity_child_pco +
  ```
- Line 493: lon
  ```
  prepare.reg.emp.con.table.long <- function(table) {
  ```
- Line 506: child, sex
  ```
  sex_child = mean( V12 ) ,
  ```
- Line 507: sex
  ```
  sex_parent = mean( V13 ) ,
  ```
- Line 508: sex
  ```
  sex_pco = mean( V14 ) ,
  ```
- Line 509: child, city
  ```
  ethnicity_child = mean( V15 ) ,
  ```
- Line 510: city
  ```
  ethnicity_pco = mean( V16 ) ,
  ```
- Line 511: child
  ```
  education_child = mean( V17 ) ,
  ```
- Line 512: child, sex
  ```
  same_sex_child_parent = mean( V18 ) ,
  ```
- Line 513: child, sex
  ```
  same_sex_child_pco = mean( V19 ) ,
  ```
- Line 514: child, city
  ```
  same_ethnicity_child_pco = mean( V20 ) ,
  ```
- Line 527: child, sex
  ```
  sex_child_sd = sd( V12 ) ,
  ```
- Line 528: sex
  ```
  sex_parent_sd = sd( V13 ) ,
  ```
- Line 529: sex
  ```
  sex_pco_sd = sd( V14 ) ,
  ```
- Line 530: child, city
  ```
  ethnicity_child_sd = sd( V15 ) ,
  ```
- Line 531: city
  ```
  ethnicity_pco_sd = sd( V16 ) ,
  ```
- Line 532: child
  ```
  education_child_sd = sd( V17 ) ,
  ```
- Line 533: child, sex
  ```
  same_sex_child_parent_sd = sd( V18 ) ,
  ```
- Line 534: child, sex
  ```
  same_sex_child_pco_sd = sd( V19 ) ,
  ```
- Line 535: child, city
  ```
  same_ethnicity_child_pco_sd = sd( V20) ,
  ```
- Line 548: child, sex
  ```
  sex_child_lb = quantile(V12,.025),
  ```
- Line 549: sex
  ```
  sex_parent_lb = quantile(V13,.025),
  ```
- Line 550: sex
  ```
  sex_pco_lb = quantile(V14,.025),
  ```
- Line 551: child, city
  ```
  ethnicity_child_lb = quantile(V15,.025),
  ```
- Line 552: city
  ```
  ethnicity_pco_lb = quantile(V16,.025),
  ```
- Line 553: child
  ```
  education_child_lb = quantile(V17,.025),
  ```
- Line 554: child, sex
  ```
  same_sex_child_parent_lb = quantile(V18,.025),
  ```
- Line 555: child, sex
  ```
  same_sex_child_pco_lb = quantile(V19,.025),
  ```
- Line 556: child, city
  ```
  same_ethnicity_child_pco_lb = quantile(V20,.025),
  ```
- Line 569: child, sex
  ```
  sex_child_ub = quantile(V12,.975),
  ```
- Line 570: sex
  ```
  sex_parent_ub = quantile(V13,.975),
  ```
- Line 571: sex
  ```
  sex_pco_ub = quantile(V14,.975),
  ```
- Line 572: child, city
  ```
  ethnicity_child_ub = quantile(V15,.975),
  ```
- Line 573: city
  ```
  ethnicity_pco_ub = quantile(V16,.975),
  ```
- Line 574: child
  ```
  education_child_ub = quantile(V17,.975),
  ```
- Line 575: child, sex
  ```
  same_sex_child_parent_ub = quantile(V18,.975),
  ```
- Line 576: child, sex
  ```
  same_sex_child_pco_ub = quantile(V19,.975),
  ```
- Line 577: child, city
  ```
  same_ethnicity_child_pco_ub = quantile(V20,.975),
  ```
- Line 592: lon
  ```
  run.reg.emp.con.long.figure <- function(df_reg,df_connections_long,bin_var,bins = NULL) {
  ```
- Line 594: lon
  ```
  df_connections_long[,bin_var := get(bin_var)]
  ```
- Line 597: lon
  ```
  df_connections_long <- df_connections_long[,bin := ceiling( bins *
  ```
- Line 601: lon
  ```
  df_connections_long[,bin := ceiling(bin_var)]
  ```
- Line 605: lon
  ```
  bins1 <- df_connections_long[,.(mean(bin_var)), by =  "bin"]
  ```
- Line 612: lon
  ```
  df_connections_groups_long <- df_connections_long[,.(id_firm,group,bin,con_type)]
  ```
- Line 615: lon
  ```
  df_connections_groups_long[,paste0("bin_1_",l) := (1 * (bin == l & con_type ==1))]
  ```
- Line 616: lon
  ```
  df_connections_groups_long[,paste0("bin_2_",l) := (1 * (bin == l & con_type ==2))]
  ```
- Line 618: lon
  ```
  df_connections_groups_long[,bin := NULL]
  ```
- Line 620: lon
  ```
  df_connections_groups_long <- df_connections_groups_long[,lapply(.SD,mean), by = .(id_firm,group)]
  ```
- Line 622: lon
  ```
  rm(df_connections_long)
  ```
- Line 626: lon
  ```
  # merge df_connections_groups and df_connections_groups_long
  ```
- Line 627: lon
  ```
  df_reg <- merge(df_reg,df_connections_groups_long, by = c("group", "id_firm"), all.x = TRUE)
  ```
- Line 628: lon
  ```
  rm(df_connections_groups_long)
  ```
- Line 660: lon
  ```
  prepare.reg.emp.con.table.long.figure <- function(table,bin_var) {
  ```
- Line 665: name
  ```
  list_l_names <- list()
  ```
- Line 668: name
  ```
  list_l_names = append(list_l_names , "bin_var")
  ```
- Line 680: name
  ```
  list_l_names = append(list_l_names , diff)
  ```
- Line 683: name
  ```
  list_l_names = append(list_l_names , paste0(diff,"_sd"))
  ```
- Line 686: name
  ```
  list_l_names = append(list_l_names , paste0(diff,"_lb"))
  ```
- Line 689: name
  ```
  list_l_names = append(list_l_names , paste0(diff,"_ub"))
  ```
- Line 694: name
  ```
  list_l_names = append(list_l_names , paste0("bin",bin,"_av"))
  ```
- Line 704: name
  ```
  list_l_names = append(list_l_names , "con3")
  ```
- Line 707: name
  ```
  list_l_names = append(list_l_names , "con3_sd")
  ```
- Line 710: name
  ```
  list_l_names = append(list_l_names , "con3_lb")
  ```
- Line 713: name
  ```
  list_l_names = append(list_l_names , "con3_ub")
  ```
- Line 716: name
  ```
  list_l_names = append(list_l_names , "est0")
  ```
- Line 719: name
  ```
  list_l_names = append(list_l_names , "est0_sd")
  ```
- Line 722: name
  ```
  list_l_names = append(list_l_names , "est0_lb")
  ```
- Line 725: name
  ```
  list_l_names = append(list_l_names , "est0_ub")
  ```
- Line 728: name
  ```
  list_l_names = append(list_l_names , "obs")
  ```
- Line 731: name
  ```
  list_l_names = append(list_l_names , "B")
  ```
- Line 735: name
  ```
  table_temp = cbind(list_l_names,list_l)
  ```
- Line 747: sex
  ```
  prepare.table.sex_sector <- function(table) {
  ```
- Line 750: lat
  ```
  # calculate statistics for gap by sector and overall
  ```
- Line 751: name
  ```
  filename <- paste0(data, "connections_type.Rdata")
  ```
- Line 752: name
  ```
  load(filename)
  ```
- Line 756: child, name
  ```
  filename <- paste0(data, "children_sample.Rdata")
  ```
- Line 757: name
  ```
  load(filename)
  ```
- Line 758: child, sex
  ```
  df_children = df[,.(id,year,sex)]
  ```
- Line 761: name
  ```
  filename <- paste0(data, "firm_industry_sector.Rdata")
  ```
- Line 762: name
  ```
  load(filename)
  ```
- Line 767: child
  ```
  df_connections = merge(df_connections,df_children,by = "id", all.x = T)
  ```
- Line 770: sex
  ```
  table_sector = df_connections[!is.na(main_sector),.(obs = .N, share_women = mean(sex)),
  ```
- Line 783: name
  ```
  list_l_names <- list()
  ```
- Line 798: name
  ```
  list_l_names = append(list_l_names , did)
  ```
- Line 801: name
  ```
  list_l_names = append(list_l_names , paste0(did,"_sd"))
  ```
- Line 804: name
  ```
  list_l_names = append(list_l_names , paste0(did,"_lb"))
  ```
- Line 807: name
  ```
  list_l_names = append(list_l_names , paste0(did,"_ub"))
  ```
- Line 828: name
  ```
  list_l_names = append(list_l_names , "did_w")
  ```
- Line 831: name
  ```
  list_l_names = append(list_l_names ,"did_w_sd")
  ```
- Line 834: name
  ```
  list_l_names = append(list_l_names , "did_w_lb")
  ```
- Line 837: name
  ```
  list_l_names = append(list_l_names , "did_w_ub")
  ```
- Line 841: name
  ```
  table_temp = cbind(list_l_names,list_l)
  ```

**/replication-package/labor_networks/code/inter/functions_reg_emp_con_long_figure.R**

- Line 2: lon
  ```
  ## functions_reg_emp_con_long_figure.R
  ```
- Line 4: lon
  ```
  ## "diff" long-figure stack that ALSO keeps the raw bin_1_l / bin_2_l coefficient
  ```
- Line 10: block, loc
  ```
  ##   con3_sd, bin1_{l}_sd, bin2_{l}_sd (SD block)
  ```
- Line 11: block, loc
  ```
  ##   con3_lb, bin1_{l}_lb, bin2_{l}_lb (LB block)
  ```
- Line 12: block, loc
  ```
  ##   con3_ub, bin1_{l}_ub, bin2_{l}_ub (UB block)
  ```
- Line 20: child, lon
  ```
  ## get.reg.emp.con.data.long.figure(df_children) -> list(df_reg, df_connections_long)
  ```
- Line 22: child, lon
  ```
  get.reg.emp.con.data.long.figure <- function(df_children) {
  ```
- Line 24: child
  ```
  first_year <- df_children[, min(year)]
  ```
- Line 25: child
  ```
  last_year  <- df_children[, max(year)]
  ```
- Line 28: lon, name
  ```
  filename <- paste0(data, "connections_long_", t, ".Rdata")
  ```
- Line 29: name
  ```
  load(filename)
  ```
- Line 30: lon
  ```
  df_connections_long <- df
  ```
- Line 32: child, lon
  ```
  df_connections_long <- merge(df_connections_long, df_children[, .(id)], by = "id")
  ```
- Line 33: lon
  ```
  if (t == first_year) df_connections_long1 <- df_connections_long
  ```
- Line 34: lon
  ```
  else                 df_connections_long1 <- rbind(df_connections_long1, df_connections_long)
  ```
- Line 36: lon
  ```
  df_connections_long <- df_connections_long1
  ```
- Line 37: lon
  ```
  rm(df_connections_long1)
  ```
- Line 39: name
  ```
  filename <- paste0(data, "connections_type.Rdata")
  ```
- Line 40: name
  ```
  load(filename)
  ```
- Line 43: child
  ```
  df_connections <- merge(df_connections, df_children[, .(id, year)], by = "id")
  ```
- Line 45: lon
  ```
  df_connections_long <- merge(df_connections_long,
  ```
- Line 49: child
  ```
  df_children[, education := 1 * (education > 0)]
  ```
- Line 50: birth, child, city, district, sex
  ```
  df_groups <- df_children[, .(n = .N), by = c("year", "birth_year", "ethnicity", "sex", "education", 
  ```
- Line 53: birth, child, city, district, sex
  ```
  df_children <- merge(df_children, df_groups, by = c("year", "birth_year", "ethnicity", "sex", "educa
  ```
- Line 55: child
  ```
  df_connections      <- merge(df_children[, .(id, group)], df_connections,      by = "id")
  ```
- Line 56: child, lon
  ```
  df_connections_long <- merge(df_children[, .(id, group)], df_connections_long, by = "id")
  ```
- Line 58: child
  ```
  df_employment <- df_children[, .(id, id_firm)]
  ```
- Line 65: child
  ```
  df_employment_group <- merge(df_employment_group, df_children[, .(id, group)], by = "id")
  ```
- Line 81: child
  ```
  rm(df_children, df_employment, df_groups)
  ```
- Line 92: lon
  ```
  return(list(df_reg, df_connections_long))
  ```
- Line 96: lon
  ```
  ## run.reg.emp.con.long.figure -> c(bins_av, con3, bin1_l, bin2_l, ..., est0)
  ```
- Line 100: lon
  ```
  run.reg.emp.con.long.figure <- function(df_reg, df_connections_long, bin_var, bins = NULL) {
  ```
- Line 102: lon
  ```
  df_connections_long[, bin_var := get(bin_var)]
  ```
- Line 103: lon
  ```
  if (!is.null(bins)) df_connections_long[, bin := ceiling(bins * rank(bin_var) / .N)]
  ```
- Line 104: lon
  ```
  else                df_connections_long[, bin := ceiling(bin_var)]
  ```
- Line 106: lon
  ```
  bins1 <- df_connections_long[, .(mean(bin_var)), by = "bin"]
  ```
- Line 112: lon
  ```
  df_g <- df_connections_long[, .(id_firm, group, bin, con_type)]
  ```
- Line 119: lon
  ```
  rm(df_connections_long)
  ```
- Line 140: lon
  ```
  ## prepare.reg.emp.con.table.long.figure(table, bin_var)
  ```
- Line 141: block, loc
  ```
  ##   Emits the full figure layout (diff block, bin_av, raw coef mean/sd/lb/ub,
  ```
- Line 144: lon
  ```
  prepare.reg.emp.con.table.long.figure <- function(table, bin_var, labs = NULL) {
  ```
- Line 151: name
  ```
  add <- function(name, val) { ln[[length(ln)+1]] <<- name; lv[[length(lv)+1]] <<- val }
  ```
- Line 165: block, loc
  ```
  # --- diff blocks (grouped by statistic, matching the figure CSV header) ---
  ```
- Line 184: block, loc
  ```
  # --- SD block ---
  ```
- Line 190: block, loc
  ```
  # --- LB block ---
  ```
- Line 196: block, loc
  ```
  # --- UB block ---
  ```
- Line 210: name
  ```
  setnames(out, unlist(ln))
  ```

**/replication-package/labor_networks/code/inter/master_inter.R**

- Line 25: name
  ```
  if (!requireNamespace(p, quietly = TRUE))
  ```
- Line 40: lat
  ```
  source(paste0(process, "prepare_population.R"))
  ```
- Line 41: loc, location
  ```
  source(paste0(process, "prepare_location.R"))
  ```
- Line 49: child
  ```
  source(paste0(process, "prepare_children_sample1.R"))
  ```
- Line 51: child
  ```
  source(paste0(process, "prepare_children_sample.R"))
  ```
- Line 52: loc, location
  ```
  source(paste0(process, "prepare_firm_location.R"))
  ```
- Line 57: lon
  ```
  source(paste0(process, "prepare_connections_long.R"))
  ```
- Line 59: child
  ```
  source(paste0(process, "prepare_children_first_job_data.R"))
  ```
- Line 60: child
  ```
  source(paste0(process, "prepare_children_panel.R"))
  ```
- Line 63: child
  ```
  source(paste0(process, "prepare_children_first_job_data_multiple2.R"))
  ```
- Line 64: child
  ```
  source(paste0(process, "prepare_children_sample1_25.R"))
  ```
- Line 66: child
  ```
  source(paste0(process, "prepare_children_sample_25.R"))
  ```
- Line 71: child
  ```
  source(paste0(process, "prepare_children_sample1_1927.R"))
  ```
- Line 73: child
  ```
  source(paste0(process, "prepare_children_sample_1927.R"))
  ```
- Line 76: child
  ```
  source(paste0(process, "prepare_children_sample1_grad1.R"))
  ```
- Line 78: child
  ```
  source(paste0(process, "prepare_children_sample_grad1.R"))
  ```
- Line 81: child
  ```
  source(paste0(process, "prepare_akm_children.R"))
  ```
- Line 87: child
  ```
  source(paste0(process, "prepare_children_sample1_employment.R"))
  ```
- Line 89: child
  ```
  source(paste0(process, "prepare_children_sample_employment.R"))
  ```
- Line 92: child
  ```
  source(paste0(process, "prepare_children_panel_employment.R"))
  ```
- Line 93: child
  ```
  source(paste0(process, "prepare_summary_children_multiple2.R"))
  ```
- Line 94: child
  ```
  source(paste0(process, "prepare_children_panel_total_5years_multiple2.R"))
  ```
- Line 97: child
  ```
  source(paste0(process, "tables_summary_children_multiple2.R"))
  ```
- Line 106: lon
  ```
  source(paste0(process, "tables_reg_emp_con_long_figure.R"))
  ```
- Line 107: lon
  ```
  source(paste0(process, "tables_reg_emp_con_long_year.R"))
  ```
- Line 110: child
  ```
  source(paste0(process, "tables_children_panel.R"))
  ```
- Line 118: lon
  ```
  source(paste0(process, "tables_reg_emp_con_long_firm.R"))
  ```
- Line 120: lon, sex
  ```
  source(paste0(process, "tables_reg_emp_con_long_sector_sex.R"))
  ```
- Line 122: child
  ```
  source(paste0(process, "tables_reg_children_panel_employment.R"))
  ```

**/replication-package/labor_networks/code/inter/prepare_akm.R**

- Line 1: child
  ```
  # load the children sample
  ```
- Line 2: child, name
  ```
  filename <- paste0(data, "children_sample.Rdata")
  ```
- Line 3: name
  ```
  load(filename)
  ```
- Line 4: child
  ```
  df_children <- df[,.(id)]
  ```
- Line 5: child
  ```
  df_children[,child := 1]
  ```
- Line 18: name
  ```
  filename <- paste0(data, "wages_",t1,".Rdata")
  ```
- Line 19: name
  ```
  load(filename)
  ```
- Line 31: child
  ```
  # keep only observations that not in the children sample (so the salary of children will not impact 
  ```
- Line 32: child
  ```
  df_wages <- merge(df_wages,df_children[,.(id,child)],by = c("id"),all.x = TRUE)
  ```
- Line 33: child
  ```
  df_wages <- df_wages[is.na(child)]
  ```
- Line 34: child
  ```
  df_wages[,child := NULL]
  ```
- Line 44: lat
  ```
  # load the population file to get the age of the workers
  ```
- Line 45: lat, name
  ```
  filename <- paste0(data, "population.Rdata")
  ```
- Line 46: name
  ```
  load(filename)
  ```
- Line 47: birth, lat
  ```
  df_population <- df[,.(id,birth_year)]
  ```
- Line 49: lat
  ```
  df_wages <- merge(df_wages, df_population, by = "id")
  ```
- Line 50: lat
  ```
  rm(df_population)
  ```
- Line 51: birth
  ```
  df_wages[, age := year - birth_year]
  ```
- Line 55: birth
  ```
  df_wages[,birth_year := NULL ]
  ```
- Line 70: lname, name
  ```
  colnames(alpha_firm)[colnames(alpha_firm) == "idx"] <- "id_firm"
  ```
- Line 71: lname, name
  ```
  colnames(alpha_firm)[colnames(alpha_firm) == "effect"] <- "firm_fe"
  ```
- Line 74: son
  ```
  alpha_person <- alpha[fe == "factor(id)",.(idx,effect)]
  ```
- Line 75: lname, name, son
  ```
  colnames(alpha_person)[colnames(alpha_person) == "idx"] <- "id"
  ```
- Line 76: lname, name, son
  ```
  colnames(alpha_person)[colnames(alpha_person) == "effect"] <- "person_fe"
  ```
- Line 77: son
  ```
  alpha_person[,person_rank := rank(person_fe)/.N ]
  ```
- Line 82: name
  ```
  filename <- paste0(data, "akm_firm_",t,".Rdata")
  ```
- Line 83: name
  ```
  save(df, file = filename)
  ```
- Line 86: son
  ```
  df <- alpha_person
  ```
- Line 87: name, son
  ```
  filename <- paste0(data, "akm_person_",t,".Rdata")
  ```
- Line 88: name
  ```
  save(df, file = filename)
  ```
- Line 89: son
  ```
  rm(df,alpha_person)
  ```
- Line 97: name
  ```
  filename <- paste0(data, "akm_firm_",t,".Rdata")
  ```
- Line 98: name
  ```
  load(filename)
  ```
- Line 111: name
  ```
  filename <- paste0(data, "akm_firm.Rdata")
  ```
- Line 112: name
  ```
  save(df, file = filename)
  ```
- Line 115: son
  ```
  # maerge and save the files (persons)
  ```
- Line 120: name, son
  ```
  filename <- paste0(data, "akm_person_",t,".Rdata")
  ```
- Line 121: name
  ```
  load(filename)
  ```
- Line 122: son
  ```
  df_akm_person <- df
  ```
- Line 124: son
  ```
  df_akm_person[,year := t]
  ```
- Line 126: son
  ```
  df_akm_person <- rbind(df_akm_person1,df_akm_person)
  ```
- Line 128: son
  ```
  df_akm_person1 <- df_akm_person
  ```
- Line 132: son
  ```
  df <- df_akm_person1
  ```
- Line 133: son
  ```
  rm(df_akm_person1,df_akm_person)
  ```
- Line 134: name, son
  ```
  filename <- paste0(data, "akm_person.Rdata")
  ```
- Line 135: name
  ```
  save(df, file = filename)
  ```

**/replication-package/labor_networks/code/inter/prepare_akm_children.R**

- Line 13: name
  ```
  filename <- paste0(data, "wages_",t1,".Rdata")
  ```
- Line 14: name
  ```
  load(filename)
  ```
- Line 36: lat
  ```
  # load the population file to get the age of the workers
  ```
- Line 37: lat, name
  ```
  filename <- paste0(data, "population.Rdata")
  ```
- Line 38: name
  ```
  load(filename)
  ```
- Line 39: birth, lat
  ```
  df_population <- df[,.(id,birth_year)]
  ```
- Line 41: lat
  ```
  df_wages <- merge(df_wages, df_population, by = "id")
  ```
- Line 42: lat
  ```
  rm(df_population)
  ```
- Line 43: birth
  ```
  df_wages[, age := year - birth_year]
  ```
- Line 47: birth
  ```
  df_wages[,birth_year := NULL ]
  ```
- Line 62: lname, name
  ```
  colnames(alpha_firm)[colnames(alpha_firm) == "idx"] <- "id_firm"
  ```
- Line 63: lname, name
  ```
  colnames(alpha_firm)[colnames(alpha_firm) == "effect"] <- "firm_fe"
  ```
- Line 66: son
  ```
  alpha_person <- alpha[fe == "factor(id)",.(idx,effect)]
  ```
- Line 67: lname, name, son
  ```
  colnames(alpha_person)[colnames(alpha_person) == "idx"] <- "id"
  ```
- Line 68: lname, name, son
  ```
  colnames(alpha_person)[colnames(alpha_person) == "effect"] <- "person_fe"
  ```
- Line 69: son
  ```
  alpha_person[,person_rank := rank(person_fe)/.N ]
  ```
- Line 74: child, name
  ```
  filename <- paste0(data, "akm_firm_children_",t,".Rdata")
  ```
- Line 75: name
  ```
  save(df, file = filename)
  ```
- Line 78: son
  ```
  df <- alpha_person
  ```
- Line 79: child, name, son
  ```
  filename <- paste0(data, "akm_person_children_",t,".Rdata")
  ```
- Line 80: name
  ```
  save(df, file = filename)
  ```
- Line 81: son
  ```
  rm(df,alpha_person)
  ```
- Line 90: child, name
  ```
  filename <- paste0(data, "akm_firm_children_",t,".Rdata")
  ```
- Line 91: name
  ```
  load(filename)
  ```
- Line 104: child, name
  ```
  filename <- paste0(data, "akm_firm_children.Rdata")
  ```
- Line 105: name
  ```
  save(df, file = filename)
  ```
- Line 108: son
  ```
  # maerge and save the files (persons)
  ```
- Line 113: child, name, son
  ```
  filename <- paste0(data, "akm_person_children_",t,".Rdata")
  ```
- Line 114: name
  ```
  load(filename)
  ```
- Line 115: son
  ```
  df_akm_person <- df
  ```
- Line 117: son
  ```
  df_akm_person[,year := t]
  ```
- Line 119: son
  ```
  df_akm_person <- rbind(df_akm_person1,df_akm_person)
  ```
- Line 121: son
  ```
  df_akm_person1 <- df_akm_person
  ```
- Line 125: son
  ```
  df <- df_akm_person1
  ```
- Line 126: son
  ```
  rm(df_akm_person1,df_akm_person)
  ```
- Line 127: child, name, son
  ```
  filename <- paste0(data, "akm_person_children_only.Rdata")
  ```
- Line 128: name
  ```
  save(df, file = filename)
  ```

**/replication-package/labor_networks/code/inter/prepare_akm_res.R**

- Line 1: child
  ```
  # load the children sample
  ```
- Line 2: child, name
  ```
  filename <- paste0(data, "children_sample.Rdata")
  ```
- Line 3: name
  ```
  load(filename)
  ```
- Line 4: child
  ```
  df_children <- df[,.(id)]
  ```
- Line 5: child
  ```
  df_children[,child := 1]
  ```
- Line 18: name
  ```
  filename <- paste0(data, "wages_",t1,".Rdata")
  ```
- Line 19: name
  ```
  load(filename)
  ```
- Line 33: child
  ```
  # keep only observations that not in the children sample (so the salary of children will not impact 
  ```
- Line 34: child
  ```
  df_wages <- merge(df_wages,df_children[,.(id,child)],by = c("id"),all.x = TRUE)
  ```
- Line 35: child
  ```
  df_wages <- df_wages[is.na(child)]
  ```
- Line 36: child
  ```
  df_wages[,child := NULL]
  ```
- Line 46: lat
  ```
  # load the population file to get the age of the workers
  ```
- Line 47: lat, name
  ```
  filename <- paste0(data, "population.Rdata")
  ```
- Line 48: name
  ```
  load(filename)
  ```
- Line 49: birth, lat
  ```
  df_population <- df[,.(id,birth_year)]
  ```
- Line 51: lat
  ```
  df_wages <- merge(df_wages, df_population, by = "id")
  ```
- Line 52: lat
  ```
  rm(df_population)
  ```
- Line 53: birth
  ```
  df_wages[, age := year - birth_year]
  ```
- Line 57: birth
  ```
  df_wages[,birth_year := NULL ]
  ```
- Line 67: name
  ```
  filename <- paste0(data, "akm_est_",t,".Rdata")
  ```
- Line 68: name
  ```
  save(est, file = filename)
  ```
- Line 81: name
  ```
  filename <- paste0(data, "firms_akm_res.Rdata")
  ```
- Line 82: name
  ```
  save(df, file = filename)
  ```
- Line 86: name
  ```
  filename <- paste0(data, "firms_akm_res.Rdata")
  ```
- Line 87: name
  ```
  load(filename)
  ```
- Line 94: name
  ```
  filename <- paste0(data, "firms_akm_res_bins.Rdata")
  ```
- Line 95: name
  ```
  save(df, file = filename)
  ```

**/replication-package/labor_networks/code/inter/prepare_children_first_job_data.R**

- Line 1: child
  ```
  # load the children sample
  ```
- Line 2: child, name
  ```
  filename <- paste0(data, "children_sample.Rdata")
  ```
- Line 3: name
  ```
  load(filename)
  ```
- Line 4: child
  ```
  df_children <- df
  ```
- Line 9: child
  ```
  # get all employment history of children
  ```
- Line 15: name
  ```
  filename <- paste0(data, "wages_",t,".Rdata")
  ```
- Line 16: name
  ```
  load(filename)
  ```
- Line 20: child
  ```
  # get firm id and wages of all future jobs of the child
  ```
- Line 21: child
  ```
  df_wages <- merge(df_children[,.(id,id_firm_first_job = id_firm,year_first_job = year)],
  ```
- Line 64: name
  ```
  filename <- paste0(data, "connections_type.Rdata")
  ```
- Line 65: name
  ```
  load(filename)
  ```
- Line 66: child
  ```
  df_children = merge(df_children,df[,.(id,id_firm,con_type,max_lag)], by = c("id","id_firm") , all.x 
  ```
- Line 67: child
  ```
  df_children[is.na(con_type),con_type := 0]
  ```
- Line 73: child
  ```
  df_children = merge(df_children,df_salary, by = c("id"), all.x = TRUE)
  ```
- Line 74: child
  ```
  df_children = merge(df_children,df_employment_first_firm, by = c("id"), all.x = TRUE)
  ```
- Line 75: child
  ```
  df_children = merge(df_children,df_employment3, by = c("id"), all.x = TRUE)
  ```
- Line 79: child
  ```
  df_children[,event := 1 * (year + duration_first_job <= last_year)]
  ```
- Line 82: child
  ```
  df_children <- df_children[,.(id,
  ```
- Line 85: sex
  ```
  sex,
  ```
- Line 86: birth
  ```
  age = year - birth_year,
  ```
- Line 88: city
  ```
  ethnicity,
  ```
- Line 89: district
  ```
  district,
  ```
- Line 102: child
  ```
  df <- df_children
  ```
- Line 103: child, name
  ```
  filename <- paste0(data, "children_first_job_data.Rdata")
  ```
- Line 104: name
  ```
  save(df, file = filename)
  ```
- Line 105: child
  ```
  rm(df,df_children,df_employment,df_salary)
  ```

**/replication-package/labor_networks/code/inter/prepare_children_first_job_data_multiple2.R**

- Line 1: child
  ```
  # load the children sample
  ```
- Line 2: child, name
  ```
  filename <- paste0(data, "children_sample.Rdata")
  ```
- Line 3: name
  ```
  load(filename)
  ```
- Line 4: child
  ```
  df_children <- df
  ```
- Line 9: child
  ```
  # get all employment history of children
  ```
- Line 15: name
  ```
  filename <- paste0(data, "wages_",t,".Rdata")
  ```
- Line 16: name
  ```
  load(filename)
  ```
- Line 20: child
  ```
  # get firm id and wages of all future jobs of the child
  ```
- Line 21: child
  ```
  df_wages <- merge(df_children[,.(id,id_firm_first_job = id_firm,year_first_job = year)],
  ```
- Line 64: name
  ```
  filename <- paste0(data, "connections_type_multiple2.Rdata")
  ```
- Line 65: name
  ```
  load(filename)
  ```
- Line 66: child
  ```
  df_children = merge(df_children,df[,.(id,id_firm,con_type,max_lag)], by = c("id","id_firm") , all.x 
  ```
- Line 67: child
  ```
  df_children[is.na(con_type),con_type := 0]
  ```
- Line 73: child
  ```
  df_children = merge(df_children,df_salary, by = c("id"), all.x = TRUE)
  ```
- Line 74: child
  ```
  df_children = merge(df_children,df_employment_first_firm, by = c("id"), all.x = TRUE)
  ```
- Line 75: child
  ```
  df_children = merge(df_children,df_employment3, by = c("id"), all.x = TRUE)
  ```
- Line 79: child
  ```
  df_children[,event := 1 * (year + duration_first_job <= last_year)]
  ```
- Line 82: child
  ```
  df_children <- df_children[,.(id,
  ```
- Line 85: sex
  ```
  sex,
  ```
- Line 86: birth
  ```
  age = year - birth_year,
  ```
- Line 88: city
  ```
  ethnicity,
  ```
- Line 89: district
  ```
  district,
  ```
- Line 102: child
  ```
  df <- df_children
  ```
- Line 103: child, name
  ```
  filename <- paste0(data, "children_first_job_data_multiple2.Rdata")
  ```
- Line 104: name
  ```
  save(df, file = filename)
  ```
- Line 105: child
  ```
  rm(df,df_children,df_employment,df_salary)
  ```

**/replication-package/labor_networks/code/inter/prepare_children_panel.R**

- Line 1: child
  ```
  # load the children sample
  ```
- Line 2: child, name
  ```
  filename <- paste0(data, "children_sample.Rdata")
  ```
- Line 3: name
  ```
  load(filename)
  ```
- Line 4: child
  ```
  df_children <- df
  ```
- Line 9: child
  ```
  # get all employment history of children
  ```
- Line 15: name
  ```
  filename <- paste0(data, "wages_",t,".Rdata")
  ```
- Line 16: name
  ```
  load(filename)
  ```
- Line 20: child
  ```
  # get firm id and wages of all future jobs of the child
  ```
- Line 21: child
  ```
  df_wages <- merge(df_children[,.(id,id_firm_first_job = id_firm,year_first_job = year)],
  ```
- Line 35: name
  ```
  filename <- paste0(data, "connections_type.Rdata")
  ```
- Line 36: name
  ```
  load(filename)
  ```
- Line 47: birth, child, city, district, sex
  ```
  df_children[,.(id,sex,birth_year,education = 1*(education>0),ethnicity,district)],
  ```
- Line 49: child
  ```
  rm(df_children)
  ```
- Line 52: birth
  ```
  df_employment[,age := year - birth_year]
  ```
- Line 54: birth
  ```
  df_employment[,age_first_job := year_first_job - birth_year]
  ```
- Line 58: child, name
  ```
  filename <- paste0(data, "children_panel.Rdata")
  ```
- Line 59: name
  ```
  save(df, file = filename)
  ```

**/replication-package/labor_networks/code/inter/prepare_children_panel_employment.R**

- Line 1: child
  ```
  # load the children sample
  ```
- Line 2: child, name
  ```
  filename <- paste0(data, "children_sample_employment.Rdata")
  ```
- Line 3: name
  ```
  load(filename)
  ```
- Line 4: child
  ```
  df_children <- df
  ```
- Line 14: name
  ```
  filename <- paste0(data, "wages_total_",t,".Rdata")
  ```
- Line 15: name
  ```
  load(filename)
  ```
- Line 17: child
  ```
  df = merge(df[salary>0],df_children[,.(id)],by = "id")
  ```
- Line 26: child
  ```
  df = merge(df,df_children[,.(id)],by = "id", all.y = T)
  ```
- Line 50: name
  ```
  filename <- paste0(data, "akm_firm.Rdata")
  ```
- Line 51: name
  ```
  load(filename)
  ```
- Line 57: name
  ```
  filename <- paste0(data, "connections_indirect_employment_pahntom_past.Rdata")
  ```
- Line 58: name
  ```
  load(filename)
  ```
- Line 66: child
  ```
  # merge with other children vars
  ```
- Line 69: birth, child, city, district, sex
  ```
  unique(df_children[,.(id,birth_year,ethnicity, sex,education = education>0,district)]),
  ```
- Line 75: birth, city
  ```
  df_wages[,group := interaction(factor(birth_year),factor(ethnicity),sep = ":")]
  ```
- Line 77: sex
  ```
  df_wages[,group := interaction(group,factor(sex),sep = ":")]
  ```
- Line 79: district
  ```
  df_wages[,group := interaction(group,factor(district),sep = ":")]
  ```
- Line 93: child, name
  ```
  filename <- paste0(data, "children_panel_employment.Rdata")
  ```
- Line 94: name
  ```
  save(df, file = filename)
  ```
- Line 95: child
  ```
  rm(df,df_wages,df_children)
  ```

**/replication-package/labor_networks/code/inter/prepare_children_panel_employment_25.R**

- Line 1: child
  ```
  # load the children sample
  ```
- Line 2: child, name
  ```
  filename <- paste0(data, "children_sample_25.Rdata")
  ```
- Line 3: name
  ```
  load(filename)
  ```
- Line 4: child
  ```
  df_children <- df
  ```
- Line 13: name
  ```
  filename <- paste0(data, "wages_",t,".Rdata")
  ```
- Line 14: name
  ```
  load(filename)
  ```
- Line 16: child
  ```
  df = merge(df[salary>0],df_children[,.(id)],by = "id")
  ```
- Line 25: child
  ```
  df = merge(df,df_children[,.(id)],by = "id", all.y = T)
  ```
- Line 46: name
  ```
  filename <- paste0(data, "connections_type_25.Rdata")
  ```
- Line 47: name
  ```
  load(filename)
  ```
- Line 52: name
  ```
  filename <- paste0(data, "akm_firm.Rdata")
  ```
- Line 53: name
  ```
  load(filename)
  ```
- Line 54: child
  ```
  df_connections = merge(df_connections,df_children[,.(id,year)], by = c("id"))
  ```
- Line 66: child
  ```
  # load other children vars
  ```
- Line 68: child, name
  ```
  filename <- paste0(data, "children_first_job_data_multiple2.Rdata")
  ```
- Line 69: name
  ```
  load(filename)
  ```
- Line 70: child, city, district, sex
  ```
  df_children_first_job <- df[,.(id, year_first_job = year, sex,age_first_job = age,education,ethnicit
  ```
- Line 76: child
  ```
  df_wages = merge(df_wages,df_children_first_job, by = "id")
  ```
- Line 83: city
  ```
  df_wages[,group := interaction(factor(year_first_job),factor(ethnicity),sep = ":")]
  ```
- Line 85: sex
  ```
  df_wages[,group := interaction(group,factor(sex),sep = ":")]
  ```
- Line 87: district
  ```
  df_wages[,group := interaction(group,factor(district),sep = ":")]
  ```

**/replication-package/labor_networks/code/inter/prepare_children_panel_employment_phantom_past.R**

- Line 1: child
  ```
  # load the children sample
  ```
- Line 2: child, name
  ```
  filename <- paste0(data, "children_sample_employment.Rdata")
  ```
- Line 3: name
  ```
  load(filename)
  ```
- Line 4: child
  ```
  df_children <- df
  ```
- Line 13: name
  ```
  filename <- paste0(data, "wages_total_",t,".Rdata")
  ```
- Line 14: name
  ```
  load(filename)
  ```
- Line 16: child
  ```
  df = merge(df[salary>0],df_children[,.(id)],by = "id")
  ```
- Line 25: child
  ```
  df = merge(df,df_children[,.(id)],by = "id", all.y = T)
  ```
- Line 46: name
  ```
  filename <- paste0(data, "akm_firm.Rdata")
  ```
- Line 47: name
  ```
  load(filename)
  ```
- Line 53: name
  ```
  filename <- paste0(data, "connections_indirect_employment_pahntom_past.Rdata")
  ```
- Line 54: name
  ```
  load(filename)
  ```
- Line 62: child
  ```
  # merge with other children vars
  ```
- Line 65: birth, child, city, district, sex
  ```
  unique(df_children[,.(id,birth_year,ethnicity, sex,education = education>0,district)]),
  ```
- Line 71: birth, city
  ```
  df_wages[,group := interaction(factor(birth_year),factor(ethnicity),sep = ":")]
  ```
- Line 73: sex
  ```
  df_wages[,group := interaction(group,factor(sex),sep = ":")]
  ```
- Line 75: district
  ```
  df_wages[,group := interaction(group,factor(district),sep = ":")]
  ```
- Line 97: child, name
  ```
  filename <- paste0(data, "children_panel_employment_phantom_past.Rdata")
  ```
- Line 98: name
  ```
  save(df, file = filename)
  ```

**/replication-package/labor_networks/code/inter/prepare_children_panel_total_5years.R**

- Line 1: child
  ```
  # load the children sample
  ```
- Line 2: child, name
  ```
  filename <- paste0(data, "children_sample.Rdata")
  ```
- Line 3: name
  ```
  load(filename)
  ```
- Line 4: child
  ```
  df_children <- df
  ```
- Line 8: name
  ```
  filename <- paste0(data, "akm_firm.Rdata")
  ```
- Line 9: name
  ```
  load(filename)
  ```
- Line 11: name
  ```
  rm(df,filename)
  ```
- Line 21: name
  ```
  filename <- paste0(data, "wages_total_",t,".Rdata")
  ```
- Line 22: name
  ```
  load(filename)
  ```
- Line 24: child
  ```
  df = merge(df[salary>0],df_children[,.(id)],by = "id")
  ```
- Line 33: child
  ```
  df = merge(df,df_children[,.(id)],by = "id", all.y = T)
  ```
- Line 45: child, name
  ```
  filename <- paste0(data, "children_first_job_data.Rdata")
  ```
- Line 46: name
  ```
  load(filename)
  ```
- Line 48: sex
  ```
  df[,.(id, year_first_job = year, sex,age_first_job = age,
  ```
- Line 49: city, district
  ```
  education,ethnicity,district,con_type,max_lag)],
  ```
- Line 86: city
  ```
  df_wages[,group := interaction(factor(age_first_job),factor(ethnicity),sep = ":")]
  ```
- Line 88: sex
  ```
  df_wages[,group := interaction(group,factor(sex),sep = ":")]
  ```
- Line 90: district
  ```
  df_wages[,group := interaction(group,factor(district),sep = ":")]
  ```
- Line 109: child, name
  ```
  filename <- paste0(data, "children_panel_total_5years.Rdata")
  ```
- Line 110: name
  ```
  save(df, file = filename)
  ```
- Line 111: child
  ```
  rm(df,df_wages,df_wages_subs_job,df_akm,df_children)
  ```

**/replication-package/labor_networks/code/inter/prepare_children_panel_total_5years_multiple2.R**

- Line 1: child
  ```
  # load the children sample
  ```
- Line 2: child, name
  ```
  filename <- paste0(data, "children_sample.Rdata")
  ```
- Line 3: name
  ```
  load(filename)
  ```
- Line 4: child
  ```
  df_children <- df
  ```
- Line 8: name
  ```
  filename <- paste0(data, "akm_firm.Rdata")
  ```
- Line 9: name
  ```
  load(filename)
  ```
- Line 11: name
  ```
  rm(df,filename)
  ```
- Line 21: name
  ```
  filename <- paste0(data, "wages_total_",t,".Rdata")
  ```
- Line 22: name
  ```
  load(filename)
  ```
- Line 24: child
  ```
  df = merge(df[salary>0],df_children[,.(id)],by = "id")
  ```
- Line 33: child
  ```
  df = merge(df,df_children[,.(id)],by = "id", all.y = T)
  ```
- Line 45: child, name
  ```
  filename <- paste0(data, "children_first_job_data_multiple2.Rdata")
  ```
- Line 46: name
  ```
  load(filename)
  ```
- Line 48: sex
  ```
  df[,.(id, year_first_job = year, sex,age_first_job = age,
  ```
- Line 49: city, district
  ```
  education,ethnicity,district,con_type,max_lag)],
  ```
- Line 86: city
  ```
  df_wages[,group := interaction(factor(age_first_job),factor(ethnicity),sep = ":")]
  ```
- Line 88: sex
  ```
  df_wages[,group := interaction(group,factor(sex),sep = ":")]
  ```
- Line 90: district
  ```
  df_wages[,group := interaction(group,factor(district),sep = ":")]
  ```
- Line 114: child, name
  ```
  filename <- paste0(data, "children_panel_total_5years_multiple2.Rdata")
  ```
- Line 115: name
  ```
  save(df, file = filename)
  ```
- Line 116: child
  ```
  rm(df,df_wages,df_wages_subs_job,df_akm,df_children,first_job)
  ```

**/replication-package/labor_networks/code/inter/prepare_children_salary_30.R**

- Line 1: child
  ```
  ## load the children sample
  ```
- Line 2: child, name
  ```
  filename <- paste0(data, "children_sample.Rdata")
  ```
- Line 3: name
  ```
  load(filename)
  ```
- Line 4: child
  ```
  df_children <- df
  ```
- Line 13: name
  ```
  filename <- paste0(data, "wages_",t,".Rdata")
  ```
- Line 14: name
  ```
  load(filename)
  ```
- Line 18: child
  ```
  # get firm id and wages when the child is 30
  ```
- Line 19: birth, child
  ```
  df_children_30 <- merge(df_children[,.(id,birth_year)],
  ```
- Line 20: birth
  ```
  df_wages, by = "id")[t-birth_year == 30]
  ```
- Line 23: child
  ```
  df_children_30[,year := t]
  ```
- Line 25: child
  ```
  df_children_30 = rbind(df_children_30_1,df_children_30)
  ```
- Line 27: child
  ```
  df_children_30_1 <- df_children_30
  ```
- Line 28: child
  ```
  rm(df_children_30)
  ```
- Line 33: name
  ```
  filename <- paste0(data, "akm_firm.Rdata")
  ```
- Line 34: name
  ```
  load(filename)
  ```
- Line 35: child
  ```
  df_children_30_1 <- merge(df_children_30_1,df[,.(id_firm,year,firm_rank)], by = c("id_firm","year"))
  ```
- Line 37: name
  ```
  # rename the vars
  ```
- Line 38: child, lname, name
  ```
  colnames(df_children_30_1)[colnames(df_children_30_1) == "salary"] <- "salary_30"
  ```
- Line 39: child, lname, name
  ```
  colnames(df_children_30_1)[colnames(df_children_30_1) == "id_firm"] <- "id_firm_30"
  ```
- Line 40: child, lname, name
  ```
  colnames(df_children_30_1)[colnames(df_children_30_1) == "salary_rank"] <- "salary_rank_30"
  ```
- Line 41: child, lname, name
  ```
  colnames(df_children_30_1)[colnames(df_children_30_1) == "firm_rank"] <- "firm_rank_30"
  ```
- Line 45: child
  ```
  df <- df_children_30_1
  ```
- Line 46: child, name
  ```
  filename <- paste0(data, "children_salary_30.Rdata")
  ```
- Line 47: name
  ```
  save(df, file = filename)
  ```
- Line 48: child
  ```
  rm(df,df_children_30_1)
  ```

**/replication-package/labor_networks/code/inter/prepare_children_sample.R**

- Line 2: name
  ```
  filename <- paste0(data, "parents_firms.Rdata")
  ```
- Line 3: name
  ```
  load(filename)
  ```
- Line 6: name
  ```
  rm(df,filename)
  ```
- Line 7: child
  ```
  # load the temporary children sample
  ```
- Line 8: child, name
  ```
  filename <- paste0(data, "children_sample1.Rdata")
  ```
- Line 9: name
  ```
  load(filename)
  ```
- Line 10: child
  ```
  df_children <- df
  ```
- Line 11: name
  ```
  rm(df,filename)
  ```
- Line 12: child
  ```
  # keep only children with at least one parent firm
  ```
- Line 13: child
  ```
  df_children <- merge(df_children,df_parents, by = "id")
  ```
- Line 15: child
  ```
  df <- df_children
  ```
- Line 16: child, name
  ```
  filename <- paste0(data, "children_sample.Rdata")
  ```
- Line 17: name
  ```
  save(df, file = filename)
  ```
- Line 18: child
  ```
  rm(df,df_children)
  ```

**/replication-package/labor_networks/code/inter/prepare_children_sample1.R**

- Line 3: name
  ```
  filename <- paste0(data, "employment_history.Rdata")
  ```
- Line 4: name
  ```
  load(filename)
  ```
- Line 5: child
  ```
  df_children <- df
  ```
- Line 8: lat
  ```
  # load the population file
  ```
- Line 9: lat, name
  ```
  filename <- paste0(data, "population.Rdata")
  ```
- Line 10: name
  ```
  load(filename)
  ```
- Line 11: birth, city, father, lat, mother, sex
  ```
  df_population <- df[,.(id,sex,birth_year,native,ethnicity,ultraorthodox,id_father,id_mother)]
  ```
- Line 15: lat, sex
  ```
  df_population <- df_population[!is.na(id) & !is.na(sex) &
  ```
- Line 16: birth, city
  ```
  !is.na(birth_year) & !is.na(ethnicity) & !is.na(ultraorthodox) &
  ```
- Line 17: father, mother
  ```
  !is.na(id_father) & !is.na(id_mother)]
  ```
- Line 19: lat
  ```
  # merge the employment and population files
  ```
- Line 20: child, lat
  ```
  df_children <- merge(df_children, df_population, by = "id")
  ```
- Line 21: lat
  ```
  rm(df_population)
  ```
- Line 23: child
  ```
  # keep children in ages 22-27  + natives (born in Israel and no immigration year information) + non 
  ```
- Line 24: birth, child
  ```
  df_children <- df_children[(year - birth_year >= 22 & year - birth_year <= 27)]
  ```
- Line 25: child
  ```
  df_children <- df_children[native == 1]
  ```
- Line 26: child
  ```
  df_children <- df_children[ultraorthodox == 0]
  ```
- Line 29: name
  ```
  filename <- paste0(data, "education.Rdata")
  ```
- Line 30: name
  ```
  load(filename)
  ```
- Line 32: child
  ```
  df_children <- merge(df_children, df, by = "id", all.x = TRUE)
  ```
- Line 33: child
  ```
  df_children[is.na(education),education := 0]
  ```
- Line 34: birth, child
  ```
  df_children[is.na(graduation_year),graduation_year := birth_year + 21]
  ```
- Line 37: lat
  ```
  # calculate year of first "real" job: 1) more that 4 month during a calender year 2) yearly earnings
  ```
- Line 38: child
  ```
  df_children[ year <= graduation_year , real := 0 ]
  ```
- Line 39: child
  ```
  df_children <- df_children[real == 1]
  ```
- Line 40: child
  ```
  df_children <- df_children[, year_first_job := min(year),by = id]
  ```
- Line 42: child
  ```
  # keep children when year(of first job) >=2006
  ```
- Line 43: child
  ```
  df_children <- df_children[year_first_job >= 2006]
  ```
- Line 45: child
  ```
  # keep one obs per child (get the firm id of the year of first job)
  ```
- Line 46: child
  ```
  df_children <- df_children[year == year_first_job]
  ```
- Line 48: child, loc, location
  ```
  # get the location of the child at the year she is 21
  ```
- Line 51: loc, location, name
  ```
  filename <- paste0(data, "location_",k,".Rdata")
  ```
- Line 52: name
  ```
  load(filename)
  ```
- Line 53: city, district, loc, location, name
  ```
  df_location <- df[,.(id,X,Y,setl_name_ltn,district,subdistrict,city,neighborhood)]
  ```
- Line 55: birth, loc, location
  ```
  df_location[,birth_year := k - 21]
  ```
- Line 57: birth, child, loc, location
  ```
  df_children <- merge(df_children,df_location,by.x = c("id","birth_year"),
  ```
- Line 58: birth
  ```
  by.y = c("id","birth_year"), all.x = TRUE)
  ```
- Line 59: birth, child
  ```
  df_children[birth_year == k - 21, X_temp := X]
  ```
- Line 60: birth, child
  ```
  df_children[birth_year == k - 21, Y_temp := Y]
  ```
- Line 61: birth, child, name
  ```
  df_children[birth_year == k - 21, setl_name_ltn_temp := setl_name_ltn]
  ```
- Line 62: birth, child, district
  ```
  df_children[birth_year == k - 21, district_temp := district]
  ```
- Line 63: birth, child, district
  ```
  df_children[birth_year == k - 21, subdistrict_temp := subdistrict]
  ```
- Line 64: birth, child, city
  ```
  df_children[birth_year == k - 21, city_temp := city]
  ```
- Line 65: birth, child
  ```
  df_children[birth_year == k - 21, neighborhood_temp := neighborhood]
  ```
- Line 67: child, city, district, name
  ```
  df_children[,c("X","Y","setl_name_ltn","district","subdistrict","city","neighborhood") := NULL]
  ```
- Line 68: loc, location
  ```
  rm(df_location)
  ```
- Line 70: child, lname, name
  ```
  colnames(df_children)[colnames(df_children) == "X_temp"] <- "X"
  ```
- Line 71: child, lname, name
  ```
  colnames(df_children)[colnames(df_children) == "Y_temp"] <- "Y"
  ```
- Line 72: child, lname, name
  ```
  colnames(df_children)[colnames(df_children) == "setl_name_ltn_temp"] <- "setl_name_ltn"
  ```
- Line 73: child, district, lname, name
  ```
  colnames(df_children)[colnames(df_children) == "district_temp"] <- "district"
  ```
- Line 74: child, district, lname, name
  ```
  colnames(df_children)[colnames(df_children) == "subdistrict_temp"] <- "subdistrict"
  ```
- Line 75: child, city, lname, name
  ```
  colnames(df_children)[colnames(df_children) == "city_temp"] <- "city"
  ```
- Line 76: child, lname, name
  ```
  colnames(df_children)[colnames(df_children) == "neighborhood_temp"] <- "neighborhood"
  ```
- Line 78: child, loc, location
  ```
  # keep only children with location information
  ```
- Line 79: child
  ```
  df_children <- df_children[!is.na(X) & !is.na(Y) &
  ```
- Line 80: city, district
  ```
  !is.na(district) & !is.na(subdistrict) & !is.na(city) & !is.na(neighborhood)]
  ```
- Line 83: birth, child, city, sex
  ```
  df <- df_children[,.(id,sex,birth_year,native,ethnicity, id_firm,year = year_first_job,
  ```
- Line 85: city, district, name
  ```
  setl_name_ltn,district,subdistrict,city,neighborhood)]
  ```
- Line 88: child, name
  ```
  filename <- paste0(data, "children_sample1.Rdata")
  ```
- Line 89: name
  ```
  save(df, file = filename)
  ```
- Line 90: child
  ```
  rm(df,df_children)
  ```

**/replication-package/labor_networks/code/inter/prepare_children_sample1_1927.R**

- Line 3: name
  ```
  filename <- paste0(data, "employment_history_1927.Rdata")
  ```
- Line 4: name
  ```
  load(filename)
  ```
- Line 5: child
  ```
  df_children <- df
  ```
- Line 8: lat
  ```
  # load the population file
  ```
- Line 9: lat, name
  ```
  filename <- paste0(data, "population.Rdata")
  ```
- Line 10: name
  ```
  load(filename)
  ```
- Line 11: birth, city, father, lat, mother, sex
  ```
  df_population <- df[,.(id,sex,birth_year,native,ethnicity,ultraorthodox,id_father,id_mother)]
  ```
- Line 15: lat, sex
  ```
  df_population <- df_population[!is.na(id) & !is.na(sex) &
  ```
- Line 16: birth, city
  ```
  !is.na(birth_year) & !is.na(ethnicity) & !is.na(ultraorthodox) &
  ```
- Line 17: father, mother
  ```
  !is.na(id_father) & !is.na(id_mother)]
  ```
- Line 19: lat
  ```
  # merge the employment and population files
  ```
- Line 20: child, lat
  ```
  df_children <- merge(df_children, df_population, by = "id")
  ```
- Line 21: lat
  ```
  rm(df_population)
  ```
- Line 23: child
  ```
  # keep children in ages 19-27  + natives (born in Israel and no immigration year information) + non 
  ```
- Line 24: birth, child
  ```
  df_children <- df_children[(year - birth_year >= 19 & year - birth_year <= 27)]
  ```
- Line 25: child
  ```
  df_children <- df_children[native == 1]
  ```
- Line 26: child
  ```
  df_children <- df_children[ultraorthodox == 0]
  ```
- Line 29: name
  ```
  filename <- paste0(data, "education.Rdata")
  ```
- Line 30: name
  ```
  load(filename)
  ```
- Line 32: child
  ```
  df_children <- merge(df_children, df, by = "id", all.x = TRUE)
  ```
- Line 33: child
  ```
  df_children[is.na(education),education := 0]
  ```
- Line 34: birth, child
  ```
  df_children[is.na(graduation_year),graduation_year := birth_year + 18]
  ```
- Line 37: lat
  ```
  # calculate year of first "real" job: 1) more that 4 month during a calender year 2) yearly earnings
  ```
- Line 38: child
  ```
  df_children[ year <= graduation_year , real := 0 ]
  ```
- Line 39: child
  ```
  df_children <- df_children[real == 1]
  ```
- Line 40: child
  ```
  df_children <- df_children[, year_first_job := min(year),by = id]
  ```
- Line 42: child
  ```
  # keep children when year(of first job) >=2009
  ```
- Line 43: child
  ```
  df_children <- df_children[year_first_job >= 2009]
  ```
- Line 45: child
  ```
  # keep one obs per child (get the firm id of the year of first job)
  ```
- Line 46: child
  ```
  df_children <- df_children[year == year_first_job]
  ```
- Line 48: child, loc, location
  ```
  # get the location of the child at the year she is 18
  ```
- Line 51: loc, location, name
  ```
  filename <- paste0(data, "location_",k,".Rdata")
  ```
- Line 52: name
  ```
  load(filename)
  ```
- Line 53: city, district, loc, location, name
  ```
  df_location <- df[,.(id,X,Y,setl_name_ltn,district,subdistrict,city,neighborhood)]
  ```
- Line 55: birth, loc, location
  ```
  df_location[,birth_year := k - 18]
  ```
- Line 57: birth, child, loc, location
  ```
  df_children <- merge(df_children,df_location,by.x = c("id","birth_year"),
  ```
- Line 58: birth
  ```
  by.y = c("id","birth_year"), all.x = TRUE)
  ```
- Line 59: birth, child
  ```
  df_children[birth_year == k - 18, X_temp := X]
  ```
- Line 60: birth, child
  ```
  df_children[birth_year == k - 18, Y_temp := Y]
  ```
- Line 61: birth, child, name
  ```
  df_children[birth_year == k - 18, setl_name_ltn_temp := setl_name_ltn]
  ```
- Line 62: birth, child, district
  ```
  df_children[birth_year == k - 18, district_temp := district]
  ```
- Line 63: birth, child, district
  ```
  df_children[birth_year == k - 18, subdistrict_temp := subdistrict]
  ```
- Line 64: birth, child, city
  ```
  df_children[birth_year == k - 18, city_temp := city]
  ```
- Line 65: birth, child
  ```
  df_children[birth_year == k - 18, neighborhood_temp := neighborhood]
  ```
- Line 67: child, city, district, name
  ```
  df_children[,c("X","Y","setl_name_ltn","district","subdistrict","city","neighborhood") := NULL]
  ```
- Line 68: loc, location
  ```
  rm(df_location)
  ```
- Line 70: child, lname, name
  ```
  colnames(df_children)[colnames(df_children) == "X_temp"] <- "X"
  ```
- Line 71: child, lname, name
  ```
  colnames(df_children)[colnames(df_children) == "Y_temp"] <- "Y"
  ```
- Line 72: child, lname, name
  ```
  colnames(df_children)[colnames(df_children) == "setl_name_ltn_temp"] <- "setl_name_ltn"
  ```
- Line 73: child, district, lname, name
  ```
  colnames(df_children)[colnames(df_children) == "district_temp"] <- "district"
  ```
- Line 74: child, district, lname, name
  ```
  colnames(df_children)[colnames(df_children) == "subdistrict_temp"] <- "subdistrict"
  ```
- Line 75: child, city, lname, name
  ```
  colnames(df_children)[colnames(df_children) == "city_temp"] <- "city"
  ```
- Line 76: child, lname, name
  ```
  colnames(df_children)[colnames(df_children) == "neighborhood_temp"] <- "neighborhood"
  ```
- Line 78: child, loc, location
  ```
  # keep only children with location information
  ```
- Line 79: child
  ```
  df_children <- df_children[!is.na(X) & !is.na(Y) &
  ```
- Line 80: city, district
  ```
  !is.na(district) & !is.na(subdistrict) & !is.na(city) & !is.na(neighborhood)]
  ```
- Line 83: birth, child, city, sex
  ```
  df <- df_children[,.(id,sex,birth_year,native,ethnicity, id_firm,year = year_first_job,
  ```
- Line 85: city, district, name
  ```
  setl_name_ltn,district,subdistrict,city,neighborhood)]
  ```
- Line 88: child, name
  ```
  filename <- paste0(data, "children_sample1_1927.Rdata")
  ```
- Line 89: name
  ```
  save(df, file = filename)
  ```
- Line 90: child
  ```
  rm(df,df_children)
  ```

**/replication-package/labor_networks/code/inter/prepare_children_sample1_25.R**

- Line 3: name
  ```
  filename <- paste0(data, "employment_history.Rdata")
  ```
- Line 4: name
  ```
  load(filename)
  ```
- Line 5: child
  ```
  df_children <- df
  ```
- Line 8: lat
  ```
  # load the population file
  ```
- Line 9: lat, name
  ```
  filename <- paste0(data, "population.Rdata")
  ```
- Line 10: name
  ```
  load(filename)
  ```
- Line 11: birth, city, father, lat, mother, sex
  ```
  df_population <- df[,.(id,sex,birth_year,native,ethnicity,ultraorthodox,id_father,id_mother)]
  ```
- Line 15: lat, sex
  ```
  df_population <- df_population[!is.na(id) & !is.na(sex) &
  ```
- Line 16: birth, city
  ```
  !is.na(birth_year) & !is.na(ethnicity) & !is.na(ultraorthodox) &
  ```
- Line 17: father, mother
  ```
  !is.na(id_father) & !is.na(id_mother)]
  ```
- Line 19: lat
  ```
  # merge the employment and population files
  ```
- Line 20: child, lat
  ```
  df_children <- merge(df_children, df_population, by = "id")
  ```
- Line 21: lat
  ```
  rm(df_population)
  ```
- Line 23: child
  ```
  # keep children at age 25  + natives (born in Israel and no immigration year information) + non ultr
  ```
- Line 24: birth, child
  ```
  df_children <- df_children[(year - birth_year == 25)]
  ```
- Line 25: child
  ```
  df_children <- df_children[native == 1]
  ```
- Line 26: child
  ```
  df_children <- df_children[ultraorthodox == 0]
  ```
- Line 29: name
  ```
  filename <- paste0(data, "education.Rdata")
  ```
- Line 30: name
  ```
  load(filename)
  ```
- Line 32: child
  ```
  df_children <- merge(df_children, df, by = "id", all.x = TRUE)
  ```
- Line 33: child
  ```
  df_children[is.na(education),education := 0]
  ```
- Line 34: birth, child
  ```
  df_children[is.na(graduation_year),graduation_year := birth_year + 21]
  ```
- Line 37: child
  ```
  # call the year that the child is 25 the year of first job
  ```
- Line 38: child
  ```
  df_children <- df_children[, year_first_job := min(year),by = id]
  ```
- Line 40: child
  ```
  # keep children when year(of first job) >=2006
  ```
- Line 41: child
  ```
  df_children <- df_children[year_first_job >= 2006]
  ```
- Line 43: child
  ```
  # keep one obs per child (get the firm id of the year of first job)
  ```
- Line 44: child
  ```
  df_children <- df_children[year == year_first_job]
  ```
- Line 46: child, loc, location
  ```
  # get the location of the child at the year she is 21
  ```
- Line 49: loc, location, name
  ```
  filename <- paste0(data, "location_",k,".Rdata")
  ```
- Line 50: name
  ```
  load(filename)
  ```
- Line 51: city, district, loc, location, name
  ```
  df_location <- df[,.(id,X,Y,setl_name_ltn,district,subdistrict,city,neighborhood)]
  ```
- Line 53: birth, loc, location
  ```
  df_location[,birth_year := k - 21]
  ```
- Line 55: birth, child, loc, location
  ```
  df_children <- merge(df_children,df_location,by.x = c("id","birth_year"),
  ```
- Line 56: birth
  ```
  by.y = c("id","birth_year"), all.x = TRUE)
  ```
- Line 57: birth, child
  ```
  df_children[birth_year == k - 21, X_temp := X]
  ```
- Line 58: birth, child
  ```
  df_children[birth_year == k - 21, Y_temp := Y]
  ```
- Line 59: birth, child, name
  ```
  df_children[birth_year == k - 21, setl_name_ltn_temp := setl_name_ltn]
  ```
- Line 60: birth, child, district
  ```
  df_children[birth_year == k - 21, district_temp := district]
  ```
- Line 61: birth, child, district
  ```
  df_children[birth_year == k - 21, subdistrict_temp := subdistrict]
  ```
- Line 62: birth, child, city
  ```
  df_children[birth_year == k - 21, city_temp := city]
  ```
- Line 63: birth, child
  ```
  df_children[birth_year == k - 21, neighborhood_temp := neighborhood]
  ```
- Line 65: child, city, district, name
  ```
  df_children[,c("X","Y","setl_name_ltn","district","subdistrict","city","neighborhood") := NULL]
  ```
- Line 66: loc, location
  ```
  rm(df_location)
  ```
- Line 68: child, lname, name
  ```
  colnames(df_children)[colnames(df_children) == "X_temp"] <- "X"
  ```
- Line 69: child, lname, name
  ```
  colnames(df_children)[colnames(df_children) == "Y_temp"] <- "Y"
  ```
- Line 70: child, lname, name
  ```
  colnames(df_children)[colnames(df_children) == "setl_name_ltn_temp"] <- "setl_name_ltn"
  ```
- Line 71: child, district, lname, name
  ```
  colnames(df_children)[colnames(df_children) == "district_temp"] <- "district"
  ```
- Line 72: child, district, lname, name
  ```
  colnames(df_children)[colnames(df_children) == "subdistrict_temp"] <- "subdistrict"
  ```
- Line 73: child, city, lname, name
  ```
  colnames(df_children)[colnames(df_children) == "city_temp"] <- "city"
  ```
- Line 74: child, lname, name
  ```
  colnames(df_children)[colnames(df_children) == "neighborhood_temp"] <- "neighborhood"
  ```
- Line 76: child, loc, location
  ```
  # keep only children with location information
  ```
- Line 77: child
  ```
  df_children <- df_children[!is.na(X) & !is.na(Y) &
  ```
- Line 78: city, district
  ```
  !is.na(district) & !is.na(subdistrict) & !is.na(city) & !is.na(neighborhood)]
  ```
- Line 81: birth, child, city, sex
  ```
  df <- df_children[,.(id,sex,birth_year,native,ethnicity, id_firm,year = year_first_job,
  ```
- Line 83: city, district, name
  ```
  setl_name_ltn,district,subdistrict,city,neighborhood)]
  ```
- Line 86: child, name
  ```
  filename <- paste0(data, "children_sample1_25.Rdata")
  ```
- Line 87: name
  ```
  save(df, file = filename)
  ```
- Line 88: child
  ```
  rm(df,df_children)
  ```

**/replication-package/labor_networks/code/inter/prepare_children_sample1_employment.R**

- Line 3: name
  ```
  filename <- paste0(data, "employment_history.Rdata")
  ```
- Line 4: name
  ```
  load(filename)
  ```
- Line 5: child
  ```
  df_children <- df
  ```
- Line 8: lat
  ```
  # load the population file
  ```
- Line 9: lat, name
  ```
  filename <- paste0(data, "population.Rdata")
  ```
- Line 10: name
  ```
  load(filename)
  ```
- Line 11: birth, city, father, lat, mother, sex
  ```
  df_population <- df[,.(id,sex,birth_year,native,ethnicity,ultraorthodox,id_father,id_mother)]
  ```
- Line 15: lat, sex
  ```
  df_population <- df_population[!is.na(id) & !is.na(sex) &
  ```
- Line 16: birth, city
  ```
  !is.na(birth_year) & !is.na(ethnicity) & !is.na(ultraorthodox) &
  ```
- Line 17: father, mother
  ```
  !is.na(id_father) & !is.na(id_mother)]
  ```
- Line 19: lat
  ```
  # merge the employment and population files
  ```
- Line 20: child, lat
  ```
  df_children <- merge(df_children, df_population, by = "id")
  ```
- Line 21: lat
  ```
  rm(df_population)
  ```
- Line 23: child
  ```
  # keep children born 1979-1993, natives and not ultraorthodox
  ```
- Line 24: birth, child
  ```
  df_children <- df_children[(birth_year >= 1979 & birth_year <= 1993 )]
  ```
- Line 25: child
  ```
  df_children <- df_children[native == 1]
  ```
- Line 26: child
  ```
  df_children <- df_children[ultraorthodox == 0]
  ```
- Line 29: name
  ```
  filename <- paste0(data, "education.Rdata")
  ```
- Line 30: name
  ```
  load(filename)
  ```
- Line 32: child
  ```
  df_children <- merge(df_children, df, by = "id", all.x = TRUE)
  ```
- Line 33: child
  ```
  df_children[is.na(education),education := 0]
  ```
- Line 34: birth, child
  ```
  df_children[is.na(graduation_year),graduation_year := birth_year + 21]
  ```
- Line 37: child
  ```
  # call the year that the child is 25 the year of first job
  ```
- Line 38: child
  ```
  df_children <- df_children[, year_first_job := min(year),by = id]
  ```
- Line 40: child
  ```
  # keep children when year(of first job) >=2006
  ```
- Line 41: child
  ```
  df_children <- df_children[year_first_job >= 2006]
  ```
- Line 43: child
  ```
  # keep one obs per child (get the firm id of the year of first job)
  ```
- Line 44: child
  ```
  df_children <- df_children[year == year_first_job]
  ```
- Line 46: child, loc, location
  ```
  # get the location of the child at the year she is 21
  ```
- Line 49: loc, location, name
  ```
  filename <- paste0(data, "location_",k,".Rdata")
  ```
- Line 50: name
  ```
  load(filename)
  ```
- Line 51: city, district, loc, location, name
  ```
  df_location <- df[,.(id,X,Y,setl_name_ltn,district,subdistrict,city,neighborhood)]
  ```
- Line 53: birth, loc, location
  ```
  df_location[,birth_year := k - 21]
  ```
- Line 55: birth, child, loc, location
  ```
  df_children <- merge(df_children,df_location,by.x = c("id","birth_year"),
  ```
- Line 56: birth
  ```
  by.y = c("id","birth_year"), all.x = TRUE)
  ```
- Line 57: birth, child
  ```
  df_children[birth_year == k - 21, X_temp := X]
  ```
- Line 58: birth, child
  ```
  df_children[birth_year == k - 21, Y_temp := Y]
  ```
- Line 59: birth, child, name
  ```
  df_children[birth_year == k - 21, setl_name_ltn_temp := setl_name_ltn]
  ```
- Line 60: birth, child, district
  ```
  df_children[birth_year == k - 21, district_temp := district]
  ```
- Line 61: birth, child, district
  ```
  df_children[birth_year == k - 21, subdistrict_temp := subdistrict]
  ```
- Line 62: birth, child, city
  ```
  df_children[birth_year == k - 21, city_temp := city]
  ```
- Line 63: birth, child
  ```
  df_children[birth_year == k - 21, neighborhood_temp := neighborhood]
  ```
- Line 65: child, city, district, name
  ```
  df_children[,c("X","Y","setl_name_ltn","district","subdistrict","city","neighborhood") := NULL]
  ```
- Line 66: loc, location
  ```
  rm(df_location)
  ```
- Line 68: child, lname, name
  ```
  colnames(df_children)[colnames(df_children) == "X_temp"] <- "X"
  ```
- Line 69: child, lname, name
  ```
  colnames(df_children)[colnames(df_children) == "Y_temp"] <- "Y"
  ```
- Line 70: child, lname, name
  ```
  colnames(df_children)[colnames(df_children) == "setl_name_ltn_temp"] <- "setl_name_ltn"
  ```
- Line 71: child, district, lname, name
  ```
  colnames(df_children)[colnames(df_children) == "district_temp"] <- "district"
  ```
- Line 72: child, district, lname, name
  ```
  colnames(df_children)[colnames(df_children) == "subdistrict_temp"] <- "subdistrict"
  ```
- Line 73: child, city, lname, name
  ```
  colnames(df_children)[colnames(df_children) == "city_temp"] <- "city"
  ```
- Line 74: child, lname, name
  ```
  colnames(df_children)[colnames(df_children) == "neighborhood_temp"] <- "neighborhood"
  ```
- Line 76: child, loc, location
  ```
  # keep only children with location information
  ```
- Line 77: child
  ```
  df_children <- df_children[!is.na(X) & !is.na(Y) &
  ```
- Line 78: city, district
  ```
  !is.na(district) & !is.na(subdistrict) & !is.na(city) & !is.na(neighborhood)]
  ```
- Line 81: birth, child, city, sex
  ```
  df <- df_children[,.(id,sex,birth_year,native,ethnicity, id_firm,year = year_first_job,
  ```
- Line 83: city, district, name
  ```
  setl_name_ltn,district,subdistrict,city,neighborhood)]
  ```
- Line 86: child, name
  ```
  filename <- paste0(data, "children_sample1_employment.Rdata")
  ```
- Line 87: name
  ```
  save(df, file = filename)
  ```
- Line 88: child
  ```
  rm(df,df_children)
  ```

**/replication-package/labor_networks/code/inter/prepare_children_sample1_grad1.R**

- Line 3: name
  ```
  filename <- paste0(data, "employment_history.Rdata")
  ```
- Line 4: name
  ```
  load(filename)
  ```
- Line 5: child
  ```
  df_children <- df
  ```
- Line 8: lat
  ```
  # load the population file
  ```
- Line 9: lat, name
  ```
  filename <- paste0(data, "population.Rdata")
  ```
- Line 10: name
  ```
  load(filename)
  ```
- Line 11: birth, city, father, lat, mother, sex
  ```
  df_population <- df[,.(id,sex,birth_year,native,ethnicity,ultraorthodox,id_father,id_mother)]
  ```
- Line 15: lat, sex
  ```
  df_population <- df_population[!is.na(id) & !is.na(sex) &
  ```
- Line 16: birth, city
  ```
  !is.na(birth_year) & !is.na(ethnicity) & !is.na(ultraorthodox) &
  ```
- Line 17: father, mother
  ```
  !is.na(id_father) & !is.na(id_mother)]
  ```
- Line 19: lat
  ```
  # merge the employment and population files
  ```
- Line 20: child, lat
  ```
  df_children <- merge(df_children, df_population, by = "id")
  ```
- Line 21: lat
  ```
  rm(df_population)
  ```
- Line 23: child
  ```
  # keep children in ages 22-27  + natives (born in Israel and no immigration year information) + non 
  ```
- Line 24: birth, child
  ```
  df_children <- df_children[(year - birth_year >= 22 & year - birth_year <= 27)]
  ```
- Line 25: child
  ```
  df_children <- df_children[native == 1]
  ```
- Line 26: child
  ```
  df_children <- df_children[ultraorthodox == 0]
  ```
- Line 29: name
  ```
  filename <- paste0(data, "education.Rdata")
  ```
- Line 30: name
  ```
  load(filename)
  ```
- Line 32: child
  ```
  df_children <- merge(df_children, df, by = "id", all.x = TRUE)
  ```
- Line 33: child
  ```
  df_children[is.na(education),education := 0]
  ```
- Line 34: birth, child
  ```
  df_children[is.na(graduation_year),graduation_year := birth_year + 21]
  ```
- Line 38: child
  ```
  df_children <- df_children[, year_first_job := graduation_year + 1,by = id]
  ```
- Line 40: child
  ```
  # keep children when year(of first job) >=2006
  ```
- Line 41: child
  ```
  df_children <- df_children[year_first_job >= 2006]
  ```
- Line 43: child
  ```
  # keep one obs per child (get the firm id of the year of first job)
  ```
- Line 44: child
  ```
  df_children <- df_children[year == year_first_job]
  ```
- Line 46: child, loc, location
  ```
  # get the location of the child at the year she is 21
  ```
- Line 49: loc, location, name
  ```
  filename <- paste0(data, "location_",k,".Rdata")
  ```
- Line 50: name
  ```
  load(filename)
  ```
- Line 51: city, district, loc, location, name
  ```
  df_location <- df[,.(id,X,Y,setl_name_ltn,district,subdistrict,city,neighborhood)]
  ```
- Line 53: birth, loc, location
  ```
  df_location[,birth_year := k - 21]
  ```
- Line 55: birth, child, loc, location
  ```
  df_children <- merge(df_children,df_location,by.x = c("id","birth_year"),
  ```
- Line 56: birth
  ```
  by.y = c("id","birth_year"), all.x = TRUE)
  ```
- Line 57: birth, child
  ```
  df_children[birth_year == k - 21, X_temp := X]
  ```
- Line 58: birth, child
  ```
  df_children[birth_year == k - 21, Y_temp := Y]
  ```
- Line 59: birth, child, name
  ```
  df_children[birth_year == k - 21, setl_name_ltn_temp := setl_name_ltn]
  ```
- Line 60: birth, child, district
  ```
  df_children[birth_year == k - 21, district_temp := district]
  ```
- Line 61: birth, child, district
  ```
  df_children[birth_year == k - 21, subdistrict_temp := subdistrict]
  ```
- Line 62: birth, child, city
  ```
  df_children[birth_year == k - 21, city_temp := city]
  ```
- Line 63: birth, child
  ```
  df_children[birth_year == k - 21, neighborhood_temp := neighborhood]
  ```
- Line 65: child, city, district, name
  ```
  df_children[,c("X","Y","setl_name_ltn","district","subdistrict","city","neighborhood") := NULL]
  ```
- Line 66: loc, location
  ```
  rm(df_location)
  ```
- Line 68: child, lname, name
  ```
  colnames(df_children)[colnames(df_children) == "X_temp"] <- "X"
  ```
- Line 69: child, lname, name
  ```
  colnames(df_children)[colnames(df_children) == "Y_temp"] <- "Y"
  ```
- Line 70: child, lname, name
  ```
  colnames(df_children)[colnames(df_children) == "setl_name_ltn_temp"] <- "setl_name_ltn"
  ```
- Line 71: child, district, lname, name
  ```
  colnames(df_children)[colnames(df_children) == "district_temp"] <- "district"
  ```
- Line 72: child, district, lname, name
  ```
  colnames(df_children)[colnames(df_children) == "subdistrict_temp"] <- "subdistrict"
  ```
- Line 73: child, city, lname, name
  ```
  colnames(df_children)[colnames(df_children) == "city_temp"] <- "city"
  ```
- Line 74: child, lname, name
  ```
  colnames(df_children)[colnames(df_children) == "neighborhood_temp"] <- "neighborhood"
  ```
- Line 76: child, loc, location
  ```
  # keep only children with location information
  ```
- Line 77: child
  ```
  df_children <- df_children[!is.na(X) & !is.na(Y) &
  ```
- Line 78: city, district
  ```
  !is.na(district) & !is.na(subdistrict) & !is.na(city) & !is.na(neighborhood)]
  ```
- Line 81: birth, child, city, sex
  ```
  df <- df_children[,.(id,sex,birth_year,native,ethnicity, id_firm,year = year_first_job,
  ```
- Line 83: city, district, name
  ```
  setl_name_ltn,district,subdistrict,city,neighborhood)]
  ```
- Line 86: child, name
  ```
  filename <- paste0(data, "children_sample1_grad1.Rdata")
  ```
- Line 87: name
  ```
  save(df, file = filename)
  ```
- Line 88: child
  ```
  rm(df,df_children)
  ```

**/replication-package/labor_networks/code/inter/prepare_children_sample_1927.R**

- Line 2: name
  ```
  filename <- paste0(data, "parents_firms_1927.Rdata")
  ```
- Line 3: name
  ```
  load(filename)
  ```
- Line 6: name
  ```
  rm(df,filename)
  ```
- Line 8: child
  ```
  # load the temporary children sample
  ```
- Line 9: child, name
  ```
  filename <- paste0(data, "children_sample1_1927.Rdata")
  ```
- Line 10: name
  ```
  load(filename)
  ```
- Line 11: child
  ```
  df_children <- df
  ```
- Line 12: name
  ```
  rm(df,filename)
  ```
- Line 14: child
  ```
  # keep only children with at least one parent firm
  ```
- Line 15: child
  ```
  df_children <- merge(df_children,df_parents, by = "id")
  ```
- Line 18: child
  ```
  df <- df_children
  ```
- Line 19: child, name
  ```
  filename <- paste0(data, "children_sample_1927.Rdata")
  ```
- Line 20: name
  ```
  save(df, file = filename)
  ```
- Line 21: child
  ```
  rm(df,df_children)
  ```

**/replication-package/labor_networks/code/inter/prepare_children_sample_25.R**

- Line 2: name
  ```
  filename <- paste0(data, "parents_firms_25.Rdata")
  ```
- Line 3: name
  ```
  load(filename)
  ```
- Line 6: name
  ```
  rm(df,filename)
  ```
- Line 8: child
  ```
  # load the temporary children sample
  ```
- Line 9: child, name
  ```
  filename <- paste0(data, "children_sample1_25.Rdata")
  ```
- Line 10: name
  ```
  load(filename)
  ```
- Line 11: child
  ```
  df_children <- df
  ```
- Line 12: name
  ```
  rm(df,filename)
  ```
- Line 14: child
  ```
  # keep only children with at least one parent firm
  ```
- Line 15: child
  ```
  df_children <- merge(df_children,df_parents, by = "id")
  ```
- Line 18: child
  ```
  df <- df_children
  ```
- Line 19: child, name
  ```
  filename <- paste0(data, "children_sample_25.Rdata")
  ```
- Line 20: name
  ```
  save(df, file = filename)
  ```
- Line 21: child
  ```
  rm(df,df_children)
  ```

**/replication-package/labor_networks/code/inter/prepare_children_sample_employment.R**

- Line 2: name
  ```
  filename <- paste0(data, "parents_firms_employment.Rdata")
  ```
- Line 3: name
  ```
  load(filename)
  ```
- Line 6: name
  ```
  rm(df,filename)
  ```
- Line 8: child
  ```
  # load the temporary children sample
  ```
- Line 9: child, name
  ```
  filename <- paste0(data, "children_sample1_employment.Rdata")
  ```
- Line 10: name
  ```
  load(filename)
  ```
- Line 11: child
  ```
  df_children <- df
  ```
- Line 12: name
  ```
  rm(df,filename)
  ```
- Line 14: child
  ```
  # keep only children with at least one parent firm
  ```
- Line 15: child
  ```
  df_children <- merge(df_children,df_parents, by = "id")
  ```
- Line 18: child
  ```
  df <- df_children
  ```
- Line 19: child, name
  ```
  filename <- paste0(data, "children_sample_employment.Rdata")
  ```
- Line 20: name
  ```
  save(df, file = filename)
  ```
- Line 21: child
  ```
  rm(df,df_children,df_parents)
  ```

**/replication-package/labor_networks/code/inter/prepare_children_sample_grad1.R**

- Line 2: name
  ```
  filename <- paste0(data, "parents_firms_grad1.Rdata")
  ```
- Line 3: name
  ```
  load(filename)
  ```
- Line 6: name
  ```
  rm(df,filename)
  ```
- Line 8: child
  ```
  # load the temporary children sample
  ```
- Line 9: child, name
  ```
  filename <- paste0(data, "children_sample1_grad1.Rdata")
  ```
- Line 10: name
  ```
  load(filename)
  ```
- Line 11: child
  ```
  df_children <- df
  ```
- Line 12: name
  ```
  rm(df,filename)
  ```
- Line 14: child
  ```
  # keep only children with at least one parent firm
  ```
- Line 15: child
  ```
  df_children <- merge(df_children,df_parents, by = "id")
  ```
- Line 18: child
  ```
  df <- df_children
  ```
- Line 19: child, name
  ```
  filename <- paste0(data, "children_sample_grad1.Rdata")
  ```
- Line 20: name
  ```
  save(df, file = filename)
  ```
- Line 21: child
  ```
  rm(df,df_children)
  ```

**/replication-package/labor_networks/code/inter/prepare_connections_employment_rate_25_20.R**

- Line 5: birth
  ```
  first_birth_year <- 1979
  ```
- Line 6: birth
  ```
  last_birth_year <- 1993
  ```
- Line 10: name
  ```
  filename <- paste0(data, "employment_history.Rdata")
  ```
- Line 11: name
  ```
  load(filename)
  ```
- Line 13: name
  ```
  rm(df,filename)
  ```
- Line 15: child
  ```
  # load the children sample
  ```
- Line 16: child, name
  ```
  filename <- paste0(data, "children_sample_25.Rdata")
  ```
- Line 17: name
  ```
  load(filename)
  ```
- Line 18: child
  ```
  df_children_sample1 <- df
  ```
- Line 19: name
  ```
  rm(df,filename)
  ```
- Line 21: child
  ```
  # load children-parents link
  ```
- Line 22: name
  ```
  filename <- paste0(data, "df_parents.Rdata")
  ```
- Line 23: name
  ```
  load(filename)
  ```
- Line 25: name
  ```
  rm(df,filename)
  ```
- Line 27: name
  ```
  filename <- paste0(data, "akm_firm.Rdata")
  ```
- Line 28: name
  ```
  load(filename)
  ```
- Line 30: name
  ```
  rm(df,filename)
  ```
- Line 35: birth
  ```
  for (b in first_birth_year:last_birth_year){
  ```
- Line 42: birth, child
  ```
  df_children_sample <- df_children_sample1[year == t & birth_year == b]
  ```
- Line 45: child
  ```
  df_connections <- merge(df_children_sample[,.(id)],
  ```
- Line 49: child
  ```
  rm(df_children_sample)
  ```
- Line 56: child
  ```
  # get children-past parent firms link (10 years before the the child is 21)
  ```
- Line 65: child, lname, name
  ```
  colnames(df_connections)[colnames(df_connections) == "id"] <- "id_child"
  ```
- Line 66: lname, name
  ```
  colnames(df_connections)[colnames(df_connections) == "id2"] <- "id_parent"
  ```
- Line 76: lname, name
  ```
  colnames(df_connections)[colnames(df_connections) == "id"] <- "id_pco"
  ```
- Line 77: lname, name
  ```
  colnames(df_connections)[colnames(df_connections) == "id_firm"] <- "id_firm_past"
  ```
- Line 78: lname, name
  ```
  colnames(df_connections)[colnames(df_connections) == "year"] <- "year_parent_past"
  ```
- Line 79: lname, name
  ```
  colnames(df_connections)[colnames(df_connections) == "year1"] <- "year_pco_past"
  ```
- Line 81: child
  ```
  # collapse by id_child,id_pco
  ```
- Line 85: child
  ```
  by = .(id_child,id_pco)]
  ```
- Line 95: child, lname, name
  ```
  colnames(df_connections)[colnames(df_connections) == "id_child"] <- "id"
  ```
- Line 110: child, lname, name
  ```
  colnames(df_connections)[colnames(df_connections) == "id_child"] <- "id"
  ```
- Line 136: name
  ```
  filename <- paste0(data, "connections_indirect_25_pahntom_past.Rdata")
  ```
- Line 137: name
  ```
  save(df, file = filename)
  ```
- Line 138: name
  ```
  rm(df,df1,filename)
  ```

**/replication-package/labor_networks/code/inter/prepare_connections_firm_rank.R**

- Line 1: child
  ```
  # load the children sample
  ```
- Line 2: child, name
  ```
  filename <- paste0(data, "children_sample.Rdata")
  ```
- Line 3: name
  ```
  load(filename)
  ```
- Line 4: child
  ```
  df_children <- df
  ```
- Line 8: name
  ```
  filename <- paste0(data, "connections_type.Rdata")
  ```
- Line 9: name
  ```
  load(filename)
  ```
- Line 12: child
  ```
  df_connections <- merge(df_children[,.(id,year)],df_connections, by = "id", all.x = T)
  ```
- Line 16: name
  ```
  filename <- paste0(data, "akm_firm.Rdata")
  ```
- Line 17: name
  ```
  load(filename)
  ```
- Line 24: lat
  ```
  # calculate the average firm premium and number of connections by con type
  ```
- Line 51: name
  ```
  filename <- paste0(data, "connections_firm_rank.Rdata")
  ```
- Line 52: name
  ```
  save(df, file = filename)
  ```
- Line 53: child
  ```
  rm(df,df_connections,df_children,df_connections_firm_rank)
  ```

**/replication-package/labor_networks/code/inter/prepare_connections_firm_rank_multiple2.R**

- Line 1: child
  ```
  # load the children sample
  ```
- Line 2: child, name
  ```
  filename <- paste0(data, "children_sample.Rdata")
  ```
- Line 3: name
  ```
  load(filename)
  ```
- Line 4: child
  ```
  df_children <- df
  ```
- Line 8: name
  ```
  filename <- paste0(data, "connections_type_multiple2.Rdata")
  ```
- Line 9: name
  ```
  load(filename)
  ```
- Line 12: child
  ```
  df_connections <- merge(df_children[,.(id,year)],df_connections, by = "id", all.x = T)
  ```
- Line 16: name
  ```
  filename <- paste0(data, "akm_firm.Rdata")
  ```
- Line 17: name
  ```
  load(filename)
  ```
- Line 24: lat
  ```
  # calculate the average firm premium and number of connections by con type
  ```
- Line 95: name
  ```
  filename <- paste0(data, "connections_firm_rank_multiple2.Rdata")
  ```
- Line 96: name
  ```
  save(df, file = filename)
  ```
- Line 97: child
  ```
  rm(df,df_connections,df_children,df_connections_firm_rank)
  ```

**/replication-package/labor_networks/code/inter/prepare_connections_id_pco.R**

- Line 5: birth
  ```
  first_birth_year <- 1979
  ```
- Line 6: birth
  ```
  last_birth_year <- 1993
  ```
- Line 11: birth
  ```
  for (b in first_birth_year:last_birth_year){
  ```
- Line 16: name
  ```
  filename <- paste0(data, "connections_pco", t,"_",b, ".Rdata")
  ```
- Line 17: name
  ```
  load(filename)
  ```
- Line 36: name
  ```
  filename <- paste0(data, "connections_id_pco.Rdata")
  ```
- Line 37: name
  ```
  save(df, file = filename)
  ```
- Line 38: name
  ```
  rm(df,df1,filename)
  ```

**/replication-package/labor_networks/code/inter/prepare_connections_indirect.R**

- Line 5: birth
  ```
  first_birth_year <- 1979
  ```
- Line 6: birth
  ```
  last_birth_year <- 1993
  ```
- Line 8: lat, name
  ```
  filename <- paste0(data, "population.Rdata")
  ```
- Line 9: name
  ```
  load(filename)
  ```
- Line 10: birth, city, lat, sex
  ```
  df_population = df[,.(id,birth_year,sex,ethnicity)]
  ```
- Line 11: name
  ```
  rm(df,filename)
  ```
- Line 14: name
  ```
  filename <- paste0(data, "employment_history.Rdata")
  ```
- Line 15: name
  ```
  load(filename)
  ```
- Line 17: name
  ```
  rm(df,filename)
  ```
- Line 22: child
  ```
  # load the children sample
  ```
- Line 23: child, name
  ```
  filename <- paste0(data, "children_sample.Rdata")
  ```
- Line 24: name
  ```
  load(filename)
  ```
- Line 25: child
  ```
  df_children_sample1 <- df
  ```
- Line 26: name
  ```
  rm(df,filename)
  ```
- Line 28: child
  ```
  # load children-parents link
  ```
- Line 29: name
  ```
  filename <- paste0(data, "df_parents.Rdata")
  ```
- Line 30: name
  ```
  load(filename)
  ```
- Line 32: name
  ```
  rm(df,filename)
  ```
- Line 36: birth
  ```
  for (b in first_birth_year:last_birth_year){
  ```
- Line 43: birth, child
  ```
  df_children_sample <- df_children_sample1[year == t & birth_year == b]
  ```
- Line 46: child
  ```
  df_connections <- merge(df_children_sample[,.(id)],
  ```
- Line 50: child
  ```
  rm(df_children_sample)
  ```
- Line 57: child
  ```
  # get children-past parent firms link (10 years before the the child is 21)
  ```
- Line 64: child, lname, name
  ```
  colnames(df_connections)[colnames(df_connections) == "id"] <- "id_child"
  ```
- Line 65: lname, name
  ```
  colnames(df_connections)[colnames(df_connections) == "id2"] <- "id_parent"
  ```
- Line 66: lname, name
  ```
  colnames(df_connections)[colnames(df_connections) == "firm_size"] <- "past_firm_size"
  ```
- Line 68: child
  ```
  # get all parent past coworkers linked to children
  ```
- Line 75: lname, name
  ```
  colnames(df_connections)[colnames(df_connections) == "id"] <- "id_pco"
  ```
- Line 76: lname, name
  ```
  colnames(df_connections)[colnames(df_connections) == "id_firm"] <- "id_firm_past"
  ```
- Line 77: lname, name
  ```
  colnames(df_connections)[colnames(df_connections) == "year"] <- "year_past"
  ```
- Line 81: child
  ```
  # collapse by id_child,id_pco, id_parent
  ```
- Line 86: child
  ```
  by = .(id_child,id_pco,id_parent)]
  ```
- Line 88: child
  ```
  # collapse by id_child,id_pco
  ```
- Line 94: child
  ```
  by = .(id_child,id_pco)]
  ```
- Line 96: child
  ```
  # get the connections between children and firms of pco in [t-5,t+5]
  ```
- Line 102: lname, name
  ```
  colnames(df_connections)[colnames(df_connections) == "firm_size"] <- "current_firm_size"
  ```
- Line 103: child, lname, name
  ```
  colnames(df_connections)[colnames(df_connections) == "id_child"] <- "id"
  ```
- Line 127: name
  ```
  filename <- paste0(data, "connections_pco", t,"_",b, ".Rdata")
  ```
- Line 128: name
  ```
  save(df, file = filename)
  ```
- Line 129: name
  ```
  rm(df,df_connections,filename)
  ```
- Line 133: lat
  ```
  rm(employment_history,df_population,df_parents)
  ```
- Line 138: birth
  ```
  for (b in first_birth_year:last_birth_year){
  ```
- Line 143: name
  ```
  filename <- paste0(data, "connections_pco", t,"_",b, ".Rdata")
  ```
- Line 144: name
  ```
  load(filename)
  ```
- Line 166: name
  ```
  filename <- paste0(data, "connections_indirect.Rdata")
  ```
- Line 167: name
  ```
  save(df, file = filename)
  ```
- Line 168: name
  ```
  rm(df,df1,filename)
  ```

**/replication-package/labor_networks/code/inter/prepare_connections_indirect_1927.R**

- Line 5: birth
  ```
  first_birth_year <- 1982
  ```
- Line 6: birth
  ```
  last_birth_year <- 1996
  ```
- Line 8: lat, name
  ```
  filename <- paste0(data, "population.Rdata")
  ```
- Line 9: name
  ```
  load(filename)
  ```
- Line 10: birth, city, lat, sex
  ```
  df_population = df[,.(id,birth_year,sex,ethnicity)]
  ```
- Line 11: name
  ```
  rm(df,filename)
  ```
- Line 14: name
  ```
  filename <- paste0(data, "employment_history_1927.Rdata")
  ```
- Line 15: name
  ```
  load(filename)
  ```
- Line 17: name
  ```
  rm(df,filename)
  ```
- Line 22: child
  ```
  # load the children sample
  ```
- Line 23: child, name
  ```
  filename <- paste0(data, "children_sample_1927.Rdata")
  ```
- Line 24: name
  ```
  load(filename)
  ```
- Line 25: child
  ```
  df_children_sample1 <- df
  ```
- Line 26: name
  ```
  rm(df,filename)
  ```
- Line 28: child
  ```
  # load children-parents link
  ```
- Line 29: name
  ```
  filename <- paste0(data, "df_parents.Rdata")
  ```
- Line 30: name
  ```
  load(filename)
  ```
- Line 32: name
  ```
  rm(df,filename)
  ```
- Line 36: birth
  ```
  for (b in first_birth_year:last_birth_year){
  ```
- Line 43: birth, child
  ```
  df_children_sample <- df_children_sample1[year == t & birth_year == b]
  ```
- Line 46: child
  ```
  df_connections <- merge(df_children_sample[,.(id)],
  ```
- Line 50: child
  ```
  rm(df_children_sample)
  ```
- Line 57: child
  ```
  # get children-past parent firms link (10 years before the the child is 18)
  ```
- Line 64: child, lname, name
  ```
  colnames(df_connections)[colnames(df_connections) == "id"] <- "id_child"
  ```
- Line 65: lname, name
  ```
  colnames(df_connections)[colnames(df_connections) == "id2"] <- "id_parent"
  ```
- Line 66: lname, name
  ```
  colnames(df_connections)[colnames(df_connections) == "firm_size"] <- "past_firm_size"
  ```
- Line 68: child
  ```
  # get all parent past coworkers linked to children
  ```
- Line 75: lname, name
  ```
  colnames(df_connections)[colnames(df_connections) == "id"] <- "id_pco"
  ```
- Line 76: lname, name
  ```
  colnames(df_connections)[colnames(df_connections) == "id_firm"] <- "id_firm_past"
  ```
- Line 77: lname, name
  ```
  colnames(df_connections)[colnames(df_connections) == "year"] <- "year_past"
  ```
- Line 81: child
  ```
  # collapse by id_child,id_pco, id_parent
  ```
- Line 86: child
  ```
  by = .(id_child,id_pco,id_parent)]
  ```
- Line 88: child
  ```
  # collapse by id_child,id_pco
  ```
- Line 94: child
  ```
  by = .(id_child,id_pco)]
  ```
- Line 96: child
  ```
  # get the connections between children and firms of pco in [t-5,t+5]
  ```
- Line 102: lname, name
  ```
  colnames(df_connections)[colnames(df_connections) == "firm_size"] <- "current_firm_size"
  ```
- Line 103: child, lname, name
  ```
  colnames(df_connections)[colnames(df_connections) == "id_child"] <- "id"
  ```
- Line 127: name
  ```
  filename <- paste0(data, "connections_pco_1927_", t,"_",b, ".Rdata")
  ```
- Line 128: name
  ```
  save(df, file = filename)
  ```
- Line 129: name
  ```
  rm(df,df_connections,filename)
  ```
- Line 133: lat
  ```
  rm(employment_history,df_population,df_parents)
  ```
- Line 138: birth
  ```
  for (b in first_birth_year:last_birth_year){
  ```
- Line 143: name
  ```
  filename <- paste0(data, "connections_pco_1927_", t,"_",b, ".Rdata")
  ```
- Line 144: name
  ```
  load(filename)
  ```
- Line 166: name
  ```
  filename <- paste0(data, "connections_indirect_1927.Rdata")
  ```
- Line 167: name
  ```
  save(df, file = filename)
  ```
- Line 168: name
  ```
  rm(df,df1,filename)
  ```

**/replication-package/labor_networks/code/inter/prepare_connections_indirect_25.R**

- Line 5: birth
  ```
  first_birth_year <- 1979
  ```
- Line 6: birth
  ```
  last_birth_year <- 1993
  ```
- Line 8: lat, name
  ```
  filename <- paste0(data, "population.Rdata")
  ```
- Line 9: name
  ```
  load(filename)
  ```
- Line 10: birth, city, lat, sex
  ```
  df_population = df[,.(id,birth_year,sex,ethnicity)]
  ```
- Line 11: name
  ```
  rm(df,filename)
  ```
- Line 14: name
  ```
  filename <- paste0(data, "employment_history.Rdata")
  ```
- Line 15: name
  ```
  load(filename)
  ```
- Line 17: name
  ```
  rm(df,filename)
  ```
- Line 22: child
  ```
  # load the children sample
  ```
- Line 23: child, name
  ```
  filename <- paste0(data, "children_sample_25.Rdata")
  ```
- Line 24: name
  ```
  load(filename)
  ```
- Line 25: child
  ```
  df_children_sample1 <- df
  ```
- Line 26: name
  ```
  rm(df,filename)
  ```
- Line 28: child
  ```
  # load children-parents link
  ```
- Line 29: name
  ```
  filename <- paste0(data, "df_parents.Rdata")
  ```
- Line 30: name
  ```
  load(filename)
  ```
- Line 32: name
  ```
  rm(df,filename)
  ```
- Line 36: birth
  ```
  for (b in first_birth_year:last_birth_year){
  ```
- Line 43: birth, child
  ```
  df_children_sample <- df_children_sample1[year == t & birth_year == b]
  ```
- Line 46: child
  ```
  df_connections <- merge(df_children_sample[,.(id)],
  ```
- Line 50: child
  ```
  rm(df_children_sample)
  ```
- Line 57: child
  ```
  # get children-past parent firms link (10 years before the the child is 21)
  ```
- Line 64: child, lname, name
  ```
  colnames(df_connections)[colnames(df_connections) == "id"] <- "id_child"
  ```
- Line 65: lname, name
  ```
  colnames(df_connections)[colnames(df_connections) == "id2"] <- "id_parent"
  ```
- Line 66: lname, name
  ```
  colnames(df_connections)[colnames(df_connections) == "firm_size"] <- "past_firm_size"
  ```
- Line 68: child
  ```
  # get all parent past coworkers linked to children
  ```
- Line 75: lname, name
  ```
  colnames(df_connections)[colnames(df_connections) == "id"] <- "id_pco"
  ```
- Line 76: lname, name
  ```
  colnames(df_connections)[colnames(df_connections) == "id_firm"] <- "id_firm_past"
  ```
- Line 77: lname, name
  ```
  colnames(df_connections)[colnames(df_connections) == "year"] <- "year_past"
  ```
- Line 81: child
  ```
  # collapse by id_child,id_pco, id_parent
  ```
- Line 86: child
  ```
  by = .(id_child,id_pco,id_parent)]
  ```
- Line 88: child
  ```
  # collapse by id_child,id_pco
  ```
- Line 94: child
  ```
  by = .(id_child,id_pco)]
  ```
- Line 96: child
  ```
  # get the connections between children and firms of pco in [t-5,t+5]
  ```
- Line 102: lname, name
  ```
  colnames(df_connections)[colnames(df_connections) == "firm_size"] <- "current_firm_size"
  ```
- Line 103: child, lname, name
  ```
  colnames(df_connections)[colnames(df_connections) == "id_child"] <- "id"
  ```
- Line 127: name
  ```
  filename <- paste0(data, "connections_pco_25", t,"_",b, ".Rdata")
  ```
- Line 128: name
  ```
  save(df, file = filename)
  ```
- Line 129: name
  ```
  rm(df,df_connections,filename)
  ```
- Line 133: lat
  ```
  rm(employment_history,df_population,df_parents)
  ```
- Line 138: birth
  ```
  for (b in first_birth_year:last_birth_year){
  ```
- Line 143: name
  ```
  filename <- paste0(data, "connections_pco_25", t,"_",b, ".Rdata")
  ```
- Line 144: name
  ```
  load(filename)
  ```
- Line 166: name
  ```
  filename <- paste0(data, "connections_indirect_25.Rdata")
  ```
- Line 167: name
  ```
  save(df, file = filename)
  ```
- Line 168: name
  ```
  rm(df,df1,filename)
  ```

**/replication-package/labor_networks/code/inter/prepare_connections_indirect_grad1.R**

- Line 5: birth
  ```
  first_birth_year <- 1979
  ```
- Line 6: birth
  ```
  last_birth_year <- 1993
  ```
- Line 8: lat, name
  ```
  filename <- paste0(data, "population.Rdata")
  ```
- Line 9: name
  ```
  load(filename)
  ```
- Line 10: birth, city, lat, sex
  ```
  df_population = df[,.(id,birth_year,sex,ethnicity)]
  ```
- Line 11: name
  ```
  rm(df,filename)
  ```
- Line 14: name
  ```
  filename <- paste0(data, "employment_history.Rdata")
  ```
- Line 15: name
  ```
  load(filename)
  ```
- Line 17: name
  ```
  rm(df,filename)
  ```
- Line 22: child
  ```
  # load the children sample
  ```
- Line 23: child, name
  ```
  filename <- paste0(data, "children_sample_grad1.Rdata")
  ```
- Line 24: name
  ```
  load(filename)
  ```
- Line 25: child
  ```
  df_children_sample1 <- df
  ```
- Line 26: name
  ```
  rm(df,filename)
  ```
- Line 28: child
  ```
  # load children-parents link
  ```
- Line 29: name
  ```
  filename <- paste0(data, "df_parents.Rdata")
  ```
- Line 30: name
  ```
  load(filename)
  ```
- Line 32: name
  ```
  rm(df,filename)
  ```
- Line 36: birth
  ```
  for (b in first_birth_year:last_birth_year){
  ```
- Line 43: birth, child
  ```
  df_children_sample <- df_children_sample1[year == t & birth_year == b]
  ```
- Line 46: child
  ```
  df_connections <- merge(df_children_sample[,.(id)],
  ```
- Line 50: child
  ```
  rm(df_children_sample)
  ```
- Line 57: child
  ```
  # get children-past parent firms link (10 years before the the child is 21)
  ```
- Line 64: child, lname, name
  ```
  colnames(df_connections)[colnames(df_connections) == "id"] <- "id_child"
  ```
- Line 65: lname, name
  ```
  colnames(df_connections)[colnames(df_connections) == "id2"] <- "id_parent"
  ```
- Line 66: lname, name
  ```
  colnames(df_connections)[colnames(df_connections) == "firm_size"] <- "past_firm_size"
  ```
- Line 68: child
  ```
  # get all parent past coworkers linked to children
  ```
- Line 75: lname, name
  ```
  colnames(df_connections)[colnames(df_connections) == "id"] <- "id_pco"
  ```
- Line 76: lname, name
  ```
  colnames(df_connections)[colnames(df_connections) == "id_firm"] <- "id_firm_past"
  ```
- Line 77: lname, name
  ```
  colnames(df_connections)[colnames(df_connections) == "year"] <- "year_past"
  ```
- Line 81: child
  ```
  # collapse by id_child,id_pco, id_parent
  ```
- Line 86: child
  ```
  by = .(id_child,id_pco,id_parent)]
  ```
- Line 88: child
  ```
  # collapse by id_child,id_pco
  ```
- Line 94: child
  ```
  by = .(id_child,id_pco)]
  ```
- Line 96: child
  ```
  # get the connections between children and firms of pco in [t-5,t+5]
  ```
- Line 102: lname, name
  ```
  colnames(df_connections)[colnames(df_connections) == "firm_size"] <- "current_firm_size"
  ```
- Line 103: child, lname, name
  ```
  colnames(df_connections)[colnames(df_connections) == "id_child"] <- "id"
  ```
- Line 127: name
  ```
  filename <- paste0(data, "connections_pco_grad1", t,"_",b, ".Rdata")
  ```
- Line 128: name
  ```
  save(df, file = filename)
  ```
- Line 129: name
  ```
  rm(df,df_connections,filename)
  ```
- Line 133: lat
  ```
  rm(employment_history,df_population,df_parents)
  ```
- Line 138: birth
  ```
  for (b in first_birth_year:last_birth_year){
  ```
- Line 143: name
  ```
  filename <- paste0(data, "connections_pco_grad1", t,"_",b, ".Rdata")
  ```
- Line 144: name
  ```
  load(filename)
  ```
- Line 166: name
  ```
  filename <- paste0(data, "connections_indirect_grad1.Rdata")
  ```
- Line 167: name
  ```
  save(df, file = filename)
  ```
- Line 168: name
  ```
  rm(df,df1,filename)
  ```

**/replication-package/labor_networks/code/inter/prepare_connections_indirect_multiple.R**

- Line 5: birth
  ```
  first_birth_year <- 1979
  ```
- Line 6: birth
  ```
  last_birth_year <- 1993
  ```
- Line 12: birth
  ```
  for (b in first_birth_year:last_birth_year){
  ```
- Line 17: name
  ```
  filename <- paste0(data, "connections_pco", t,"_",b, ".Rdata")
  ```
- Line 18: name
  ```
  load(filename)
  ```
- Line 41: name
  ```
  filename <- paste0(data, "connections_indirect_multiple.Rdata")
  ```
- Line 42: name
  ```
  save(df, file = filename)
  ```
- Line 43: name
  ```
  rm(df,df1,filename)
  ```

**/replication-package/labor_networks/code/inter/prepare_connections_indirect_multiple_firm_size.R**

- Line 5: birth
  ```
  first_birth_year <- 1979
  ```
- Line 6: birth
  ```
  last_birth_year <- 1993
  ```
- Line 12: birth
  ```
  for (b in first_birth_year:last_birth_year){
  ```
- Line 17: name
  ```
  filename <- paste0(data, "connections_pco", t,"_",b, ".Rdata")
  ```
- Line 18: name
  ```
  load(filename)
  ```
- Line 43: name
  ```
  filename <- paste0(data, "connections_indirect_multiple_firm_size.Rdata")
  ```
- Line 44: name
  ```
  save(df, file = filename)
  ```
- Line 45: name
  ```
  rm(df,df1,filename)
  ```

**/replication-package/labor_networks/code/inter/prepare_connections_long.R**

- Line 5: birth
  ```
  first_birth_year <- 1979
  ```
- Line 6: birth
  ```
  last_birth_year <- 1993
  ```
- Line 10: name
  ```
  filename <- paste0(data, "employment_history.Rdata")
  ```
- Line 11: name
  ```
  load(filename)
  ```
- Line 17: lname, name
  ```
  colnames(employment_history)[colnames(employment_history) == "salary_rank"] <- "rank_total"
  ```
- Line 21: child
  ```
  # load the children sample
  ```
- Line 22: child, name
  ```
  filename <- paste0(data, "children_sample.Rdata")
  ```
- Line 23: name
  ```
  load(filename)
  ```
- Line 24: child
  ```
  df_children1 <- df
  ```
- Line 27: child
  ```
  # load children-parents link
  ```
- Line 28: name
  ```
  filename <- paste0(data, "df_parents.Rdata")
  ```
- Line 29: name
  ```
  load(filename)
  ```
- Line 33: lat
  ```
  # load the population file
  ```
- Line 34: lat, name
  ```
  filename <- paste0(data, "population.Rdata")
  ```
- Line 35: name
  ```
  load(filename)
  ```
- Line 36: city, lat, sex
  ```
  df_population = df[,.(id,sex,ethnicity)]
  ```
- Line 42: birth
  ```
  for (b in first_birth_year:last_birth_year){
  ```
- Line 50: birth, child
  ```
  df_children <- df_children1[year == t & birth_year == b]
  ```
- Line 53: child
  ```
  df_connections <- merge(df_children[,.(id)],
  ```
- Line 57: child
  ```
  rm(df_children)
  ```
- Line 64: child
  ```
  # get children-past parent firms link (10 years before the the child is 21)
  ```
- Line 71: child, lname, name
  ```
  colnames(df_connections)[colnames(df_connections) == "id"] <- "id_child"
  ```
- Line 72: lname, name
  ```
  colnames(df_connections)[colnames(df_connections) == "id2"] <- "id_parent"
  ```
- Line 73: lname, name
  ```
  colnames(df_connections)[colnames(df_connections) == "rank_firm"] <- "rank_firm_parent"
  ```
- Line 74: lname, name
  ```
  colnames(df_connections)[colnames(df_connections) == "rank_total"] <- "rank_total_parent"
  ```
- Line 75: lname, name
  ```
  colnames(df_connections)[colnames(df_connections) == "firm_size"] <- "firm_size_past"
  ```
- Line 77: child
  ```
  # get all parent past coworkers linked to children
  ```
- Line 84: lname, name
  ```
  colnames(df_connections)[colnames(df_connections) == "id"] <- "id_pco"
  ```
- Line 85: lname, name
  ```
  colnames(df_connections)[colnames(df_connections) == "rank_firm"] <- "rank_firm_pco_past"
  ```
- Line 86: lname, name
  ```
  colnames(df_connections)[colnames(df_connections) == "rank_total"] <- "rank_total_pco_past"
  ```
- Line 87: lname, name
  ```
  colnames(df_connections)[colnames(df_connections) == "id_firm"] <- "id_firm_past"
  ```
- Line 88: lname, name
  ```
  colnames(df_connections)[colnames(df_connections) == "year"] <- "year_past"
  ```
- Line 92: child
  ```
  # collapse by id_child,id_pco, id_parent
  ```
- Line 101: child
  ```
  by = .(id_child,id_pco,id_parent)]
  ```
- Line 104: child
  ```
  # get the connections between children and firms by year
  ```
- Line 111: lname, name
  ```
  colnames(df_connections)[colnames(df_connections) == "firm_size"] <- "firm_size_current"
  ```
- Line 112: lname, name
  ```
  colnames(df_connections)[colnames(df_connections) == "rank_firm"] <- "rank_firm_pco_current"
  ```
- Line 113: lname, name
  ```
  colnames(df_connections)[colnames(df_connections) == "rank_total"] <- "rank_total_pco_current"
  ```
- Line 114: child, lname, name
  ```
  colnames(df_connections)[colnames(df_connections) == "id_child"] <- "id"
  ```
- Line 140: lat
  ```
  df_connections <- merge(df_connections,df_population, by = "id", all.x = TRUE)
  ```
- Line 141: child, lname, name, sex
  ```
  colnames(df_connections)[colnames(df_connections) == "sex"] <- "sex_child"
  ```
- Line 142: child, city, lname, name
  ```
  colnames(df_connections)[colnames(df_connections) == "ethnicity"] <- "ethnicity_child"
  ```
- Line 144: child
  ```
  df_connections <- merge(df_connections,df_children1[,.(id,education = 1 *(education >0))], by = "id"
  ```
- Line 145: child, lname, name
  ```
  colnames(df_connections)[colnames(df_connections) == "education"] <- "education_child"
  ```
- Line 148: lat
  ```
  df_connections <- merge(df_connections,df_population, by.x = "id_parent", by.y = "id", all.x = TRUE)
  ```
- Line 149: lname, name, sex
  ```
  colnames(df_connections)[colnames(df_connections) == "sex"] <- "sex_parent"
  ```
- Line 150: city, lname, name
  ```
  colnames(df_connections)[colnames(df_connections) == "ethnicity"] <- "ethnicity_parent"
  ```
- Line 152: lat
  ```
  df_connections <- merge(df_connections,df_population, by.x = "id_pco", by.y = "id", all.x = TRUE)
  ```
- Line 153: lname, name, sex
  ```
  colnames(df_connections)[colnames(df_connections) == "sex"] <- "sex_pco"
  ```
- Line 154: city, lname, name
  ```
  colnames(df_connections)[colnames(df_connections) == "ethnicity"] <- "ethnicity_pco"
  ```
- Line 156: child, city, sex
  ```
  # create vars for: same_sex, same_ethnicity, rank_diff for child-parent, parent-pco, child_pco
  ```
- Line 157: child, sex
  ```
  df_connections <- df_connections[,same_sex_child_parent := 1 * (sex_child == sex_parent)]
  ```
- Line 158: child, sex
  ```
  df_connections <- df_connections[,same_sex_child_pco := 1 * (sex_child == sex_pco)]
  ```
- Line 159: sex
  ```
  df_connections <- df_connections[,same_sex_parent_pco := 1 * (sex_parent == sex_pco)]
  ```
- Line 161: child, city
  ```
  df_connections <- df_connections[,same_ethnicity_child_pco := 1 * (ethnicity_child == ethnicity_pco)
  ```
- Line 177: child, sex
  ```
  sex_child = mean(sex_child ),
  ```
- Line 178: sex
  ```
  sex_parent = mean(sex_parent ),
  ```
- Line 179: sex
  ```
  sex_pco = mean(sex_pco ),
  ```
- Line 180: child, city
  ```
  ethnicity_child = mean(ethnicity_child ),
  ```
- Line 181: city
  ```
  ethnicity_pco = mean(ethnicity_pco ),
  ```
- Line 182: child
  ```
  education_child = mean(education_child ),
  ```
- Line 183: child, sex
  ```
  same_sex_child_parent = mean(same_sex_child_parent ),
  ```
- Line 184: child, sex
  ```
  same_sex_child_pco = mean(same_sex_child_pco ),
  ```
- Line 185: child, city
  ```
  same_ethnicity_child_pco = mean(same_ethnicity_child_pco ),
  ```
- Line 206: lon, name
  ```
  filename <- paste0(data, "connections_long_",t,".Rdata")
  ```
- Line 207: name
  ```
  save(df, file = filename)
  ```
- Line 212: child, lat
  ```
  rm(df_population,df_children1,df_parents,employment_history)
  ```

**/replication-package/labor_networks/code/inter/prepare_connections_phantom_past_employment.R**

- Line 5: birth
  ```
  first_birth_year <- 1979
  ```
- Line 6: birth
  ```
  last_birth_year <- 1993
  ```
- Line 10: name
  ```
  filename <- paste0(data, "employment_history.Rdata")
  ```
- Line 11: name
  ```
  load(filename)
  ```
- Line 13: name
  ```
  rm(df,filename)
  ```
- Line 15: child
  ```
  # load the children sample
  ```
- Line 16: child, name
  ```
  filename <- paste0(data, "children_sample_employment.Rdata")
  ```
- Line 17: name
  ```
  load(filename)
  ```
- Line 18: child
  ```
  df_children_sample1 <- df
  ```
- Line 19: name
  ```
  rm(df,filename)
  ```
- Line 21: child
  ```
  # load children-parents link
  ```
- Line 22: name
  ```
  filename <- paste0(data, "df_parents.Rdata")
  ```
- Line 23: name
  ```
  load(filename)
  ```
- Line 25: name
  ```
  rm(df,filename)
  ```
- Line 27: name
  ```
  filename <- paste0(data, "akm_firm.Rdata")
  ```
- Line 28: name
  ```
  load(filename)
  ```
- Line 30: name
  ```
  rm(df,filename)
  ```
- Line 37: birth
  ```
  for (b in first_birth_year:last_birth_year){
  ```
- Line 44: birth, child
  ```
  df_children_sample <- df_children_sample1[birth_year == b]
  ```
- Line 47: child
  ```
  df_connections <- merge(df_children_sample[,.(id)],
  ```
- Line 51: child
  ```
  rm(df_children_sample)
  ```
- Line 58: child
  ```
  # get children-past parent firms link (10 years before the the child is 21)
  ```
- Line 67: child, lname, name
  ```
  colnames(df_connections)[colnames(df_connections) == "id"] <- "id_child"
  ```
- Line 68: lname, name
  ```
  colnames(df_connections)[colnames(df_connections) == "id2"] <- "id_parent"
  ```
- Line 71: child
  ```
  # get all workers in parents firms (not nesaserily same time) linked to children
  ```
- Line 79: child
  ```
  allow.cartesian=TRUE)[,.(id_child,id_pco = id, con_past = 1*(kk==0))]
  ```
- Line 88: child
  ```
  by = .(id_child,id_pco)]        }
  ```
- Line 110: child, lname, name
  ```
  colnames(df_connections)[colnames(df_connections) == "id_child"] <- "id"
  ```
- Line 137: name
  ```
  filename <- paste0(data, "connections_indirect_employment_pahntom_past.Rdata")
  ```
- Line 138: name
  ```
  save(df, file = filename)
  ```
- Line 139: name
  ```
  rm(df,df1,filename)
  ```
- Line 140: child
  ```
  rm(df_akm,df_children_sample1,df_connections,df_parents,employment_history)
  ```

**/replication-package/labor_networks/code/inter/prepare_connections_type.R**

- Line 2: name
  ```
  filename <- paste0(data, "connections_indirect.Rdata")
  ```
- Line 3: name
  ```
  load(filename)
  ```
- Line 5: name
  ```
  rm(df,filename)
  ```
- Line 8: name
  ```
  filename <- paste0(data, "parents_firms.Rdata")
  ```
- Line 9: name
  ```
  load(filename)
  ```
- Line 12: name
  ```
  rm(df,filename)
  ```
- Line 28: name
  ```
  filename <- paste0(data, "connections_type.Rdata")
  ```
- Line 29: name
  ```
  save(df, file = filename)
  ```
- Line 48: name
  ```
  filename <- paste0(data, "connections_type_rob1.Rdata")
  ```
- Line 49: name
  ```
  save(df, file = filename)
  ```
- Line 65: name
  ```
  filename <- paste0(data, "connections_type_rob2.Rdata")
  ```
- Line 66: name
  ```
  save(df, file = filename)
  ```
- Line 67: name
  ```
  rm(df,df_connections,filename,connections_indirect,parents_firms)
  ```

**/replication-package/labor_networks/code/inter/prepare_connections_type_1927.R**

- Line 2: name
  ```
  filename <- paste0(data, "connections_indirect_1927.Rdata")
  ```
- Line 3: name
  ```
  load(filename)
  ```
- Line 5: name
  ```
  rm(df,filename)
  ```
- Line 8: name
  ```
  filename <- paste0(data, "parents_firms_1927.Rdata")
  ```
- Line 9: name
  ```
  load(filename)
  ```
- Line 12: name
  ```
  rm(df,filename)
  ```
- Line 28: name
  ```
  filename <- paste0(data, "connections_type_1927.Rdata")
  ```
- Line 29: name
  ```
  save(df, file = filename)
  ```

**/replication-package/labor_networks/code/inter/prepare_connections_type_25.R**

- Line 2: name
  ```
  filename <- paste0(data, "connections_indirect_25.Rdata")
  ```
- Line 3: name
  ```
  load(filename)
  ```
- Line 5: name
  ```
  rm(df,filename)
  ```
- Line 8: name
  ```
  filename <- paste0(data, "parents_firms_25.Rdata")
  ```
- Line 9: name
  ```
  load(filename)
  ```
- Line 12: name
  ```
  rm(df,filename)
  ```
- Line 28: name
  ```
  filename <- paste0(data, "connections_type_25.Rdata")
  ```
- Line 29: name
  ```
  save(df, file = filename)
  ```

**/replication-package/labor_networks/code/inter/prepare_connections_type_grad1.R**

- Line 2: name
  ```
  filename <- paste0(data, "connections_indirect_grad1.Rdata")
  ```
- Line 3: name
  ```
  load(filename)
  ```
- Line 5: name
  ```
  rm(df,filename)
  ```
- Line 8: name
  ```
  filename <- paste0(data, "parents_firms_grad1.Rdata")
  ```
- Line 9: name
  ```
  load(filename)
  ```
- Line 12: name
  ```
  rm(df,filename)
  ```
- Line 28: name
  ```
  filename <- paste0(data, "connections_type_grad1.Rdata")
  ```
- Line 29: name
  ```
  save(df, file = filename)
  ```

**/replication-package/labor_networks/code/inter/prepare_connections_type_multiple2.R**

- Line 2: name
  ```
  filename <- paste0(data, "connections_indirect_multiple.Rdata")
  ```
- Line 3: name
  ```
  load(filename)
  ```
- Line 5: name
  ```
  rm(df,filename)
  ```
- Line 8: name
  ```
  filename <- paste0(data, "parents_firms.Rdata")
  ```
- Line 9: name
  ```
  load(filename)
  ```
- Line 12: name
  ```
  rm(df,filename)
  ```
- Line 42: name
  ```
  filename <- paste0(data, "connections_type_multiple2.Rdata")
  ```
- Line 43: name
  ```
  save(df, file = filename)
  ```

**/replication-package/labor_networks/code/inter/prepare_connections_type_multiple2_firm_size.R**

- Line 2: name
  ```
  filename <- paste0(data, "connections_indirect_multiple_firm_size.Rdata")
  ```
- Line 3: name
  ```
  load(filename)
  ```
- Line 5: name
  ```
  rm(df,filename)
  ```
- Line 8: name
  ```
  filename <- paste0(data, "parents_firms_firm_size.Rdata")
  ```
- Line 9: name
  ```
  load(filename)
  ```
- Line 12: name
  ```
  rm(df,filename)
  ```
- Line 45: name
  ```
  filename <- paste0(data, "connections_type_multiple2_firm_size.Rdata")
  ```
- Line 46: name
  ```
  save(df, file = filename)
  ```

**/replication-package/labor_networks/code/inter/prepare_duration_first_job.R**

- Line 1: child
  ```
  # load the children sample
  ```
- Line 2: child, name
  ```
  filename <- paste0(data, "children_sample.Rdata")
  ```
- Line 3: name
  ```
  load(filename)
  ```
- Line 4: child
  ```
  df_children <- df
  ```
- Line 13: name
  ```
  filename <- paste0(data, "wages_",t,".Rdata")
  ```
- Line 14: name
  ```
  load(filename)
  ```
- Line 18: child
  ```
  # get firm id and wages of all future jobs of the child
  ```
- Line 19: child
  ```
  df_wages <- merge(df_children[,.(id,id_firm_first_job = id_firm,year_first_job = year)],
  ```
- Line 64: child
  ```
  df_children = merge(df_children[,.(id)],df_employment_two_years, by = c("id"), all.x = TRUE)
  ```
- Line 65: child
  ```
  df_children = merge(df_children,df_employment_first_firm, by = c("id"))
  ```
- Line 68: child
  ```
  df <- df_children
  ```
- Line 69: name
  ```
  filename <- paste0(data, "duration_first_job.Rdata")
  ```
- Line 70: name
  ```
  save(df, file = filename)
  ```
- Line 71: child
  ```
  rm(df,df_children,df_employment)
  ```

**/replication-package/labor_networks/code/inter/prepare_education.R**

- Line 8: name
  ```
  filename <- paste0(raw, "limodim.dta")
  ```
- Line 9: name
  ```
  df <- read_dta(filename)
  ```
- Line 12: name
  ```
  # rename the variables
  ```
- Line 13: lname, name
  ```
  colnames(df)[colnames(df) == "tz"] <- "id"
  ```
- Line 14: lname, name
  ```
  colnames(df)[colnames(df) == "mtar_lim"] <- "start_date"
  ```
- Line 15: lname, name
  ```
  colnames(df)[colnames(df) == "adtar_lim"] <- "end_date"
  ```
- Line 16: lname, name
  ```
  colnames(df)[colnames(df) == "kod_mosad"] <- "institution_id"
  ```
- Line 18: school
  ```
  # drop if education institution is a religious school, high-school, art and unknown
  ```
- Line 19: name
  ```
  filename <- paste0(excel, "educational_institutions_classification.xlsx")
  ```
- Line 20: name
  ```
  institutions <- read_xlsx(filename)
  ```
- Line 30: lat, name
  ```
  filename <- paste0(data, "population.Rdata")
  ```
- Line 31: name
  ```
  load(filename)
  ```
- Line 32: birth
  ```
  birth_year <- df[,.(id,birth_year)]
  ```
- Line 35: birth
  ```
  df_education <- merge(df_education,birth_year, by = "id")
  ```
- Line 36: birth
  ```
  df_education <- df_education[year(end_date) - birth_year <= 29 ]
  ```
- Line 37: birth
  ```
  df_education[,birth_year := NULL]
  ```
- Line 39: lat
  ```
  # calculate total years of education, first start date and last end date by id
  ```
- Line 53: name
  ```
  filename <- paste0(data, "education.Rdata")
  ```
- Line 54: name
  ```
  save(df, file = filename)
  ```

**/replication-package/labor_networks/code/inter/prepare_employment_history.R**

- Line 6: name
  ```
  filename <- paste0(data, "wages_",t,".Rdata")
  ```
- Line 7: name
  ```
  load(filename)
  ```
- Line 22: name
  ```
  filename <- paste0(data, "employment_history.Rdata")
  ```
- Line 23: name
  ```
  save(df, file = filename)
  ```

**/replication-package/labor_networks/code/inter/prepare_employment_history_1927.R**

- Line 6: name
  ```
  filename <- paste0(data, "wages_1927_",t,".Rdata")
  ```
- Line 7: name
  ```
  load(filename)
  ```
- Line 22: name
  ```
  filename <- paste0(data, "employment_history_1927.Rdata")
  ```
- Line 23: name
  ```
  save(df, file = filename)
  ```

**/replication-package/labor_networks/code/inter/prepare_firm_duration.R**

- Line 1: name
  ```
  filename <- paste0(data, "employment_history.Rdata")
  ```
- Line 2: name
  ```
  load(filename)
  ```
- Line 6: child, name
  ```
  filename <- paste0(data, "children_sample.Rdata")
  ```
- Line 7: name
  ```
  load(filename)
  ```
- Line 8: child
  ```
  children_sample = df
  ```
- Line 13: child
  ```
  employment_history = merge(employment_history,children_sample[,.(id,temp=1)], by = "id", all.x = T)
  ```
- Line 16: lat
  ```
  # calculate the mean and sd duration in the years [t-4,t] by firm (but combine all years together)
  ```
- Line 39: name
  ```
  filename <- paste0(data, "firms_duration_bins.Rdata")
  ```
- Line 40: name
  ```
  save(df, file = filename)
  ```
- Line 41: child
  ```
  rm(df,firms,employment_history,worker_firm,children_sample)
  ```

**/replication-package/labor_networks/code/inter/prepare_firm_location.R**

- Line 6: name
  ```
  filename <- paste0(data, "employment_history.Rdata")
  ```
- Line 7: name
  ```
  load(filename)
  ```
- Line 13: child
  ```
  # load the children sample
  ```
- Line 14: child, name
  ```
  filename <- paste0(data, "children_sample.Rdata")
  ```
- Line 15: name
  ```
  load(filename)
  ```
- Line 16: child
  ```
  df_children <- df[,.(id,year,id_firm)]
  ```
- Line 17: child
  ```
  df_children[,child := 1]
  ```
- Line 20: child, loc, location
  ```
  # keep only observations that not in the children sample (so the location of children will not impac
  ```
- Line 21: child
  ```
  employment_history <- merge(employment_history,df_children[,.(id,year,child)],by = c("id","year"),al
  ```
- Line 22: child
  ```
  employment_history <- employment_history[is.na(child)]
  ```
- Line 23: child
  ```
  employment_history[,child := NULL]
  ```
- Line 24: child
  ```
  df_children[,child := NULL]
  ```
- Line 26: loc, location
  ```
  # merge with location in each year (information for 2000-2015)
  ```
- Line 30: loc, location, name
  ```
  filename <- paste0(data, "location_",t,".Rdata")
  ```
- Line 31: name
  ```
  load(filename)
  ```
- Line 32: loc, location
  ```
  df_location <- df[,.(id,X,Y)]
  ```
- Line 34: loc, location
  ```
  df_location[,year := t]
  ```
- Line 36: loc, location
  ```
  employment_history <- merge(employment_history,df_location,by = c("id","year"), all.x = TRUE)
  ```
- Line 40: loc, location
  ```
  rm(df_location)
  ```
- Line 42: lname, name
  ```
  colnames(employment_history)[colnames(employment_history) == "X_temp"] <- "X"
  ```
- Line 43: lname, name
  ```
  colnames(employment_history)[colnames(employment_history) == "Y_temp"] <- "Y"
  ```
- Line 46: loc, location
  ```
  # get the size and the median location of the people work in each year
  ```
- Line 52: lat, loc, location
  ```
  # for each firm, keep the location based on the latest year
  ```
- Line 62: loc, location, name
  ```
  filename <- paste0(data, "firm_location.Rdata")
  ```
- Line 63: name
  ```
  save(df, file = filename)
  ```
- Line 64: child
  ```
  rm(df,df_firms,df_firms_all,df_children,employment_history)
  ```

**/replication-package/labor_networks/code/inter/prepare_firm_year.R**

- Line 1: child
  ```
  # load the children sample
  ```
- Line 2: child, name
  ```
  filename <- paste0(data, "children_sample.Rdata")
  ```
- Line 3: name
  ```
  load(filename)
  ```
- Line 4: child
  ```
  df_children <- df[,.(id)]
  ```
- Line 5: child
  ```
  df_children[,child := 1]
  ```
- Line 10: child
  ```
  # keep only observations that are not in the children sample
  ```
- Line 11: name
  ```
  filename <- paste0(data, "employment_history.Rdata")
  ```
- Line 12: name
  ```
  load(filename)
  ```
- Line 13: child
  ```
  df_wages <- merge(df,df_children,by = "id", all.x = T)
  ```
- Line 15: child
  ```
  df_wages <- df_wages[is.na(child)]
  ```
- Line 16: child
  ```
  df_wages[,child := NULL]
  ```
- Line 25: name
  ```
  filename <- paste0(data, "akm_firm.Rdata")
  ```
- Line 26: name
  ```
  load(filename)
  ```
- Line 32: name
  ```
  filename <- paste0(data, "firm_year.Rdata")
  ```
- Line 33: name
  ```
  save(df, file = filename)
  ```
- Line 34: child
  ```
  rm(df,df_firms,df_wages,df_children)
  ```

**/replication-package/labor_networks/code/inter/prepare_industry.R**

- Line 9: name
  ```
  filename <- paste0(raw, "sachar/sachar_", t, ".dta")
  ```
- Line 10: name
  ```
  df <- read_dta(filename)
  ```
- Line 12: name
  ```
  # rename the variables
  ```
- Line 13: lname, name
  ```
  colnames(df)[colnames(df) == "tz"] <- "id"
  ```
- Line 14: lname, name
  ```
  colnames(df)[colnames(df) == "s_total"] <- "yearly_salary"
  ```
- Line 15: lname, name
  ```
  colnames(df)[colnames(df) == "id_maavid"] <- "id_firm"
  ```
- Line 16: lname, name
  ```
  colnames(df)[colnames(df) == "anaf"] <- "industry"
  ```
- Line 17: lname, name
  ```
  colnames(df)[colnames(df) == "sah_hs01"] <- "month01"
  ```
- Line 18: lname, name
  ```
  colnames(df)[colnames(df) == "sah_hs02"] <- "month02"
  ```
- Line 19: lname, name
  ```
  colnames(df)[colnames(df) == "sah_hs03"] <- "month03"
  ```
- Line 20: lname, name
  ```
  colnames(df)[colnames(df) == "sah_hs04"] <- "month04"
  ```
- Line 21: lname, name
  ```
  colnames(df)[colnames(df) == "sah_hs05"] <- "month05"
  ```
- Line 22: lname, name
  ```
  colnames(df)[colnames(df) == "sah_hs06"] <- "month06"
  ```
- Line 23: lname, name
  ```
  colnames(df)[colnames(df) == "sah_hs07"] <- "month07"
  ```
- Line 24: lname, name
  ```
  colnames(df)[colnames(df) == "sah_hs08"] <- "month08"
  ```
- Line 25: lname, name
  ```
  colnames(df)[colnames(df) == "sah_hs09"] <- "month09"
  ```
- Line 26: lname, name
  ```
  colnames(df)[colnames(df) == "sah_hs10"] <- "month10"
  ```
- Line 27: lname, name
  ```
  colnames(df)[colnames(df) == "sah_hs11"] <- "month11"
  ```
- Line 28: lname, name
  ```
  colnames(df)[colnames(df) == "sah_hs12"] <- "month12"
  ```
- Line 74: lat
  ```
  # by firm: keep the latest industry
  ```
- Line 81: name
  ```
  filename <- paste0(data, "firm_industry.Rdata")
  ```
- Line 82: name
  ```
  save(df, file = filename)
  ```

**/replication-package/labor_networks/code/inter/prepare_location.R**

- Line 7: name
  ```
  filename <- paste0(excel, "setl_mid_point.xlsx")
  ```
- Line 8: name
  ```
  setl_mid_point <- read_xlsx(filename)
  ```
- Line 10: name
  ```
  setl_mid_point <- setl_mid_point[,.(X,Y,setl_name_ltn,setl_code)]
  ```
- Line 12: name
  ```
  filename <- paste0(raw, "ktovat/ktovet_", k, ".dta")
  ```
- Line 13: name
  ```
  df <- read_dta(filename)
  ```
- Line 16: lname, name
  ```
  colnames(df)[colnames(df) == "tz"] <- "id"
  ```
- Line 18: district, lname, name
  ```
  colnames(df)[colnames(df)== temp] <- "district"
  ```
- Line 20: district, lname, name
  ```
  colnames(df)[colnames(df)== temp] <- "subdistrict"
  ```
- Line 22: city, lname, name
  ```
  colnames(df)[colnames(df)== temp] <- "city"
  ```
- Line 24: lname, name
  ```
  colnames(df)[colnames(df)== temp] <- "neighborhood"
  ```
- Line 26: city
  ```
  df <- merge(df,setl_mid_point,by.x = "city", by.y = "setl_code", all.x = TRUE)
  ```
- Line 28: loc, location, name
  ```
  filename <- paste0(data, "location_", k, ".Rdata")
  ```
- Line 29: name
  ```
  save(df, file = filename)
  ```

**/replication-package/labor_networks/code/inter/prepare_parents.R**

- Line 2: lat, name
  ```
  filename <- paste0(data, "population.Rdata")
  ```
- Line 3: name
  ```
  load(filename)
  ```
- Line 4: father, mother
  ```
  df_parents <- df[,.(id,id_father,id_mother)]
  ```
- Line 8: father
  ```
  df_fathers  <- df_parents[,.(id1 = id , id2 = id_father )]
  ```
- Line 9: father
  ```
  df_fathers[, type := 0]
  ```
- Line 10: mother
  ```
  df_mothers  <- df_parents[,.(id1 = id , id2 = id_mother )]
  ```
- Line 11: mother
  ```
  df_mothers[, type := 1]
  ```
- Line 13: father, mother
  ```
  df_parents <- rbind(df_fathers,df_mothers)
  ```
- Line 14: father, mother
  ```
  rm(df_fathers,df_mothers)
  ```
- Line 20: name
  ```
  filename <- paste0(data, "df_parents.Rdata")
  ```
- Line 21: name
  ```
  save(df, file = filename)
  ```

**/replication-package/labor_networks/code/inter/prepare_parents_firms.R**

- Line 2: name
  ```
  filename <- paste0(data, "employment_history.Rdata")
  ```
- Line 3: name
  ```
  load(filename)
  ```
- Line 6: child
  ```
  # load the children sample
  ```
- Line 7: child, name
  ```
  filename <- paste0(data, "children_sample1.Rdata")
  ```
- Line 8: name
  ```
  load(filename)
  ```
- Line 9: child
  ```
  df_children_sample1 <- df
  ```
- Line 11: child
  ```
  # load children-parents link
  ```
- Line 12: name
  ```
  filename <- paste0(data, "df_parents.Rdata")
  ```
- Line 13: name
  ```
  load(filename)
  ```
- Line 20: child
  ```
  # subset the children whose first job is in year t
  ```
- Line 21: child
  ```
  df_children_sample <- df_children_sample1[year == t]
  ```
- Line 24: birth, child
  ```
  df_connections <- merge(df_children_sample[,.(id,birth_year)],
  ```
- Line 27: child
  ```
  rm(df_children_sample)
  ```
- Line 29: child
  ```
  # get children-past parent firms link (10 years before the child is 21)
  ```
- Line 32: birth
  ```
  by.y = "id", allow.cartesian=TRUE)[year-birth_year <= 21
  ```
- Line 33: birth
  ```
  & year-birth_year >= 12]
  ```
- Line 49: child
  ```
  rm(employment_history,df_children_sample1,df_parents)
  ```
- Line 52: lon, name
  ```
  filename <- paste0(data, "parents_firms_long.Rdata")
  ```
- Line 53: name
  ```
  save(df, file = filename)
  ```
- Line 57: name
  ```
  filename <- paste0(data, "parents_firms.Rdata")
  ```
- Line 58: name
  ```
  save(df, file = filename)
  ```

**/replication-package/labor_networks/code/inter/prepare_parents_firms_1927.R**

- Line 3: name
  ```
  filename <- paste0(data, "employment_history_1927.Rdata")
  ```
- Line 4: name
  ```
  load(filename)
  ```
- Line 6: name
  ```
  rm(df,filename)
  ```
- Line 8: child
  ```
  # load the temporary children sample
  ```
- Line 9: child, name
  ```
  filename <- paste0(data, "children_sample1_1927.Rdata")
  ```
- Line 10: name
  ```
  load(filename)
  ```
- Line 11: child
  ```
  df_children_sample <- df
  ```
- Line 12: name
  ```
  rm(df,filename)
  ```
- Line 14: child
  ```
  # load children-parents link
  ```
- Line 15: name
  ```
  filename <- paste0(data, "df_parents.Rdata")
  ```
- Line 16: name
  ```
  load(filename)
  ```
- Line 18: name
  ```
  rm(df,filename)
  ```
- Line 23: birth, child
  ```
  df_connections <- merge(df_children_sample[,.(id,birth_year)],
  ```
- Line 26: child
  ```
  rm(df_children_sample)
  ```
- Line 28: child
  ```
  # get children-past parent firms link (10 years before the child is 18)
  ```
- Line 31: birth
  ```
  by.y = "id", allow.cartesian=TRUE)[year-birth_year <= 18
  ```
- Line 32: birth
  ```
  & year-birth_year >= 9]
  ```
- Line 45: lon, name
  ```
  filename <- paste0(data, "parents_firms_long_1927.Rdata")
  ```
- Line 46: name
  ```
  save(df, file = filename)
  ```
- Line 47: name
  ```
  rm(df_connections,filename)
  ```
- Line 52: name
  ```
  filename <- paste0(data, "parents_firms_1927.Rdata")
  ```
- Line 53: name
  ```
  save(df, file = filename)
  ```
- Line 54: name
  ```
  rm(df,filename)
  ```

**/replication-package/labor_networks/code/inter/prepare_parents_firms_25.R**

- Line 3: name
  ```
  filename <- paste0(data, "employment_history.Rdata")
  ```
- Line 4: name
  ```
  load(filename)
  ```
- Line 6: name
  ```
  rm(df,filename)
  ```
- Line 8: child
  ```
  # load the temporary children sample
  ```
- Line 9: child, name
  ```
  filename <- paste0(data, "children_sample1_25.Rdata")
  ```
- Line 10: name
  ```
  load(filename)
  ```
- Line 11: child
  ```
  df_children_sample <- df
  ```
- Line 12: name
  ```
  rm(df,filename)
  ```
- Line 14: child
  ```
  # load children-parents link
  ```
- Line 15: name
  ```
  filename <- paste0(data, "df_parents.Rdata")
  ```
- Line 16: name
  ```
  load(filename)
  ```
- Line 18: name
  ```
  rm(df,filename)
  ```
- Line 23: birth, child
  ```
  df_connections <- merge(df_children_sample[,.(id,birth_year)],
  ```
- Line 26: child
  ```
  rm(df_children_sample)
  ```
- Line 28: child
  ```
  # get children-past parent firms link (10 years before the child is 21)
  ```
- Line 31: birth
  ```
  by.y = "id", allow.cartesian=TRUE)[year-birth_year <= 21
  ```
- Line 32: birth
  ```
  & year-birth_year >= 12]
  ```
- Line 45: lon, name
  ```
  filename <- paste0(data, "parents_firms_long_25.Rdata")
  ```
- Line 46: name
  ```
  save(df, file = filename)
  ```
- Line 47: name
  ```
  rm(df_connections,filename)
  ```
- Line 52: name
  ```
  filename <- paste0(data, "parents_firms_25.Rdata")
  ```
- Line 53: name
  ```
  save(df, file = filename)
  ```
- Line 54: name
  ```
  rm(df,filename)
  ```

**/replication-package/labor_networks/code/inter/prepare_parents_firms_employment.R**

- Line 3: name
  ```
  filename <- paste0(data, "employment_history.Rdata")
  ```
- Line 4: name
  ```
  load(filename)
  ```
- Line 6: name
  ```
  rm(df,filename)
  ```
- Line 8: child
  ```
  # load the temporary children sample
  ```
- Line 9: child, name
  ```
  filename <- paste0(data, "children_sample1_employment.Rdata")
  ```
- Line 10: name
  ```
  load(filename)
  ```
- Line 11: child
  ```
  df_children_sample <- df
  ```
- Line 12: name
  ```
  rm(df,filename)
  ```
- Line 14: child
  ```
  # load children-parents link
  ```
- Line 15: name
  ```
  filename <- paste0(data, "df_parents.Rdata")
  ```
- Line 16: name
  ```
  load(filename)
  ```
- Line 18: name
  ```
  rm(df,filename)
  ```
- Line 23: birth, child
  ```
  df_connections <- merge(df_children_sample[,.(id,birth_year)],
  ```
- Line 26: child
  ```
  rm(df_children_sample)
  ```
- Line 28: child
  ```
  # get children-past parent firms link (10 years before the child is 21)
  ```
- Line 31: birth
  ```
  by.y = "id", allow.cartesian=TRUE)[year-birth_year <= 21
  ```
- Line 32: birth
  ```
  & year-birth_year >= 12]
  ```
- Line 45: lon, name
  ```
  filename <- paste0(data, "parents_firms_long_employment.Rdata")
  ```
- Line 46: name
  ```
  save(df, file = filename)
  ```
- Line 47: name
  ```
  rm(df_connections,filename)
  ```
- Line 52: name
  ```
  filename <- paste0(data, "parents_firms_employment.Rdata")
  ```
- Line 53: name
  ```
  save(df, file = filename)
  ```
- Line 54: name
  ```
  rm(df,filename)
  ```

**/replication-package/labor_networks/code/inter/prepare_parents_firms_firm_size.R**

- Line 2: name
  ```
  filename <- paste0(data, "employment_history.Rdata")
  ```
- Line 3: name
  ```
  load(filename)
  ```
- Line 5: name
  ```
  rm(df,filename)
  ```
- Line 11: child
  ```
  # load the children sample
  ```
- Line 12: child, name
  ```
  filename <- paste0(data, "children_sample.Rdata")
  ```
- Line 13: name
  ```
  load(filename)
  ```
- Line 14: birth, child
  ```
  df_children_sample <- df[.(id,birth_year,year)]
  ```
- Line 15: name
  ```
  rm(df,filename)
  ```
- Line 17: child
  ```
  # load children-parents link
  ```
- Line 18: name
  ```
  filename <- paste0(data, "df_parents.Rdata")
  ```
- Line 19: name
  ```
  load(filename)
  ```
- Line 21: name
  ```
  rm(df,filename)
  ```
- Line 26: birth, child
  ```
  df_connections <- merge(df_children_sample[,.(id,birth_year)],
  ```
- Line 30: child
  ```
  # get children-past parent firms link (10 years before the child is 21)
  ```
- Line 33: birth
  ```
  by.y = "id", allow.cartesian=TRUE)[year-birth_year <= 21
  ```
- Line 34: birth
  ```
  & year-birth_year >= 12]
  ```
- Line 43: child
  ```
  df_connections = merge(df_connections,df_children_sample[,.(id,year)], by = "id")
  ```
- Line 51: child
  ```
  rm(employment_history,df_parents,df_children_sample)
  ```
- Line 55: name
  ```
  filename <- paste0(data, "parents_firms_firm_size.Rdata")
  ```
- Line 56: name
  ```
  save(df, file = filename)
  ```
- Line 57: name
  ```
  rm(df_connections,filename,df)
  ```

**/replication-package/labor_networks/code/inter/prepare_parents_firms_grad1.R**

- Line 3: name
  ```
  filename <- paste0(data, "employment_history.Rdata")
  ```
- Line 4: name
  ```
  load(filename)
  ```
- Line 6: name
  ```
  rm(df,filename)
  ```
- Line 8: child
  ```
  # load the temporary children sample
  ```
- Line 9: child, name
  ```
  filename <- paste0(data, "children_sample1_grad1.Rdata")
  ```
- Line 10: name
  ```
  load(filename)
  ```
- Line 11: child
  ```
  df_children_sample <- df
  ```
- Line 12: name
  ```
  rm(df,filename)
  ```
- Line 14: child
  ```
  # load children-parents link
  ```
- Line 15: name
  ```
  filename <- paste0(data, "df_parents.Rdata")
  ```
- Line 16: name
  ```
  load(filename)
  ```
- Line 18: name
  ```
  rm(df,filename)
  ```
- Line 23: birth, child
  ```
  df_connections <- merge(df_children_sample[,.(id,birth_year)],
  ```
- Line 26: child
  ```
  rm(df_children_sample)
  ```
- Line 28: child
  ```
  # get children-past parent firms link (10 years before the child is 21)
  ```
- Line 31: birth
  ```
  by.y = "id", allow.cartesian=TRUE)[year-birth_year <= 21
  ```
- Line 32: birth
  ```
  & year-birth_year >= 12]
  ```
- Line 45: lon, name
  ```
  filename <- paste0(data, "parents_firms_long_grad1.Rdata")
  ```
- Line 46: name
  ```
  save(df, file = filename)
  ```
- Line 47: name
  ```
  rm(df_connections,filename)
  ```
- Line 52: name
  ```
  filename <- paste0(data, "parents_firms_grad1.Rdata")
  ```
- Line 53: name
  ```
  save(df, file = filename)
  ```
- Line 54: name
  ```
  rm(df,filename)
  ```

**/replication-package/labor_networks/code/inter/prepare_population.R**

- Line 1: lat
  ```
  ## prepare population file
  ```
- Line 3: lat, name
  ```
  filename <- paste0(raw, "all_population.dta")
  ```
- Line 4: name
  ```
  df <- read_dta(filename)
  ```
- Line 7: lname, name
  ```
  colnames(df)[colnames(df) == "tz"] <- "id"
  ```
- Line 8: father, lname, name
  ```
  colnames(df)[colnames(df) == "zav"] <- "id_father"
  ```
- Line 9: lname, mother, name
  ```
  colnames(df)[colnames(df) == "zem"] <- "id_mother"
  ```
- Line 10: lname, name
  ```
  colnames(df)[colnames(df) == "leom2"] <- "nation"
  ```
- Line 11: birth, country, lname, name
  ```
  colnames(df)[colnames(df) == "ealia"] <- "birth_country"
  ```
- Line 12: birth, lname, name
  ```
  colnames(df)[colnames(df) == "yy_leda"] <- "birth_year"
  ```
- Line 13: birth, lname, name
  ```
  colnames(df)[colnames(df) == "mm_leda"] <- "birth_month"
  ```
- Line 14: lname, name
  ```
  colnames(df)[colnames(df) == "yy_alia"] <- "immigration_year"
  ```
- Line 15: lname, name
  ```
  colnames(df)[colnames(df) == "mm_alia"] <- "immigration_month"
  ```
- Line 16: lname, name
  ```
  colnames(df)[colnames(df) == "yy_ptira"] <- "death_year"
  ```
- Line 17: lname, name
  ```
  colnames(df)[colnames(df) == "mm_ptira"] <- "death_month"
  ```
- Line 18: lname, name, sex
  ```
  colnames(df)[colnames(df) == "min1"] <- "sex"
  ```
- Line 21: sex
  ```
  df[, sex:= sex - 1]
  ```
- Line 23: birth, country, name
  ```
  filename <- paste0(excel, "birth_country.xlsx")
  ```
- Line 24: birth, country, name
  ```
  df_birth_country <- read_xlsx(filename,"data")
  ```
- Line 25: birth, country
  ```
  df_birth_country <- data.table(df_birth_country)
  ```
- Line 26: birth, country
  ```
  df_birth_country[,birth_country_heb:=NULL]
  ```
- Line 27: birth, country
  ```
  df <- merge(df,  df_birth_country, by = c("birth_country"),
  ```
- Line 31: birth
  ```
  df[(!(is.na(immigration_year)) & (birth_region1 != 4 )), native := 0 ]
  ```
- Line 32: birth
  ```
  df[ (is.na(immigration_year) & (birth_region1 == 4 )), native := 1]
  ```
- Line 35: name
  ```
  filename <- paste0(raw, "hardi.dta")
  ```
- Line 36: name
  ```
  df1 <- read_dta(filename)
  ```
- Line 38: lname, name
  ```
  colnames(df1)[colnames(df1) == "tz"] <- "id"
  ```
- Line 39: lname, name
  ```
  colnames(df1)[colnames(df1) == "hardi"] <- "ultraorthodox"
  ```
- Line 54: birth
  ```
  # note: individuas without nation information assumed to be jews (based on check of their birth cont
  ```
- Line 56: city
  ```
  df[(nation == 0 | is.na(nation)) , ethnicity := 0]
  ```
- Line 57: city
  ```
  df[nation >= 1 & nation <= 4 , ethnicity := 1]
  ```
- Line 60: lat, name
  ```
  filename <- paste0(data, "population.Rdata")
  ```
- Line 61: name
  ```
  save(df, file = filename)
  ```

**/replication-package/labor_networks/code/inter/prepare_sector.R**

- Line 19: lon
  ```
  ## functions_reg_emp_con_long.R) load this file and use `df` -> id_firm,
  ```
- Line 21: name
  ```
  ## MUST be named `df`.
  ```
- Line 25: name
  ```
  filename <- paste0(data, "firm_industry.Rdata")
  ```
- Line 26: name
  ```
  load(filename)                                   # object: df (id_firm, industry)
  ```
- Line 31: name
  ```
  filename            <- paste0(excel, "sectors.xlsx")
  ```
- Line 32: name
  ```
  ind2d2sector        <- as.data.table(read_xlsx(filename, sheet = "ind2d2sector"))       # ind2d, sec
  ```
- Line 33: name
  ```
  sector2main_sector  <- as.data.table(read_xlsx(filename, sheet = "sector2main_sector")) # sector, se
  ```
- Line 34: name
  ```
  public              <- as.data.table(read_xlsx(filename, sheet = "public"))             # ind2d, pub
  ```
- Line 47: name
  ```
  filename <- paste0(data, "firm_industry_sector.Rdata")
  ```
- Line 48: name
  ```
  save(df, file = filename)
  ```
- Line 52: name
  ```
  rm(df, df_firm, ind2d2sector, sector2main_sector, public, filename)
  ```

**/replication-package/labor_networks/code/inter/prepare_summary_children_multiple2.R**

- Line 2: child
  ```
  # load the children sample
  ```
- Line 3: child, name
  ```
  filename <- paste0(data, "children_sample.Rdata")
  ```
- Line 4: name
  ```
  load(filename)
  ```
- Line 5: child
  ```
  df_children <- df
  ```
- Line 8: child
  ```
  ## get the firm and salary of first job of children
  ```
- Line 9: name
  ```
  filename <- paste0(data, "employment_history.Rdata")
  ```
- Line 10: name
  ```
  load(filename)
  ```
- Line 13: child
  ```
  df_children = merge(df_children,df_employment[,.(id,year,salary)], by = c("id","year") , all.x = TRU
  ```
- Line 17: name
  ```
  filename <- paste0(data, "akm_firm.Rdata")
  ```
- Line 18: name
  ```
  load(filename)
  ```
- Line 23: child
  ```
  df_children = merge(df_children,df_akm_firm, by = c("id_firm","year") , all.x = TRUE)
  ```
- Line 27: name
  ```
  filename <- paste0(data, "connections_firm_rank_multiple2.Rdata")
  ```
- Line 28: name
  ```
  load(filename)
  ```
- Line 33: child
  ```
  df_children = merge(df_children,df_connections, by = c("id") , all.x = TRUE)
  ```
- Line 36: name
  ```
  filename <- paste0(data, "connections_type_multiple2.Rdata")
  ```
- Line 37: name
  ```
  load(filename)
  ```
- Line 38: child
  ```
  df_children = merge(df_children,df[,.(id,id_firm,con_type)], by = c("id","id_firm") , all.x = TRUE)
  ```
- Line 39: child
  ```
  df_children[is.na(con_type),con_type := 0]
  ```
- Line 43: child
  ```
  df_wages <- df_children[,.(id,
  ```
- Line 46: sex
  ```
  sex,
  ```
- Line 47: birth
  ```
  age = year - birth_year,
  ```
- Line 49: city
  ```
  ethnicity,
  ```
- Line 73: child
  ```
  rm(df_children,df_akm_firm,df_connections)
  ```
- Line 78: child, name
  ```
  filename <- paste0(data, "summary_children_multiple2.Rdata")
  ```
- Line 79: name
  ```
  save(df, file = filename)
  ```

**/replication-package/labor_networks/code/inter/prepare_wages.R**

- Line 39: lat
  ```
  # load the population file to get the age of the workers
  ```
- Line 40: lat, name
  ```
  filename <- paste0(data, "population.Rdata")
  ```
- Line 41: name
  ```
  load(filename)
  ```
- Line 42: birth, lat
  ```
  df_population <- df[,.(id,birth_year)]
  ```
- Line 43: birth, lat
  ```
  df_population <- df_population[!(is.na(id) | is.na(birth_year))]
  ```
- Line 52: name
  ```
  filename <- paste0(raw, "sachar/sachar_", t, ".dta")
  ```
- Line 53: name
  ```
  df <- read_dta(filename)
  ```
- Line 55: name
  ```
  # rename the variables
  ```
- Line 56: lname, name
  ```
  colnames(df)[colnames(df) == "tz"] <- "id"
  ```
- Line 57: lname, name
  ```
  colnames(df)[colnames(df) == "s_total"] <- "yearly_salary"
  ```
- Line 58: lname, name
  ```
  colnames(df)[colnames(df) == "id_maavid"] <- "id_firm"
  ```
- Line 59: lname, name
  ```
  colnames(df)[colnames(df) == "anaf"] <- "industry"
  ```
- Line 60: lname, name
  ```
  colnames(df)[colnames(df) == "sah_hs01"] <- "month01"
  ```
- Line 61: lname, name
  ```
  colnames(df)[colnames(df) == "sah_hs02"] <- "month02"
  ```
- Line 62: lname, name
  ```
  colnames(df)[colnames(df) == "sah_hs03"] <- "month03"
  ```
- Line 63: lname, name
  ```
  colnames(df)[colnames(df) == "sah_hs04"] <- "month04"
  ```
- Line 64: lname, name
  ```
  colnames(df)[colnames(df) == "sah_hs05"] <- "month05"
  ```
- Line 65: lname, name
  ```
  colnames(df)[colnames(df) == "sah_hs06"] <- "month06"
  ```
- Line 66: lname, name
  ```
  colnames(df)[colnames(df) == "sah_hs07"] <- "month07"
  ```
- Line 67: lname, name
  ```
  colnames(df)[colnames(df) == "sah_hs08"] <- "month08"
  ```
- Line 68: lname, name
  ```
  colnames(df)[colnames(df) == "sah_hs09"] <- "month09"
  ```
- Line 69: lname, name
  ```
  colnames(df)[colnames(df) == "sah_hs10"] <- "month10"
  ```
- Line 70: lname, name
  ```
  colnames(df)[colnames(df) == "sah_hs11"] <- "month11"
  ```
- Line 71: lname, name
  ```
  colnames(df)[colnames(df) == "sah_hs12"] <- "month12"
  ```
- Line 77: lname, name
  ```
  month_cols <- colnames(subset(df,select = month01:month12))
  ```
- Line 105: lat
  ```
  # calculate months of work in a year
  ```
- Line 108: lat
  ```
  # calculate avergae monthly salary
  ```
- Line 120: lat
  ```
  df <- merge(df, df_population, by = "id")
  ```
- Line 121: birth
  ```
  df <- df[t - birth_year >= 22 & t - birth_year <= 69]
  ```
- Line 122: birth
  ```
  df[,birth_year := NULL ]
  ```
- Line 131: lat
  ```
  # calculate number of workers by firm-year
  ```
- Line 135: lat
  ```
  # calculate salary rank
  ```
- Line 139: name
  ```
  filename <- paste0(data, "wages_",t,".Rdata")
  ```
- Line 140: name
  ```
  save(df, file = filename)
  ```
- Line 144: lat
  ```
  rm(df_population)
  ```

**/replication-package/labor_networks/code/inter/prepare_wages_1927.R**

- Line 39: lat
  ```
  # load the population file to get the age of the workers
  ```
- Line 40: lat, name
  ```
  filename <- paste0(data, "population.Rdata")
  ```
- Line 41: name
  ```
  load(filename)
  ```
- Line 42: birth, lat
  ```
  df_population <- df[,.(id,birth_year)]
  ```
- Line 43: birth, lat
  ```
  df_population <- df_population[!(is.na(id) | is.na(birth_year))]
  ```
- Line 52: name
  ```
  filename <- paste0(raw, "sachar/sachar_", t, ".dta")
  ```
- Line 53: name
  ```
  df <- read_dta(filename)
  ```
- Line 55: name
  ```
  # rename the variables
  ```
- Line 56: lname, name
  ```
  colnames(df)[colnames(df) == "tz"] <- "id"
  ```
- Line 57: lname, name
  ```
  colnames(df)[colnames(df) == "s_total"] <- "yearly_salary"
  ```
- Line 58: lname, name
  ```
  colnames(df)[colnames(df) == "id_maavid"] <- "id_firm"
  ```
- Line 59: lname, name
  ```
  colnames(df)[colnames(df) == "anaf"] <- "industry"
  ```
- Line 60: lname, name
  ```
  colnames(df)[colnames(df) == "sah_hs01"] <- "month01"
  ```
- Line 61: lname, name
  ```
  colnames(df)[colnames(df) == "sah_hs02"] <- "month02"
  ```
- Line 62: lname, name
  ```
  colnames(df)[colnames(df) == "sah_hs03"] <- "month03"
  ```
- Line 63: lname, name
  ```
  colnames(df)[colnames(df) == "sah_hs04"] <- "month04"
  ```
- Line 64: lname, name
  ```
  colnames(df)[colnames(df) == "sah_hs05"] <- "month05"
  ```
- Line 65: lname, name
  ```
  colnames(df)[colnames(df) == "sah_hs06"] <- "month06"
  ```
- Line 66: lname, name
  ```
  colnames(df)[colnames(df) == "sah_hs07"] <- "month07"
  ```
- Line 67: lname, name
  ```
  colnames(df)[colnames(df) == "sah_hs08"] <- "month08"
  ```
- Line 68: lname, name
  ```
  colnames(df)[colnames(df) == "sah_hs09"] <- "month09"
  ```
- Line 69: lname, name
  ```
  colnames(df)[colnames(df) == "sah_hs10"] <- "month10"
  ```
- Line 70: lname, name
  ```
  colnames(df)[colnames(df) == "sah_hs11"] <- "month11"
  ```
- Line 71: lname, name
  ```
  colnames(df)[colnames(df) == "sah_hs12"] <- "month12"
  ```
- Line 77: lname, name
  ```
  month_cols <- colnames(subset(df,select = month01:month12))
  ```
- Line 105: lat
  ```
  # calculate months of work in a year
  ```
- Line 108: lat
  ```
  # calculate avergae monthly salary
  ```
- Line 120: lat
  ```
  df <- merge(df, df_population, by = "id")
  ```
- Line 121: birth
  ```
  df <- df[t - birth_year >= 19 & t - birth_year <= 69]
  ```
- Line 122: birth
  ```
  df[,birth_year := NULL ]
  ```
- Line 131: lat
  ```
  # calculate number of workers by firm-year
  ```
- Line 135: lat
  ```
  # calculate salary rank
  ```
- Line 139: name
  ```
  filename <- paste0(data, "wages_1927_",t,".Rdata")
  ```
- Line 140: name
  ```
  save(df, file = filename)
  ```
- Line 144: lat
  ```
  rm(df_population)
  ```

**/replication-package/labor_networks/code/inter/prepare_wages_total.R**

- Line 4: son
  ```
  ## Builds wages_total_<year>.Rdata : one row per person-firm (i.e. ALL jobs of
  ```
- Line 5: son
  ```
  ## a person in a year), so consumers can compute total earnings across jobs and
  ```
- Line 13: child
  ```
  ## Consumers (prepare_children_panel_employment.R,
  ```
- Line 14: child
  ```
  ## prepare_children_panel_total_5years[_multiple2].R) read id, id_firm,
  ```
- Line 55: lat
  ```
  # load the population file to get the age of the workers
  ```
- Line 56: lat, name
  ```
  filename <- paste0(data, "population.Rdata")
  ```
- Line 57: name
  ```
  load(filename)
  ```
- Line 58: birth, lat
  ```
  df_population <- df[,.(id,birth_year)]
  ```
- Line 59: birth, lat
  ```
  df_population <- df_population[!(is.na(id) | is.na(birth_year))]
  ```
- Line 68: name
  ```
  filename <- paste0(raw, "sachar/sachar_", t, ".dta")
  ```
- Line 69: name
  ```
  df <- read_dta(filename)
  ```
- Line 71: name
  ```
  # rename the variables
  ```
- Line 72: lname, name
  ```
  colnames(df)[colnames(df) == "tz"] <- "id"
  ```
- Line 73: lname, name
  ```
  colnames(df)[colnames(df) == "s_total"] <- "yearly_salary"
  ```
- Line 74: lname, name
  ```
  colnames(df)[colnames(df) == "id_maavid"] <- "id_firm"
  ```
- Line 75: lname, name
  ```
  colnames(df)[colnames(df) == "anaf"] <- "industry"
  ```
- Line 76: lname, name
  ```
  colnames(df)[colnames(df) == "sah_hs01"] <- "month01"
  ```
- Line 77: lname, name
  ```
  colnames(df)[colnames(df) == "sah_hs02"] <- "month02"
  ```
- Line 78: lname, name
  ```
  colnames(df)[colnames(df) == "sah_hs03"] <- "month03"
  ```
- Line 79: lname, name
  ```
  colnames(df)[colnames(df) == "sah_hs04"] <- "month04"
  ```
- Line 80: lname, name
  ```
  colnames(df)[colnames(df) == "sah_hs05"] <- "month05"
  ```
- Line 81: lname, name
  ```
  colnames(df)[colnames(df) == "sah_hs06"] <- "month06"
  ```
- Line 82: lname, name
  ```
  colnames(df)[colnames(df) == "sah_hs07"] <- "month07"
  ```
- Line 83: lname, name
  ```
  colnames(df)[colnames(df) == "sah_hs08"] <- "month08"
  ```
- Line 84: lname, name
  ```
  colnames(df)[colnames(df) == "sah_hs09"] <- "month09"
  ```
- Line 85: lname, name
  ```
  colnames(df)[colnames(df) == "sah_hs10"] <- "month10"
  ```
- Line 86: lname, name
  ```
  colnames(df)[colnames(df) == "sah_hs11"] <- "month11"
  ```
- Line 87: lname, name
  ```
  colnames(df)[colnames(df) == "sah_hs12"] <- "month12"
  ```
- Line 93: lname, name
  ```
  month_cols <- colnames(subset(df,select = month01:month12))
  ```
- Line 121: lat
  ```
  # calculate months of work in a year
  ```
- Line 124: lat
  ```
  # calculate avergae monthly salary
  ```
- Line 132: lat
  ```
  df <- merge(df, df_population, by = "id")
  ```
- Line 133: birth
  ```
  df <- df[t - birth_year >= 22 & t - birth_year <= 69]
  ```
- Line 134: birth
  ```
  df[,birth_year := NULL ]
  ```
- Line 140: son
  ```
  # save the data (one row per person-firm: all jobs)
  ```
- Line 141: name
  ```
  filename <- paste0(data, "wages_total_",t,".Rdata")
  ```
- Line 142: name
  ```
  save(df, file = filename)
  ```
- Line 146: lat
  ```
  rm(df_population)
  ```

**/replication-package/labor_networks/code/inter/tabels_hist_group_size.R**

- Line 1: child
  ```
  # load the children sample
  ```
- Line 2: child, name
  ```
  filename <- paste0(data, "children_sample.Rdata")
  ```
- Line 3: name
  ```
  load(filename)
  ```
- Line 4: child
  ```
  df_children <- df
  ```
- Line 7: child, city
  ```
  df_children[,group := interaction(factor(graduation_year ),factor(ethnicity),sep = ":")]
  ```
- Line 8: child
  ```
  df_children[,group := interaction(group,factor(year),sep = ":")]
  ```
- Line 9: child, sex
  ```
  df_children[,group := interaction(group,factor(sex),sep = ":")]
  ```
- Line 10: child
  ```
  df_children[,group := interaction(group,factor(education),sep = ":")]
  ```
- Line 11: child, district
  ```
  df_children[,group := interaction(group,factor(district),sep = ":")]
  ```
- Line 12: child
  ```
  table = df_children[,.(group_size = .N), by = "group"]
  ```
- Line 20: name
  ```
  # the mids column may be named "mids" or "mids.V1" depending on data.table version;
  ```
- Line 21: name
  ```
  # the breaks column may be "V1"; rename both tolerantly
  ```
- Line 22: name
  ```
  setnames(hist,"mids.V1","mids", skip_absent = TRUE)
  ```
- Line 23: name
  ```
  setnames(hist,"V1","mins", skip_absent = TRUE)
  ```
- Line 25: name
  ```
  filename <- paste0(output, "table_hist_group_size.csv")
  ```
- Line 26: name
  ```
  write.csv(hist,filename)
  ```
- Line 27: child
  ```
  rm(hist,df_children,breaks,table)
  ```

**/replication-package/labor_networks/code/inter/tables_children_panel.R**

- Line 2: child, name
  ```
  filename <- paste0(data, "children_panel.Rdata")
  ```
- Line 3: name
  ```
  load(filename)
  ```
- Line 7: child, name
  ```
  filename <- paste0(data, "children_first_job_data.Rdata")
  ```
- Line 8: name
  ```
  load(filename)
  ```
- Line 9: child
  ```
  df_children <- df
  ```
- Line 13: child
  ```
  df_wages = merge(df_wages,df_children[,.(id,duration_first_job)], by = "id")
  ```
- Line 18: city
  ```
  df_wages[,group := interaction(factor(year_first_job),factor(ethnicity),sep = ":")]
  ```
- Line 20: sex
  ```
  df_wages[,group := interaction(group,factor(sex),sep = ":")]
  ```
- Line 22: district
  ```
  df_wages[,group := interaction(group,factor(district),sep = ":")]
  ```
- Line 220: child, name
  ```
  filename  <- paste0(output, "figure_children_panel.csv")
  ```
- Line 221: name
  ```
  write.csv(table,filename)
  ```
- Line 224: child
  ```
  rm(table,table1,table2,x,df_wages,df_children)
  ```

**/replication-package/labor_networks/code/inter/tables_firm_var_sector.R**

- Line 1: name
  ```
  filename <- paste0(data, "connections_type.Rdata")
  ```
- Line 2: name
  ```
  load(filename)
  ```
- Line 6: child, name
  ```
  filename <- paste0(data, "children_sample.Rdata")
  ```
- Line 7: name
  ```
  load(filename)
  ```
- Line 8: child
  ```
  df_children = df[,.(id,year)]
  ```
- Line 11: name
  ```
  filename <- paste0(data, "firm_industry_sector.Rdata")
  ```
- Line 12: name
  ```
  load(filename)
  ```
- Line 17: name
  ```
  filename <- paste0(data, "firms_duration_bins.Rdata")
  ```
- Line 18: name
  ```
  load(filename)
  ```
- Line 23: name
  ```
  filename <- paste0(data, "firms_akm_res_bins.Rdata")
  ```
- Line 24: name
  ```
  load(filename)
  ```
- Line 28: name
  ```
  filename <- paste0(data, "akm_firm.Rdata")
  ```
- Line 29: name
  ```
  load(filename)
  ```
- Line 33: child, name, son
  ```
  filename <- paste0(data, "akm_person_children_only.Rdata")
  ```
- Line 34: name
  ```
  load(filename)
  ```
- Line 35: son
  ```
  df_akm_person = df
  ```
- Line 38: child
  ```
  df_connections = merge(df_connections,df_children,by = "id", all.x = T)
  ```
- Line 43: son
  ```
  df_connections = merge(df_connections,df_akm_person[,.(id,person_rank,year)],by = c("id","year"), al
  ```
- Line 45: son
  ```
  df_connections[,gap:=firm_rank - person_rank]
  ```
- Line 59: name
  ```
  filename <- paste0(output, "table_firm_var_sector.csv")
  ```
- Line 60: name
  ```
  fwrite(table_sector,filename)
  ```

**/replication-package/labor_networks/code/inter/tables_hist_con.R**

- Line 2: name
  ```
  filename <- paste0(data, "connections_type_multiple2.Rdata")
  ```
- Line 3: name
  ```
  load(filename)
  ```
- Line 8: name
  ```
  filename <- paste0(data, "employment_history.Rdata")
  ```
- Line 9: name
  ```
  load(filename)
  ```
- Line 11: name
  ```
  rm(df,filename)
  ```
- Line 13: child
  ```
  # load the children sample
  ```
- Line 14: child, name
  ```
  filename <- paste0(data, "children_sample.Rdata")
  ```
- Line 15: name
  ```
  load(filename)
  ```
- Line 16: child
  ```
  df_children <- df
  ```
- Line 17: name
  ```
  rm(df,filename)
  ```
- Line 19: child
  ```
  # attach the child's (first-job) year to each connection
  ```
- Line 20: child
  ```
  df_connections <- merge(df_connections, df_children[,.(id, year)], by = "id")
  ```
- Line 23: name
  ```
  filename <- paste0(data, "firm_industry_sector.Rdata")
  ```
- Line 24: name
  ```
  load(filename)
  ```
- Line 26: name
  ```
  rm(df,filename)
  ```
- Line 43: name
  ```
  #filename <- paste0(output, "table_hist_con_firm.csv")
  ```
- Line 44: name
  ```
  #write.csv(table_firm,filename)
  ```
- Line 53: name
  ```
  #filename <- paste0(output, "table_mean_con_firm_sector.csv")
  ```
- Line 54: name
  ```
  #write.csv(table_firm_sector,filename)
  ```
- Line 64: name
  ```
  #filename <- paste0(output, "table_con_firm_size.csv")
  ```
- Line 65: name
  ```
  #write.csv(table_con_firm_size,filename)
  ```
- Line 69: child
  ```
  df_workers_all = CJ(id = unique(df_children[,id]),con_type = unique(df_workers[,con_type]))
  ```
- Line 72: child, city, sex
  ```
  df_workers =merge(df_workers,df_children[,.(id,sex,ethnicity)],by = "id")
  ```
- Line 81: sex
  ```
  sex1 = -1
  ```
- Line 82: city
  ```
  ethnicity1 = -1
  ```
- Line 85: sex
  ```
  df_workers1 = df_workers1[sex == 0]
  ```
- Line 86: sex
  ```
  sex1 = 0
  ```
- Line 90: sex
  ```
  df_workers1 = df_workers1[sex == 1]
  ```
- Line 91: sex
  ```
  sex1 = 1
  ```
- Line 95: city
  ```
  df_workers1 = df_workers1[ethnicity == 0]
  ```
- Line 96: city
  ```
  ethnicity1 = 0
  ```
- Line 100: city
  ```
  df_workers1 = df_workers1[ethnicity == 1]
  ```
- Line 101: city
  ```
  ethnicity1 = 1
  ```
- Line 111: name
  ```
  setnames(hist,"V1","mins")
  ```
- Line 113: sex
  ```
  hist[,sex := sex1]
  ```
- Line 114: city
  ```
  hist[,ethnicity := ethnicity1]
  ```
- Line 125: name
  ```
  filename <- paste0(output, "table_hist_con_worker.csv")
  ```
- Line 126: name
  ```
  write.csv(table_worker,filename)
  ```
- Line 131: name
  ```
  #filename <- paste0(output, "table_hist_con_worker_sector.csv")
  ```
- Line 132: name
  ```
  #write.csv(table_worker_sector,filename)
  ```
- Line 136: name
  ```
  filename <- paste0(data, "connections_type_multiple2.Rdata")
  ```
- Line 137: name
  ```
  load(filename)
  ```
- Line 145: lon, name
  ```
  filename <- paste0(data, "connections_long_",t,".Rdata")
  ```
- Line 146: name
  ```
  load(filename)
  ```
- Line 147: lon
  ```
  df_connections_long = df[,.(id,id_firm ,log_firm_size_past)]
  ```
- Line 149: lon
  ```
  df_connections_long <- merge(df_connections_long,df_connections, by = c("id","id_firm"))
  ```
- Line 152: lon
  ```
  df_connections_long1 = df_connections_long
  ```
- Line 155: lon
  ```
  df_connections_long1 = rbind(df_connections_long1,df_connections_long)
  ```
- Line 157: lon
  ```
  rm(df_connections_long)
  ```
- Line 163: lon
  ```
  hist = df_connections_long1[con_type == k,hist(log_firm_size_past )]
  ```
- Line 167: name
  ```
  setnames(hist,"V1","mins")
  ```
- Line 179: name
  ```
  #filename <- paste0(output, "table_hist_con_firm_size_past.csv")
  ```
- Line 180: name
  ```
  #write.csv(table,filename)
  ```
- Line 181: lon
  ```
  rm(table,df_connections_long1)
  ```
- Line 184: name
  ```
  filename <- paste0(data, "connections_type_multiple2.Rdata")
  ```
- Line 185: name
  ```
  load(filename)
  ```
- Line 193: lon, name
  ```
  filename <- paste0(data, "connections_long_",t,".Rdata")
  ```
- Line 194: name
  ```
  load(filename)
  ```
- Line 195: lon
  ```
  df_connections_long = df[,.(id,id_firm ,log_firm_size_current)]
  ```
- Line 198: lon
  ```
  df_connections_long <- merge(df_connections_long,df_connections, by = c("id","id_firm"))
  ```
- Line 202: lon
  ```
  df_connections_long1 = df_connections_long
  ```
- Line 205: lon
  ```
  df_connections_long1 = rbind(df_connections_long1,df_connections_long)
  ```
- Line 207: lon
  ```
  rm(df_connections_long)
  ```
- Line 213: lon
  ```
  hist = df_connections_long1[con_type == k,hist(log_firm_size_current )]
  ```
- Line 217: name
  ```
  setnames(hist,"V1","mins")
  ```
- Line 229: name
  ```
  #filename <- paste0(output, "table_hist_con_firm_size_current.csv")
  ```
- Line 230: name
  ```
  #write.csv(table,filename)
  ```
- Line 231: lon
  ```
  rm(table,df_connections_long1)
  ```

**/replication-package/labor_networks/code/inter/tables_hist_con_firmsize_multiple2.R**

- Line 2: name
  ```
  filename <- paste0(data,connections_file )
  ```
- Line 3: name
  ```
  load(filename)
  ```
- Line 14: name
  ```
  setnames(hist,"V1","mins")
  ```
- Line 26: name
  ```
  filename <- paste0(output, "table_hist_con_past_firmsize_multiple2.csv")
  ```
- Line 27: name
  ```
  write.csv(table,filename)
  ```
- Line 38: name
  ```
  setnames(hist,"V1","mins")
  ```
- Line 50: name
  ```
  filename <- paste0(output, "table_hist_con_current_firmsize_multiple2.csv")
  ```
- Line 51: name
  ```
  write.csv(table,filename)
  ```

**/replication-package/labor_networks/code/inter/tables_raw_emp_con.R**

- Line 2: child
  ```
  # load the children sample
  ```
- Line 3: child, name
  ```
  filename <- paste0(data, "children_sample.Rdata")
  ```
- Line 4: name
  ```
  load(filename)
  ```
- Line 5: child
  ```
  df_children <- df
  ```
- Line 10: name
  ```
  filename <- paste0(data, "connections_type.Rdata")
  ```
- Line 11: name
  ```
  load(filename)
  ```
- Line 14: child
  ```
  df_connections <- merge(df_connections,df_children[,.(id,year)], by = "id")
  ```
- Line 17: child
  ```
  df_employment <- df_children[,.(id,id_firm)]
  ```
- Line 29: name
  ```
  filename <- paste0(output, "figure_raw_emp_con.csv")
  ```
- Line 30: name
  ```
  write.csv(table1,filename)
  ```

**/replication-package/labor_networks/code/inter/tables_reg_balancing.R**

- Line 3: name
  ```
  filename <- paste0(log, "reg_balancing_",today,".txt")
  ```
- Line 4: name
  ```
  sink(file = filename,split = TRUE)
  ```
- Line 14: child
  ```
  #take 20% of children
  ```
- Line 18: child
  ```
  # load the children sample
  ```
- Line 19: child, name
  ```
  filename <- paste0(data, "children_sample.Rdata")
  ```
- Line 20: name
  ```
  load(filename)
  ```
- Line 21: child
  ```
  df_children <- df
  ```
- Line 24: child
  ```
  df_children = cbind(df_children,data.table(runif(dim(df_children)[1])))
  ```
- Line 25: child
  ```
  df_children <- df_children[V1 < 0.02 ]
  ```
- Line 26: child
  ```
  df_children[,V1 := NULL]
  ```
- Line 28: child
  ```
  df_reg <- get.reg.balancing.data(df_children)
  ```
- Line 29: child
  ```
  rm(df_children)
  ```
- Line 50: name
  ```
  filename <- paste0(data, "reg_balancing.Rdata")
  ```
- Line 51: name
  ```
  save(table1,table2,file = filename)
  ```
- Line 54: name
  ```
  filename <- paste0(data, "reg_balancing.Rdata")
  ```
- Line 55: name
  ```
  load(filename)
  ```
- Line 58: child, name
  ```
  filename <- paste0(data, "children_sample.Rdata")
  ```
- Line 59: name
  ```
  load(filename)
  ```
- Line 60: child
  ```
  df_children <- df
  ```
- Line 63: child
  ```
  stat1 <- get.statistics(df_children)
  ```
- Line 76: name
  ```
  filename <- paste0(output, "table_reg_balancing.csv")
  ```
- Line 77: name
  ```
  write.csv(table,filename)
  ```

**/replication-package/labor_networks/code/inter/tables_reg_children_panel_employment.R**

- Line 1: child, name
  ```
  filename <- paste0(data, "children_panel_employment.Rdata")
  ```
- Line 2: name
  ```
  load(filename)
  ```
- Line 92: child, name
  ```
  filename  <- paste0(output, "table_reg_children_panel_employment.csv")
  ```
- Line 93: name
  ```
  write.csv(table,filename)
  ```

**/replication-package/labor_networks/code/inter/tables_reg_emp_con.R**

- Line 3: name
  ```
  filename <- paste0(log, "reg_emp_con_",today,".txt")
  ```
- Line 4: name
  ```
  sink(file = filename,split = TRUE)
  ```
- Line 14: child
  ```
  #take 20% of children
  ```
- Line 18: child
  ```
  # load the children sample
  ```
- Line 19: child, name
  ```
  filename <- paste0(data, "children_sample.Rdata")
  ```
- Line 20: name
  ```
  load(filename)
  ```
- Line 21: child
  ```
  df_children <- df
  ```
- Line 24: child
  ```
  df_children = cbind(df_children,data.table(runif(dim(df_children)[1])))
  ```
- Line 25: child
  ```
  df_children <- df_children[V1 < 0.2 ]
  ```
- Line 26: child
  ```
  df_children[,V1 := NULL]
  ```
- Line 28: child
  ```
  df_reg <- get.reg.emp.con.data(df_children)
  ```
- Line 29: child
  ```
  rm(df_children)
  ```
- Line 41: city
  ```
  table_temp <- run.reg.emp.con(df_reg[ethnicity == 0])
  ```
- Line 48: city
  ```
  table_temp <- run.reg.emp.con(df_reg[ethnicity == 1])
  ```
- Line 68: sex
  ```
  table_temp <- run.reg.emp.con(df_reg[sex == 0])
  ```
- Line 75: sex
  ```
  table_temp <- run.reg.emp.con(df_reg[sex == 1])
  ```
- Line 87: city
  ```
  table_temp <- run.reg.emp.con.event(df_reg[ethnicity == 0])
  ```
- Line 93: city
  ```
  table_temp <- run.reg.emp.con.event(df_reg[ethnicity == 1])
  ```
- Line 113: sex
  ```
  table_temp <- run.reg.emp.con.event(df_reg[sex == 0])
  ```
- Line 119: sex
  ```
  table_temp <- run.reg.emp.con.event(df_reg[sex == 1])
  ```
- Line 130: name
  ```
  filename <- paste0(data, "reg_emp_con.Rdata")
  ```
- Line 133: name
  ```
  file = filename)
  ```
- Line 138: name
  ```
  filename <- paste0(data, "reg_emp_con.Rdata")
  ```
- Line 139: name
  ```
  load(filename)
  ```
- Line 142: child, name
  ```
  filename <- paste0(data, "children_sample.Rdata")
  ```
- Line 143: name
  ```
  load(filename)
  ```
- Line 144: child
  ```
  df_children <- df
  ```
- Line 147: child
  ```
  stat1 <- get.statistics(df_children)
  ```
- Line 148: child, city
  ```
  stat2 <- get.statistics(df_children[ethnicity == 0])
  ```
- Line 149: child, city
  ```
  stat3 <- get.statistics(df_children[ethnicity == 1])
  ```
- Line 150: child
  ```
  stat4 <- get.statistics(df_children[ education == 0])
  ```
- Line 151: child
  ```
  stat5 <- get.statistics(df_children[ education == 1])
  ```
- Line 152: child, sex
  ```
  stat6 <- get.statistics(df_children[ sex == 0])
  ```
- Line 153: child, sex
  ```
  stat7 <- get.statistics(df_children[ sex == 1])
  ```
- Line 178: name
  ```
  #filename <- paste0(output, "table_reg_emp_con.csv")
  ```
- Line 179: name
  ```
  #write.csv(table,filename)
  ```
- Line 202: name
  ```
  filename <- paste0(output, "figure_reg_emp_con_event.csv")
  ```
- Line 203: name
  ```
  write.csv(table,filename)
  ```

**/replication-package/labor_networks/code/inter/tables_reg_emp_con_1927.R**

- Line 3: name
  ```
  filename <- paste0(log, "reg_emp_con_1927_",today,".txt")
  ```
- Line 4: name
  ```
  sink(file = filename,split = TRUE)
  ```
- Line 17: child
  ```
  # load the children sample
  ```
- Line 18: child, name
  ```
  filename <- paste0(data, "children_sample_1927.Rdata")
  ```
- Line 19: name
  ```
  load(filename)
  ```
- Line 20: child
  ```
  df_children <- df
  ```
- Line 23: child
  ```
  #take 20% of children
  ```
- Line 24: child
  ```
  df_children = cbind(df_children,data.table(runif(dim(df_children)[1])))
  ```
- Line 25: child
  ```
  df_children <- df_children[V1 < 0.2 ]
  ```
- Line 26: child
  ```
  df_children[,V1 := NULL]
  ```
- Line 28: child
  ```
  df_reg <- get.reg.emp.con.data(df_children,"connections_type_1927.Rdata")
  ```
- Line 29: child
  ```
  rm(df_children)
  ```
- Line 41: city
  ```
  table_temp <- run.reg.emp.con(df_reg[ethnicity == 0])
  ```
- Line 48: city
  ```
  table_temp <- run.reg.emp.con(df_reg[ethnicity == 1])
  ```
- Line 68: sex
  ```
  table_temp <- run.reg.emp.con(df_reg[sex == 0])
  ```
- Line 75: sex
  ```
  table_temp <- run.reg.emp.con(df_reg[sex == 1])
  ```
- Line 87: city
  ```
  table_temp <- run.reg.emp.con.event(df_reg[ethnicity == 0])
  ```
- Line 93: city
  ```
  table_temp <- run.reg.emp.con.event(df_reg[ethnicity == 1])
  ```
- Line 113: sex
  ```
  table_temp <- run.reg.emp.con.event(df_reg[sex == 0])
  ```
- Line 119: sex
  ```
  table_temp <- run.reg.emp.con.event(df_reg[sex == 1])
  ```
- Line 130: name
  ```
  filename <- paste0(data, "reg_emp_con_1927.Rdata")
  ```
- Line 133: name
  ```
  file = filename)
  ```
- Line 138: name
  ```
  filename <- paste0(data, "reg_emp_con_1927.Rdata")
  ```
- Line 139: name
  ```
  load(filename)
  ```
- Line 142: child, name
  ```
  filename <- paste0(data, "children_sample_1927.Rdata")
  ```
- Line 143: name
  ```
  load(filename)
  ```
- Line 144: child
  ```
  df_children <- df
  ```
- Line 147: child
  ```
  stat1 <- get.statistics(df_children,"connections_type_1927.Rdata")
  ```
- Line 148: child, city
  ```
  stat2 <- get.statistics(df_children[ethnicity == 0],"connections_type_1927.Rdata")
  ```
- Line 149: child, city
  ```
  stat3 <- get.statistics(df_children[ethnicity == 1],"connections_type_1927.Rdata")
  ```
- Line 150: child
  ```
  stat4 <- get.statistics(df_children[ education == 0],"connections_type_1927.Rdata")
  ```
- Line 151: child
  ```
  stat5 <- get.statistics(df_children[ education == 1],"connections_type_1927.Rdata")
  ```
- Line 152: child, sex
  ```
  stat6 <- get.statistics(df_children[ sex == 0],"connections_type_1927.Rdata")
  ```
- Line 153: child, sex
  ```
  stat7 <- get.statistics(df_children[ sex == 1],"connections_type_1927.Rdata")
  ```
- Line 178: name
  ```
  #filename <- paste0(output, "table_reg_emp_con_1927.csv")
  ```
- Line 179: name
  ```
  #write.csv(table,filename)
  ```
- Line 202: name
  ```
  filename <- paste0(output, "figure_reg_emp_con_event_1927.csv")
  ```
- Line 203: name
  ```
  write.csv(table,filename)
  ```

**/replication-package/labor_networks/code/inter/tables_reg_emp_con_1927_entry_age.R**

- Line 3: name
  ```
  filename <- paste0(log, "reg_emp_con_1927_entry_age_",today,".txt")
  ```
- Line 4: name
  ```
  sink(file = filename,split = TRUE)
  ```
- Line 23: child
  ```
  # load the children sample
  ```
- Line 24: child, name
  ```
  filename <- paste0(data, "children_sample_1927.Rdata")
  ```
- Line 25: name
  ```
  load(filename)
  ```
- Line 26: birth, child
  ```
  df_children <- df[year - birth_year == a]
  ```
- Line 29: child
  ```
  #take 20% of children
  ```
- Line 30: child
  ```
  df_children = cbind(df_children,data.table(runif(dim(df_children)[1])))
  ```
- Line 31: child
  ```
  df_children <- df_children[V1 < 0.2 ]
  ```
- Line 32: child
  ```
  df_children[,V1 := NULL]
  ```
- Line 34: child
  ```
  df_reg <- get.reg.emp.con.data(df_children,"connections_type_1927.Rdata")
  ```
- Line 35: child
  ```
  rm(df_children)
  ```
- Line 47: city
  ```
  table_temp <- run.reg.emp.con(df_reg[ethnicity == 0])
  ```
- Line 54: city
  ```
  table_temp <- run.reg.emp.con(df_reg[ethnicity == 1])
  ```
- Line 60: sex
  ```
  table_temp <- run.reg.emp.con(df_reg[sex == 0])
  ```
- Line 67: sex
  ```
  table_temp <- run.reg.emp.con(df_reg[sex == 1])
  ```
- Line 79: city
  ```
  table_temp <- run.reg.emp.con.event(df_reg[ethnicity == 0])
  ```
- Line 85: city
  ```
  table_temp <- run.reg.emp.con.event(df_reg[ethnicity == 1])
  ```
- Line 92: sex
  ```
  table_temp <- run.reg.emp.con.event(df_reg[sex == 0])
  ```
- Line 98: sex
  ```
  table_temp <- run.reg.emp.con.event(df_reg[sex == 1])
  ```
- Line 109: name
  ```
  filename <- paste0(data, "reg_emp_con_1927_entry_age_",a,".Rdata")
  ```
- Line 112: name
  ```
  file = filename)
  ```
- Line 121: name
  ```
  filename <- paste0(data, "reg_emp_con_1927_entry_age_",a,".Rdata")
  ```
- Line 122: name
  ```
  load(filename)
  ```
- Line 125: child, name
  ```
  filename <- paste0(data, "children_sample_1927.Rdata")
  ```
- Line 126: name
  ```
  load(filename)
  ```
- Line 127: birth, child
  ```
  df_children <- df[year - birth_year == a]
  ```
- Line 130: child
  ```
  stat1 <- get.statistics(df_children,"connections_type_1927.Rdata")
  ```
- Line 131: child, city
  ```
  stat2 <- get.statistics(df_children[ethnicity == 0],"connections_type_1927.Rdata")
  ```
- Line 132: child, city
  ```
  stat3 <- get.statistics(df_children[ethnicity == 1],"connections_type_1927.Rdata")
  ```
- Line 133: child, sex
  ```
  stat6 <- get.statistics(df_children[ sex == 0],"connections_type_1927.Rdata")
  ```
- Line 134: child, sex
  ```
  stat7 <- get.statistics(df_children[ sex == 1],"connections_type_1927.Rdata")
  ```
- Line 180: name
  ```
  filename <- paste0(output, "table_reg_emp_con_1927_entry_age.csv")
  ```
- Line 181: name
  ```
  write.csv(table_static,filename)
  ```
- Line 184: name
  ```
  #filename <- paste0(output, "figure_reg_emp_con_event_1927_entry_age.csv")
  ```
- Line 185: name
  ```
  #write.csv(table_event,filename)
  ```

**/replication-package/labor_networks/code/inter/tables_reg_emp_con_25.R**

- Line 3: name
  ```
  filename <- paste0(log, "reg_emp_con_25 _",today,".txt")
  ```
- Line 4: name
  ```
  sink(file = filename,split = TRUE)
  ```
- Line 14: child
  ```
  #take 20% of children
  ```
- Line 18: child
  ```
  # load the children sample
  ```
- Line 19: child, name
  ```
  filename <- paste0(data, "children_sample_25.Rdata")
  ```
- Line 20: name
  ```
  load(filename)
  ```
- Line 21: child
  ```
  df_children <- df
  ```
- Line 24: child
  ```
  df_children = cbind(df_children,data.table(runif(dim(df_children)[1])))
  ```
- Line 25: child
  ```
  df_children <- df_children[V1 < 0.2 ]
  ```
- Line 26: child
  ```
  df_children[,V1 := NULL]
  ```
- Line 28: child
  ```
  df_reg <- get.reg.emp.con.data(df_children,"connections_type_25.Rdata")
  ```
- Line 29: child
  ```
  rm(df_children)
  ```
- Line 41: city
  ```
  table_temp <- run.reg.emp.con(df_reg[ethnicity == 0])
  ```
- Line 48: city
  ```
  table_temp <- run.reg.emp.con(df_reg[ethnicity == 1])
  ```
- Line 68: sex
  ```
  table_temp <- run.reg.emp.con(df_reg[sex == 0])
  ```
- Line 75: sex
  ```
  table_temp <- run.reg.emp.con(df_reg[sex == 1])
  ```
- Line 87: city
  ```
  table_temp <- run.reg.emp.con.event(df_reg[ethnicity == 0])
  ```
- Line 93: city
  ```
  table_temp <- run.reg.emp.con.event(df_reg[ethnicity == 1])
  ```
- Line 113: sex
  ```
  table_temp <- run.reg.emp.con.event(df_reg[sex == 0])
  ```
- Line 119: sex
  ```
  table_temp <- run.reg.emp.con.event(df_reg[sex == 1])
  ```
- Line 130: name
  ```
  filename <- paste0(data, "reg_emp_con_25.Rdata")
  ```
- Line 133: name
  ```
  file = filename)
  ```
- Line 138: name
  ```
  filename <- paste0(data, "reg_emp_con_25.Rdata")
  ```
- Line 139: name
  ```
  load(filename)
  ```
- Line 142: child, name
  ```
  filename <- paste0(data, "children_sample_25.Rdata")
  ```
- Line 143: name
  ```
  load(filename)
  ```
- Line 144: child
  ```
  df_children <- df
  ```
- Line 147: child
  ```
  stat1 <- get.statistics(df_children,"connections_type_25.Rdata")
  ```
- Line 148: child, city
  ```
  stat2 <- get.statistics(df_children[ethnicity == 0],"connections_type_25.Rdata")
  ```
- Line 149: child, city
  ```
  stat3 <- get.statistics(df_children[ethnicity == 1],"connections_type_25.Rdata")
  ```
- Line 150: child
  ```
  stat4 <- get.statistics(df_children[ education == 0],"connections_type_25.Rdata")
  ```
- Line 151: child
  ```
  stat5 <- get.statistics(df_children[ education == 1],"connections_type_25.Rdata")
  ```
- Line 152: child, sex
  ```
  stat6 <- get.statistics(df_children[ sex == 0],"connections_type_25.Rdata")
  ```
- Line 153: child, sex
  ```
  stat7 <- get.statistics(df_children[ sex == 1],"connections_type_25.Rdata")
  ```
- Line 178: name
  ```
  #filename <- paste0(output, "table_reg_emp_con_25.csv")
  ```
- Line 179: name
  ```
  #write.csv(table,filename)
  ```
- Line 202: name
  ```
  filename <- paste0(output, "figure_reg_emp_con_event_25.csv")
  ```
- Line 203: name
  ```
  write.csv(table,filename)
  ```

**/replication-package/labor_networks/code/inter/tables_reg_emp_con_exit.R**

- Line 3: name
  ```
  filename <- paste0(log, "reg_emp_con_exit_",today,".txt")
  ```
- Line 4: name
  ```
  sink(file = filename,split = TRUE)
  ```
- Line 14: child
  ```
  #take 20% of children
  ```
- Line 18: child
  ```
  # load the children sample
  ```
- Line 19: child, name
  ```
  filename <- paste0(data, "children_sample.Rdata")
  ```
- Line 20: name
  ```
  load(filename)
  ```
- Line 21: child
  ```
  df_children <- df
  ```
- Line 24: child
  ```
  df_children = cbind(df_children,data.table(runif(dim(df_children)[1])))
  ```
- Line 25: child
  ```
  df_children <- df_children[V1 < 0.2 ]
  ```
- Line 26: child
  ```
  df_children[,V1 := NULL]
  ```
- Line 28: child
  ```
  df_reg <- get.reg.emp.con.data.exit(df_children)
  ```
- Line 29: child
  ```
  rm(df_children)
  ```
- Line 58: name
  ```
  filename <- paste0(data, "reg_emp_con_exit.Rdata")
  ```
- Line 59: name
  ```
  save(table1,table2,table3,file = filename)
  ```
- Line 64: name
  ```
  filename <- paste0(data, "reg_emp_con_exit.Rdata")
  ```
- Line 65: name
  ```
  load(filename)
  ```
- Line 69: child, name
  ```
  filename <- paste0(data, "children_sample.Rdata")
  ```
- Line 70: name
  ```
  load(filename)
  ```
- Line 71: child
  ```
  df_children <- df
  ```
- Line 74: child
  ```
  stat <- get.statistics.exit(df_children)
  ```
- Line 104: name
  ```
  filename <- paste0(output, "table_reg_emp_con_exit.csv")
  ```
- Line 105: name
  ```
  write.csv(table,filename)
  ```

**/replication-package/labor_networks/code/inter/tables_reg_emp_con_grad1.R**

- Line 3: name
  ```
  filename <- paste0(log, "reg_emp_con_grad1 _",today,".txt")
  ```
- Line 4: name
  ```
  sink(file = filename,split = TRUE)
  ```
- Line 14: child
  ```
  #take 20% of children
  ```
- Line 18: child
  ```
  # load the children sample
  ```
- Line 19: child, name
  ```
  filename <- paste0(data, "children_sample_grad1.Rdata")
  ```
- Line 20: name
  ```
  load(filename)
  ```
- Line 21: child
  ```
  df_children <- df
  ```
- Line 24: child
  ```
  df_children = cbind(df_children,data.table(runif(dim(df_children)[1])))
  ```
- Line 25: child
  ```
  df_children <- df_children[V1 < 0.2 ]
  ```
- Line 26: child
  ```
  df_children[,V1 := NULL]
  ```
- Line 28: child
  ```
  df_reg <- get.reg.emp.con.data(df_children,"connections_type_grad1.Rdata")
  ```
- Line 29: child
  ```
  rm(df_children)
  ```
- Line 41: city
  ```
  table_temp <- run.reg.emp.con(df_reg[ethnicity == 0])
  ```
- Line 48: city
  ```
  table_temp <- run.reg.emp.con(df_reg[ethnicity == 1])
  ```
- Line 68: sex
  ```
  table_temp <- run.reg.emp.con(df_reg[sex == 0])
  ```
- Line 75: sex
  ```
  table_temp <- run.reg.emp.con(df_reg[sex == 1])
  ```
- Line 87: city
  ```
  table_temp <- run.reg.emp.con.event(df_reg[ethnicity == 0])
  ```
- Line 93: city
  ```
  table_temp <- run.reg.emp.con.event(df_reg[ethnicity == 1])
  ```
- Line 113: sex
  ```
  table_temp <- run.reg.emp.con.event(df_reg[sex == 0])
  ```
- Line 119: sex
  ```
  table_temp <- run.reg.emp.con.event(df_reg[sex == 1])
  ```
- Line 130: name
  ```
  filename <- paste0(data, "reg_emp_con_grad1.Rdata")
  ```
- Line 133: name
  ```
  file = filename)
  ```
- Line 138: name
  ```
  filename <- paste0(data, "reg_emp_con_grad1.Rdata")
  ```
- Line 139: name
  ```
  load(filename)
  ```
- Line 142: child, name
  ```
  filename <- paste0(data, "children_sample_grad1.Rdata")
  ```
- Line 143: name
  ```
  load(filename)
  ```
- Line 144: child
  ```
  df_children <- df
  ```
- Line 147: child
  ```
  stat1 <- get.statistics(df_children,"connections_type_grad1.Rdata")
  ```
- Line 148: child, city
  ```
  stat2 <- get.statistics(df_children[ethnicity == 0],"connections_type_grad1.Rdata")
  ```
- Line 149: child, city
  ```
  stat3 <- get.statistics(df_children[ethnicity == 1],"connections_type_grad1.Rdata")
  ```
- Line 150: child
  ```
  stat4 <- get.statistics(df_children[ education == 0],"connections_type_grad1.Rdata")
  ```
- Line 151: child
  ```
  stat5 <- get.statistics(df_children[ education == 1],"connections_type_grad1.Rdata")
  ```
- Line 152: child, sex
  ```
  stat6 <- get.statistics(df_children[ sex == 0],"connections_type_grad1.Rdata")
  ```
- Line 153: child, sex
  ```
  stat7 <- get.statistics(df_children[ sex == 1],"connections_type_grad1.Rdata")
  ```
- Line 178: name
  ```
  #filename <- paste0(output, "table_reg_emp_con_grad1.csv")
  ```
- Line 179: name
  ```
  #write.csv(table,filename)
  ```
- Line 202: name
  ```
  filename <- paste0(output, "figure_reg_emp_con_event_grad1.csv")
  ```
- Line 203: name
  ```
  write.csv(table,filename)
  ```

**/replication-package/labor_networks/code/inter/tables_reg_emp_con_long_figure.R**

- Line 3: lon, name
  ```
  filename <- paste0(log, "reg_emp_con_long_figure_", today, ".txt")
  ```
- Line 4: name
  ```
  sink(file = filename, split = TRUE)
  ```
- Line 6: lon
  ```
  source(paste0(process, "functions_reg_emp_con_long_figure.R"))
  ```
- Line 15: child, sex
  ```
  bin_vars2 = c("duration_past", "lag_past", "sex_child", "sex_parent", "sex_pco",
  ```
- Line 16: child, city, sex
  ```
  "ethnicity_child", "ethnicity_pco", "education_child", "same_sex_child_parent",
  ```
- Line 17: child, city, sex
  ```
  "same_sex_child_pco", "same_ethnicity_child_pco")
  ```
- Line 25: child
  ```
  # take 20% of children
  ```
- Line 29: child
  ```
  # load the children sample
  ```
- Line 30: child, name
  ```
  filename <- paste0(data, "children_sample.Rdata")
  ```
- Line 31: name
  ```
  load(filename)
  ```
- Line 32: child
  ```
  df_children <- df
  ```
- Line 35: child
  ```
  df_children = cbind(df_children, data.table(runif(dim(df_children)[1])))
  ```
- Line 36: child
  ```
  df_children <- df_children[V1 < 0.2]
  ```
- Line 37: child
  ```
  df_children[, V1 := NULL]
  ```
- Line 39: child, lon
  ```
  list1 <- get.reg.emp.con.data.long.figure(df_children)
  ```
- Line 40: child
  ```
  rm(df_children)
  ```
- Line 45: lon
  ```
  table_temp <- run.reg.emp.con.long.figure(df_reg = list1[[1]], df_connections_long = list1[[2]], bin
  ```
- Line 52: lon, name
  ```
  filename <- paste0(data, "reg_emp_con_long_figure1.Rdata")
  ```
- Line 53: name
  ```
  save(table1, file = filename)
  ```
- Line 58: lon
  ```
  table_temp <- run.reg.emp.con.long.figure(df_reg = list1[[1]], df_connections_long = list1[[2]], bin
  ```
- Line 65: lon, name
  ```
  filename <- paste0(data, "reg_emp_con_long_figure2.Rdata")
  ```
- Line 66: name
  ```
  save(table2, file = filename)
  ```
- Line 69: lon, name
  ```
  filename <- paste0(data, "reg_emp_con_long_figure1.Rdata")
  ```
- Line 70: name
  ```
  load(filename)
  ```
- Line 72: lon
  ```
  table_l <- prepare.reg.emp.con.table.long.figure(table1[[l]], bin_vars1[l], labs = 1:10)
  ```
- Line 76: lon
  ```
  write.csv(table, paste0(output, "figure_reg_emp_con_long1.csv"))
  ```
- Line 78: lon, name
  ```
  filename <- paste0(data, "reg_emp_con_long_figure2.Rdata")
  ```
- Line 79: name
  ```
  load(filename)
  ```
- Line 80: lon
  ```
  table <- prepare.reg.emp.con.table.long.figure(table2[[1]], bin_vars2[1], labs = 1:10)
  ```
- Line 82: lon
  ```
  write.csv(table, paste0(output, "figure_reg_emp_con_long2.csv"))
  ```
- Line 85: lon
  ```
  table <- prepare.reg.emp.con.table.long.figure(table2[[2]], bin_vars2[2], labs = 1:nbins3)
  ```
- Line 87: lon
  ```
  write.csv(table, paste0(output, "figure_reg_emp_con_long3.csv"))
  ```
- Line 91: lon
  ```
  table_l <- prepare.reg.emp.con.table.long.figure(table_rest[[l]], bin_vars2[2 + l], labs = 0:1)
  ```
- Line 95: lon
  ```
  write.csv(table, paste0(output, "figure_reg_emp_con_long4.csv"))
  ```

**/replication-package/labor_networks/code/inter/tables_reg_emp_con_long_firm.R**

- Line 3: lon, name
  ```
  filename <- paste0(log, "reg_emp_con_long_firm_",today,".txt")
  ```
- Line 4: name
  ```
  sink(file = filename,split = TRUE)
  ```
- Line 6: lon
  ```
  source(paste0(process, "functions_reg_emp_con_long.R"))
  ```
- Line 18: child
  ```
  #take 10% of children
  ```
- Line 22: child
  ```
  # load the children sample
  ```
- Line 23: child, name
  ```
  filename <- paste0(data, "children_sample.Rdata")
  ```
- Line 24: name
  ```
  load(filename)
  ```
- Line 25: child
  ```
  df_children <- df
  ```
- Line 29: child
  ```
  df_children = cbind(df_children,data.table(runif(dim(df_children)[1])))
  ```
- Line 30: child
  ```
  df_children <- df_children[V1 < 0.1 ]
  ```
- Line 31: child
  ```
  df_children[,V1 := NULL]
  ```
- Line 33: child
  ```
  list1 <- get.reg.emp.con.data.firm(df_children)
  ```
- Line 36: lon
  ```
  df_connections_long_firm = list1[[2]]
  ```
- Line 43: lon
  ```
  table_temp <- run.reg.emp.con.long.figure(df_reg = df_reg_firm ,df_connections_long = df_connections
  ```
- Line 45: lon
  ```
  table_temp <- run.reg.emp.con.long.figure(df_reg = df_reg_firm ,df_connections_long = df_connections
  ```
- Line 47: lon
  ```
  df_connections_long_firm[,bin_var := NULL]
  ```
- Line 48: lon
  ```
  df_connections_long_firm[,bin := NULL]
  ```
- Line 59: lon, name
  ```
  filename <- paste0(data, "reg_emp_con_long_firm.Rdata")
  ```
- Line 60: name
  ```
  save(table,file = filename)
  ```
- Line 67: lon, name
  ```
  filename <- paste0(data, "reg_emp_con_long_firm.Rdata")
  ```
- Line 68: name
  ```
  load(filename)
  ```
- Line 73: lon
  ```
  table_k <- prepare.reg.emp.con.table.long.figure(table[[k]],bin_vars[k]		)
  ```
- Line 82: lon, name
  ```
  filename <- paste0(output, "figure_reg_emp_con_long_firm.csv")
  ```
- Line 83: name
  ```
  fwrite(table1,filename)
  ```

**/replication-package/labor_networks/code/inter/tables_reg_emp_con_long_sector_sex.R**

- Line 3: lon, name, sex
  ```
  filename <- paste0(log, "reg_emp_con_long_sector_sex_",today,".txt")
  ```
- Line 4: name
  ```
  sink(file = filename,split = TRUE)
  ```
- Line 6: lon
  ```
  source(paste0(process, "functions_reg_emp_con_long.R"))
  ```
- Line 17: child
  ```
  #take 10% of children
  ```
- Line 21: child
  ```
  # load the children sample
  ```
- Line 22: child, name
  ```
  filename <- paste0(data, "children_sample.Rdata")
  ```
- Line 23: name
  ```
  load(filename)
  ```
- Line 24: child
  ```
  df_children <- df
  ```
- Line 28: child
  ```
  df_children = cbind(df_children,data.table(runif(dim(df_children)[1])))
  ```
- Line 29: child
  ```
  df_children <- df_children[V1 < 0.1 ]
  ```
- Line 30: child
  ```
  df_children[,V1 := NULL]
  ```
- Line 32: child
  ```
  list1 <- get.reg.emp.con.data.firm(df_children)
  ```
- Line 35: lon
  ```
  df_connections_long_firm = list1[[2]]
  ```
- Line 36: child, lon, sex
  ```
  df_connections_long_firm = merge(df_connections_long_firm,df_children[,.(id,sex)], by = "id")
  ```
- Line 37: lon, sex
  ```
  df_connections_long_firm[,main_sector_sex := main_sector + sex*10]
  ```
- Line 40: sex
  ```
  bin_var = "main_sector_sex"
  ```
- Line 42: lon
  ```
  table_temp <- run.reg.emp.con.long.figure(df_reg = df_reg_firm ,df_connections_long = df_connections
  ```
- Line 44: lon
  ```
  df_connections_long_firm[,bin_var := NULL]
  ```
- Line 45: lon
  ```
  df_connections_long_firm[,bin := NULL]
  ```
- Line 55: lon, name, sex
  ```
  filename <- paste0(data, "reg_emp_con_long_sector_sex.Rdata")
  ```
- Line 56: name
  ```
  save(table,file = filename)
  ```
- Line 63: lon, name, sex
  ```
  filename <- paste0(data, "reg_emp_con_long_sector_sex.Rdata")
  ```
- Line 64: name
  ```
  load(filename)
  ```
- Line 67: lon
  ```
  table1 <- prepare.reg.emp.con.table.long.figure(table,bin_var = bin_var		)
  ```
- Line 71: sex
  ```
  table2 <- prepare.table.sex_sector(table	)
  ```
- Line 77: lon, name, sex
  ```
  filename <- paste0(output, "figure_reg_emp_con_long_sector_sex.csv")
  ```
- Line 78: name
  ```
  fwrite(table,filename)
  ```

**/replication-package/labor_networks/code/inter/tables_reg_emp_con_long_year.R**

- Line 3: lon, name
  ```
  filename <- paste0(log, "reg_emp_con_long_figure_year_",today,".txt")
  ```
- Line 4: name
  ```
  sink(file = filename,split = TRUE)
  ```
- Line 5: lon
  ```
  source(paste0(process, "functions_reg_emp_con_long.R"))
  ```
- Line 13: child
  ```
  #take 20% of children
  ```
- Line 17: child
  ```
  # load the children sample
  ```
- Line 18: child, name
  ```
  filename <- paste0(data, "children_sample.Rdata")
  ```
- Line 19: name
  ```
  load(filename)
  ```
- Line 20: child
  ```
  df_children <- df
  ```
- Line 23: child
  ```
  df_children = cbind(df_children,data.table(runif(dim(df_children)[1])))
  ```
- Line 24: child
  ```
  df_children <- df_children[V1 < 0.2 ]
  ```
- Line 25: child
  ```
  df_children[,V1 := NULL]
  ```
- Line 27: child, lon
  ```
  list1 <- get.reg.emp.con.data.long.figure(df_children)
  ```
- Line 29: child, lon
  ```
  # bring the child's year into the long-connections table (no get.firm.vars needed for year)
  ```
- Line 30: child, lon
  ```
  df_connections_long_firm <- merge(list1[[2]], df_children[,.(id,year)], by = "id")
  ```
- Line 31: child
  ```
  rm(df_children)
  ```
- Line 36: lon
  ```
  table_temp <- run.reg.emp.con.long.figure(df_reg = list1[[1]] ,df_connections_long = df_connections_
  ```
- Line 37: lon
  ```
  df_connections_long_firm[,bin_var := NULL]
  ```
- Line 38: lon
  ```
  df_connections_long_firm[,bin := NULL]
  ```
- Line 48: lon, name
  ```
  filename <- paste0(data, "reg_emp_con_long_year.Rdata")
  ```
- Line 49: name
  ```
  save(table,file = filename)
  ```
- Line 53: lon, name
  ```
  filename <- paste0(data, "reg_emp_con_long_year.Rdata")
  ```
- Line 54: name
  ```
  load(filename)
  ```
- Line 56: lon
  ```
  melt.long.figure <- function(tab, bv) {
  ```
- Line 86: lon
  ```
  table_l <- melt.long.figure(table[[l]], bin_vars[[l]])
  ```
- Line 95: lon, name
  ```
  filename <- paste0(output, "figure_reg_emp_con_long_year.csv")
  ```
- Line 96: name
  ```
  fwrite(table_out, filename)
  ```

**/replication-package/labor_networks/code/inter/tables_reg_emp_con_multiple2.R**

- Line 3: name
  ```
  filename <- paste0(log, "reg_emp_con_",today,".txt")
  ```
- Line 4: name
  ```
  sink(file = filename,split = TRUE)
  ```
- Line 14: child
  ```
  #take 20% of children
  ```
- Line 18: child
  ```
  # load the children sample
  ```
- Line 19: child, name
  ```
  filename <- paste0(data, "children_sample.Rdata")
  ```
- Line 20: name
  ```
  load(filename)
  ```
- Line 21: child
  ```
  df_children <- df
  ```
- Line 24: child
  ```
  df_children = cbind(df_children,data.table(runif(dim(df_children)[1])))
  ```
- Line 25: child
  ```
  df_children <- df_children[V1 < 0.2 ]
  ```
- Line 26: child
  ```
  df_children[,V1 := NULL]
  ```
- Line 28: child
  ```
  df_reg <- get.reg.emp.con.data.multiple2(df_children)
  ```
- Line 29: child
  ```
  rm(df_children)
  ```
- Line 42: city
  ```
  table_temp <- run.reg.emp.con.multiple2(df_reg[ethnicity == 0])
  ```
- Line 49: city
  ```
  table_temp <- run.reg.emp.con.multiple2(df_reg[ethnicity == 1])
  ```
- Line 69: sex
  ```
  table_temp <- run.reg.emp.con.multiple2(df_reg[sex == 0])
  ```
- Line 76: sex
  ```
  table_temp <- run.reg.emp.con.multiple2(df_reg[sex == 1])
  ```
- Line 85: name
  ```
  filename <- paste0(data, "reg_emp_con_multiple2.Rdata")
  ```
- Line 87: name
  ```
  file = filename)
  ```
- Line 92: name
  ```
  filename <- paste0(data, "reg_emp_con_multiple2.Rdata")
  ```
- Line 93: name
  ```
  load(filename)
  ```
- Line 96: child, name
  ```
  filename <- paste0(data, "children_sample.Rdata")
  ```
- Line 97: name
  ```
  load(filename)
  ```
- Line 98: child
  ```
  df_children <- df
  ```
- Line 101: child
  ```
  stat1 <- get.statistics(df_children)
  ```
- Line 102: child, city
  ```
  stat2 <- get.statistics(df_children[ethnicity == 0])
  ```
- Line 103: child, city
  ```
  stat3 <- get.statistics(df_children[ethnicity == 1])
  ```
- Line 104: child
  ```
  stat4 <- get.statistics(df_children[ education == 0])
  ```
- Line 105: child
  ```
  stat5 <- get.statistics(df_children[ education == 1])
  ```
- Line 106: child, sex
  ```
  stat6 <- get.statistics(df_children[ sex == 0])
  ```
- Line 107: child, sex
  ```
  stat7 <- get.statistics(df_children[ sex == 1])
  ```
- Line 133: name
  ```
  filename <- paste0(output, "table_reg_emp_con_multiple2.csv")
  ```
- Line 134: name
  ```
  write.csv(table,filename)
  ```

**/replication-package/labor_networks/code/inter/tables_reg_emp_con_multiple2_firm_size.R**

- Line 3: name
  ```
  filename <- paste0(log, "reg_emp_con_multiple2_firm_size",today,".txt")
  ```
- Line 4: name
  ```
  sink(file = filename,split = TRUE)
  ```
- Line 14: child
  ```
  #take 20% of children
  ```
- Line 18: child
  ```
  # load the children sample
  ```
- Line 19: child, name
  ```
  filename <- paste0(data, "children_sample.Rdata")
  ```
- Line 20: name
  ```
  load(filename)
  ```
- Line 21: child
  ```
  df_children <- df
  ```
- Line 24: child
  ```
  df_children = cbind(df_children,data.table(runif(dim(df_children)[1])))
  ```
- Line 25: child
  ```
  df_children <- df_children[V1 < 0.2 ]
  ```
- Line 26: child
  ```
  df_children[,V1 := NULL]
  ```
- Line 34: child
  ```
  df_reg <- get.reg.emp.con.data.multiple2.firm.size(df_children,min_size = 0, max_size = log(500),typ
  ```
- Line 41: child
  ```
  df_reg <- get.reg.emp.con.data.multiple2.firm.size(df_children,min_size = 0, max_size = log(200),typ
  ```
- Line 50: child
  ```
  df_reg <- get.reg.emp.con.data.multiple2.firm.size(df_children,min_size = log(200), max_size = log(5
  ```
- Line 58: child
  ```
  df_reg <- get.reg.emp.con.data.multiple2.firm.size(df_children,min_size = 0, max_size = log(200),typ
  ```
- Line 67: child
  ```
  df_reg <- get.reg.emp.con.data.multiple2.firm.size(df_children,min_size = log(200), max_size = log(5
  ```
- Line 75: name
  ```
  filename <- paste0(data, "reg_emp_con_multiple2_firm_size.Rdata")
  ```
- Line 77: name
  ```
  file = filename)
  ```
- Line 82: name
  ```
  filename <- paste0(data, "reg_emp_con_multiple2_firm_size.Rdata")
  ```
- Line 83: name
  ```
  load(filename)
  ```
- Line 86: child, name
  ```
  filename <- paste0(data, "children_sample.Rdata")
  ```
- Line 87: name
  ```
  load(filename)
  ```
- Line 88: child
  ```
  df_children <- df
  ```
- Line 91: child
  ```
  stat1 <- get.statistics.size(df_children,min_size = 0, max_size = log(500),type = "past")
  ```
- Line 92: child
  ```
  stat2 <- get.statistics.size(df_children,min_size = 0, max_size = log(200),type = "past")
  ```
- Line 93: child
  ```
  stat3 <- get.statistics.size(df_children,min_size = log(200), max_size = log(500),type = "past")
  ```
- Line 94: child
  ```
  stat4 <- get.statistics.size(df_children,min_size = 0, max_size = log(200),type = "current")
  ```
- Line 95: child
  ```
  stat5 <- get.statistics.size(df_children,min_size = log(200), max_size = log(500),type = "current")
  ```
- Line 117: name
  ```
  filename <- paste0(output, "table_reg_emp_con_multiple2_firm_size.csv")
  ```
- Line 118: name
  ```
  write.csv(table,filename)
  ```

**/replication-package/labor_networks/code/inter/tables_reg_emp_con_multiple_jobs.R**

- Line 3: name
  ```
  filename <- paste0(log, "reg_emp_con_",today,".txt")
  ```
- Line 4: name
  ```
  sink(file = filename,split = TRUE)
  ```
- Line 14: child
  ```
  #take 20% of children
  ```
- Line 18: child
  ```
  # load the children sample
  ```
- Line 19: child, name
  ```
  filename <- paste0(data, "children_sample.Rdata")
  ```
- Line 20: name
  ```
  load(filename)
  ```
- Line 21: child
  ```
  df_children <- df
  ```
- Line 25: child
  ```
  df_jobs = df_children[,.(jobs = .N), by = .(id_firm, year)]
  ```
- Line 27: child
  ```
  # keep 20% of children
  ```
- Line 28: child
  ```
  df_children = cbind(df_children,data.table(runif(dim(df_children)[1])))
  ```
- Line 29: child
  ```
  df_children <- df_children[V1 < 0.2]
  ```
- Line 30: child
  ```
  df_children[,V1 := NULL]
  ```
- Line 33: child
  ```
  # keep children working in a firm with more than one job per year
  ```
- Line 34: child
  ```
  df_children = merge(df_children,df_jobs, by = c("id_firm", "year"))
  ```
- Line 35: child
  ```
  df_children = df_children[jobs > 1]
  ```
- Line 36: child
  ```
  df_children[,jobs := NULL]
  ```
- Line 39: child
  ```
  df_reg <- get.reg.emp.con.data(df_children)
  ```
- Line 40: child
  ```
  rm(df_children,df_jobs)
  ```
- Line 65: name
  ```
  filename <- paste0(data, "reg_emp_con_multiple_jobs.Rdata")
  ```
- Line 68: name
  ```
  file = filename)
  ```
- Line 73: name
  ```
  filename <- paste0(data, "reg_emp_con_multiple_jobs.Rdata")
  ```
- Line 74: name
  ```
  load(filename)
  ```
- Line 77: child, name
  ```
  filename <- paste0(data, "children_sample.Rdata")
  ```
- Line 78: name
  ```
  load(filename)
  ```
- Line 79: child
  ```
  df_children <- df
  ```
- Line 82: child
  ```
  # drop children working in a firm with more than one job per year
  ```
- Line 83: child
  ```
  df_jobs = df_children[,.(jobs = .N), by = .(id_firm, year)]
  ```
- Line 84: child
  ```
  df_children = merge(df_children,df_jobs, by = c("id_firm", "year"))
  ```
- Line 85: child
  ```
  df_children = df_children[jobs == 1]
  ```
- Line 86: child
  ```
  df_children[,jobs := NULL]
  ```
- Line 91: child
  ```
  stat1 <- get.statistics(df_children)
  ```
- Line 107: name
  ```
  #filename <- paste0(output, "table_reg_emp_con_multiple_jobs.csv")
  ```
- Line 108: name
  ```
  #write.csv(table,filename)
  ```
- Line 120: name
  ```
  filename <- paste0(output, "figure_reg_emp_con_event_multiple_jobs.csv")
  ```
- Line 121: name
  ```
  write.csv(table,filename)
  ```

**/replication-package/labor_networks/code/inter/tables_reg_emp_con_one_job.R**

- Line 3: name
  ```
  filename <- paste0(log, "reg_emp_con_",today,".txt")
  ```
- Line 4: name
  ```
  sink(file = filename,split = TRUE)
  ```
- Line 14: child
  ```
  #take 20% of children
  ```
- Line 18: child
  ```
  # load the children sample
  ```
- Line 19: child, name
  ```
  filename <- paste0(data, "children_sample.Rdata")
  ```
- Line 20: name
  ```
  load(filename)
  ```
- Line 21: child
  ```
  df_children <- df
  ```
- Line 25: child
  ```
  df_jobs = df_children[,.(jobs = .N), by = .(id_firm, year)]
  ```
- Line 27: child
  ```
  # keep 20% of children
  ```
- Line 28: child
  ```
  df_children = cbind(df_children,data.table(runif(dim(df_children)[1])))
  ```
- Line 29: child
  ```
  df_children <- df_children[V1 < 0.2]
  ```
- Line 30: child
  ```
  df_children[,V1 := NULL]
  ```
- Line 33: child
  ```
  # drop children working in a firm with more than one job per year
  ```
- Line 34: child
  ```
  df_children = merge(df_children,df_jobs, by = c("id_firm", "year"))
  ```
- Line 35: child
  ```
  df_children = df_children[jobs == 1]
  ```
- Line 36: child
  ```
  df_children[,jobs := NULL]
  ```
- Line 39: child
  ```
  df_reg <- get.reg.emp.con.data(df_children)
  ```
- Line 40: child
  ```
  rm(df_children,df_jobs)
  ```
- Line 52: city
  ```
  table_temp <- run.reg.emp.con(df_reg[ethnicity == 0])
  ```
- Line 59: city
  ```
  table_temp <- run.reg.emp.con(df_reg[ethnicity == 1])
  ```
- Line 79: sex
  ```
  table_temp <- run.reg.emp.con(df_reg[sex == 0])
  ```
- Line 86: sex
  ```
  table_temp <- run.reg.emp.con(df_reg[sex == 1])
  ```
- Line 98: city
  ```
  table_temp <- run.reg.emp.con.event(df_reg[ethnicity == 0])
  ```
- Line 104: city
  ```
  table_temp <- run.reg.emp.con.event(df_reg[ethnicity == 1])
  ```
- Line 124: sex
  ```
  table_temp <- run.reg.emp.con.event(df_reg[sex == 0])
  ```
- Line 130: sex
  ```
  table_temp <- run.reg.emp.con.event(df_reg[sex == 1])
  ```
- Line 141: name
  ```
  filename <- paste0(data, "reg_emp_con_one_job.Rdata")
  ```
- Line 144: name
  ```
  file = filename)
  ```
- Line 149: name
  ```
  filename <- paste0(data, "reg_emp_con_one_job.Rdata")
  ```
- Line 150: name
  ```
  load(filename)
  ```
- Line 153: child, name
  ```
  filename <- paste0(data, "children_sample.Rdata")
  ```
- Line 154: name
  ```
  load(filename)
  ```
- Line 155: child
  ```
  df_children <- df
  ```
- Line 158: child
  ```
  # drop children working in a firm with more than one job per year
  ```
- Line 159: child
  ```
  df_jobs = df_children[,.(jobs = .N), by = .(id_firm, year)]
  ```
- Line 160: child
  ```
  df_children = merge(df_children,df_jobs, by = c("id_firm", "year"))
  ```
- Line 161: child
  ```
  df_children = df_children[jobs == 1]
  ```
- Line 162: child
  ```
  df_children[,jobs := NULL]
  ```
- Line 167: child
  ```
  stat1 <- get.statistics(df_children)
  ```
- Line 168: child, city
  ```
  stat2 <- get.statistics(df_children[ethnicity == 0])
  ```
- Line 169: child, city
  ```
  stat3 <- get.statistics(df_children[ethnicity == 1])
  ```
- Line 170: child
  ```
  stat4 <- get.statistics(df_children[ education == 0])
  ```
- Line 171: child
  ```
  stat5 <- get.statistics(df_children[ education == 1])
  ```
- Line 172: child, sex
  ```
  stat6 <- get.statistics(df_children[ sex == 0])
  ```
- Line 173: child, sex
  ```
  stat7 <- get.statistics(df_children[ sex == 1])
  ```
- Line 178: name
  ```
  #filename <- paste0(output, "table_reg_emp_con_one_job.csv")
  ```
- Line 179: name
  ```
  #write.csv(table,filename)
  ```
- Line 202: name
  ```
  filename <- paste0(output, "figure_reg_emp_con_event_one_job.csv")
  ```
- Line 203: name
  ```
  write.csv(table,filename)
  ```

**/replication-package/labor_networks/code/inter/tables_reg_emp_con_placebo.R**

- Line 3: lon, name
  ```
  filename <- paste0(log, "reg_emp_con_long_figure_placebo_",today,".txt")
  ```
- Line 4: name
  ```
  sink(file = filename,split = TRUE)
  ```
- Line 13: child
  ```
  #take 20% of children
  ```
- Line 17: child
  ```
  # load the children sample
  ```
- Line 18: child, name
  ```
  filename <- paste0(data, "children_sample.Rdata")
  ```
- Line 19: name
  ```
  load(filename)
  ```
- Line 20: child
  ```
  df_children <- df
  ```
- Line 23: child
  ```
  df_children = cbind(df_children,data.table(runif(dim(df_children)[1])))
  ```
- Line 24: child
  ```
  df_children <- df_children[V1 < 0.2 ]
  ```
- Line 25: child
  ```
  df_children[,V1 := NULL]
  ```
- Line 27: child
  ```
  df_reg <- get.reg.emp.con.data.placebo(df_children)
  ```
- Line 28: child
  ```
  rm(df_children)
  ```
- Line 40: city
  ```
  table_temp <- run.reg.emp.con(df_reg[ethnicity == 0])
  ```
- Line 47: city
  ```
  table_temp <- run.reg.emp.con(df_reg[ethnicity == 1])
  ```
- Line 67: sex
  ```
  table_temp <- run.reg.emp.con(df_reg[sex == 0])
  ```
- Line 74: sex
  ```
  table_temp <- run.reg.emp.con(df_reg[sex == 1])
  ```
- Line 89: name
  ```
  filename <- paste0(data, "reg_emp_con_placebo.Rdata")
  ```
- Line 90: name
  ```
  save(table1,table2,table3,table4,table5,table6,table7,table8,file = filename)
  ```
- Line 95: name
  ```
  filename <- paste0(data, "reg_emp_con_placebo.Rdata")
  ```
- Line 96: name
  ```
  load(filename)
  ```
- Line 98: child, name
  ```
  filename <- paste0(data, "children_sample.Rdata")
  ```
- Line 99: name
  ```
  load(filename)
  ```
- Line 100: child
  ```
  df_children <- df
  ```
- Line 103: child
  ```
  stat1 <- get.statistics(df_children)
  ```
- Line 104: child, city
  ```
  stat2 <- get.statistics(df_children[ethnicity == 0])
  ```
- Line 105: child, city
  ```
  stat3 <- get.statistics(df_children[ethnicity == 1])
  ```
- Line 106: child
  ```
  stat4 <- get.statistics(df_children[ education == 0])
  ```
- Line 107: child
  ```
  stat5 <- get.statistics(df_children[ education == 1])
  ```
- Line 108: child, sex
  ```
  stat6 <- get.statistics(df_children[ sex == 0])
  ```
- Line 109: child, sex
  ```
  stat7 <- get.statistics(df_children[ sex == 1])
  ```
- Line 133: name
  ```
  filename <- paste0(output, "table_reg_emp_con_placebo.csv")
  ```
- Line 134: name
  ```
  write.csv(table,filename)
  ```
- Line 142: name
  ```
  filename <- paste0(output, "figure_reg_emp_con_placebo_event.csv")
  ```
- Line 143: name
  ```
  write.csv(table,filename)
  ```

**/replication-package/labor_networks/code/inter/tables_reg_panel_total_5years_multiple2.R**

- Line 1: child, name
  ```
  filename <- paste0(data, "children_panel_total_5years_multiple2.Rdata")
  ```
- Line 2: name
  ```
  load(filename)
  ```
- Line 133: name
  ```
  filename  <- paste0(output, "table_reg_salary_subs_5years_multiple2.csv")
  ```
- Line 134: name
  ```
  write.csv(table,filename)
  ```

**/replication-package/labor_networks/code/inter/tables_reg_salary_duration_con_event.R**

- Line 1: child, name
  ```
  filename <- paste0(data, "children_first_job_data.Rdata")
  ```
- Line 2: name
  ```
  load(filename)
  ```
- Line 3: child
  ```
  df_children <- df
  ```
- Line 7: child, city
  ```
  df_children[,group := interaction(factor(year),factor(ethnicity),sep = ":")]
  ```
- Line 8: child
  ```
  df_children[,group := interaction(group,factor(age),sep = ":")]
  ```
- Line 9: child, sex
  ```
  df_children[,group := interaction(group,factor(sex),sep = ":")]
  ```
- Line 10: child
  ```
  df_children[,group := interaction(group,factor(education),sep = ":")]
  ```
- Line 11: child, district
  ```
  df_children[,group := interaction(group,factor(district),sep = ":")]
  ```
- Line 13: child
  ```
  df_children <- df_children[,.(id,id_firm,year,group,salary, duration_first_job,
  ```
- Line 17: child
  ```
  df_children[con_type == 0, max_lag:=0 ]
  ```
- Line 18: child
  ```
  df_children[con_type == 3, max_lag:=0 ]
  ```
- Line 20: child
  ```
  df_children[,con_int := interaction(factor(max_lag),factor(con_type),sep = ":")]
  ```
- Line 22: child
  ```
  df_children[,log_salary := log(salary)]
  ```
- Line 23: child
  ```
  df_children[,log_salary3 := log(salary3)]
  ```
- Line 25: child
  ```
  df_children[,id_firm := factor(id_firm)]
  ```
- Line 53: child
  ```
  est1 <- felm(form1,df_children)
  ```
- Line 54: child
  ```
  x = df_children[!is.na(get(vars[k])),.N, by = "id_firm"]
  ```
- Line 58: child
  ```
  y0 = df_children[con_type == 0,mean(get(vars[k]),na.rm = T),]
  ```
- Line 82: name
  ```
  filename  <- paste0(output, "table_reg_salary_duration_con_event.csv")
  ```
- Line 83: name
  ```
  write.csv(table,filename)
  ```
- Line 84: child
  ```
  rm(table,table1,x,df_children)
  ```

**/replication-package/labor_networks/code/inter/tables_reg_salary_duration_con_multiple2.R**

- Line 1: child, name
  ```
  filename <- paste0(data, "children_first_job_data_multiple2.Rdata")
  ```
- Line 2: name
  ```
  load(filename)
  ```
- Line 3: child
  ```
  df_children <- df
  ```
- Line 7: child, city
  ```
  df_children[,group := interaction(factor(year),factor(ethnicity),sep = ":")]
  ```
- Line 8: child
  ```
  df_children[,group := interaction(group,factor(age),sep = ":")]
  ```
- Line 9: child, sex
  ```
  df_children[,group := interaction(group,factor(sex),sep = ":")]
  ```
- Line 10: child
  ```
  df_children[,group := interaction(group,factor(education),sep = ":")]
  ```
- Line 11: child, district
  ```
  df_children[,group := interaction(group,factor(district),sep = ":")]
  ```
- Line 13: child, city, sex
  ```
  df_children <- df_children[,.(id,id_firm,year,group,ethnicity,sex,education,salary, duration_first_j
  ```
- Line 17: child
  ```
  df_children[,id_firm := factor(id_firm)]
  ```
- Line 20: child
  ```
  df_children[,log_salary := log(salary)]
  ```
- Line 21: child
  ```
  df_children[,log_salary3 := log(salary3)]
  ```
- Line 23: child
  ```
  df_children[,con1 := 1 * (con_type == 1)]
  ```
- Line 24: child
  ```
  df_children[,con2 := 1 * (con_type == 2)]
  ```
- Line 25: child
  ```
  df_children[,con3 := 1 * (con_type == 3)]
  ```
- Line 26: child
  ```
  df_children[,con4 := 1 * (con_type == 4)]
  ```
- Line 27: child
  ```
  df_children[,con5 := 1 * (con_type == 5)]
  ```
- Line 28: child
  ```
  df_children[,con6 := 1 * (con_type == 6)]
  ```
- Line 29: child
  ```
  df_children[,con7 := 1 * (con_type == 7)]
  ```
- Line 30: child
  ```
  df_children[,con8 := 1 * (con_type == 8)]
  ```
- Line 32: child
  ```
  df_children[,con14 := con1 + con4]
  ```
- Line 33: child
  ```
  df_children[,con25 := con2 + con5]
  ```
- Line 34: child
  ```
  df_children[,con36 := con3 + con6]
  ```
- Line 36: child
  ```
  df_children1 = copy(df_children)
  ```
- Line 51: child
  ```
  df_children = copy(df_children1)
  ```
- Line 53: child
  ```
  df_children = df_children
  ```
- Line 58: child, city
  ```
  df_children = df_children[ethnicity == 0]
  ```
- Line 63: child, city
  ```
  df_children = df_children[ethnicity == 1]
  ```
- Line 68: child
  ```
  df_children = df_children[education == 0]
  ```
- Line 73: child
  ```
  df_children = df_children[education == 1]
  ```
- Line 78: child, sex
  ```
  df_children = df_children[sex == 0]
  ```
- Line 83: child, sex
  ```
  df_children = df_children[sex == 1]
  ```
- Line 116: child
  ```
  est1 <- felm(form1,df_children)
  ```
- Line 117: child
  ```
  est2 <- felm(form2,df_children)
  ```
- Line 118: child
  ```
  est3 <- felm(form3,df_children)
  ```
- Line 119: child
  ```
  est4 <- felm(form4,df_children)
  ```
- Line 121: child
  ```
  x = df_children[!is.na(get(vars[k])),.N, by = "id_firm"]
  ```
- Line 125: child
  ```
  y0 = df_children[con_type == 0,mean(get(vars[k]),na.rm = T),]
  ```
- Line 189: name
  ```
  filename  <- paste0(output, "table_reg_salary_duration_con_multiple2.csv")
  ```
- Line 190: name
  ```
  write.csv(table,filename)
  ```
- Line 191: child
  ```
  rm(table,table1,x,df_children)
  ```

**/replication-package/labor_networks/code/inter/tables_retirement.R**

- Line 2: lat
  ```
  # load the population file to get the age of the workers
  ```
- Line 3: lat, name
  ```
  filename <- paste0(data, "population.Rdata")
  ```
- Line 4: name
  ```
  load(filename)
  ```
- Line 5: birth, lat, sex
  ```
  df_population <- df[,.(id,birth_year,sex)]
  ```
- Line 6: birth, lat, sex
  ```
  df_population <- df_population[!(is.na(id) | is.na(birth_year) | is.na(sex))]
  ```
- Line 15: name
  ```
  filename <- paste0(raw, "sachar/sachar_", t, ".dta")
  ```
- Line 16: name
  ```
  df <- read_dta(filename)
  ```
- Line 18: name
  ```
  # rename the variables
  ```
- Line 19: lname, name
  ```
  colnames(df)[colnames(df) == "tz"] <- "id"
  ```
- Line 20: lname, name
  ```
  colnames(df)[colnames(df) == "s_total"] <- "yearly_salary"
  ```
- Line 21: lname, name
  ```
  colnames(df)[colnames(df) == "id_maavid"] <- "id_firm"
  ```
- Line 22: lname, name
  ```
  colnames(df)[colnames(df) == "anaf"] <- "industry"
  ```
- Line 23: lname, name
  ```
  colnames(df)[colnames(df) == "sah_hs01"] <- "month01"
  ```
- Line 24: lname, name
  ```
  colnames(df)[colnames(df) == "sah_hs02"] <- "month02"
  ```
- Line 25: lname, name
  ```
  colnames(df)[colnames(df) == "sah_hs03"] <- "month03"
  ```
- Line 26: lname, name
  ```
  colnames(df)[colnames(df) == "sah_hs04"] <- "month04"
  ```
- Line 27: lname, name
  ```
  colnames(df)[colnames(df) == "sah_hs05"] <- "month05"
  ```
- Line 28: lname, name
  ```
  colnames(df)[colnames(df) == "sah_hs06"] <- "month06"
  ```
- Line 29: lname, name
  ```
  colnames(df)[colnames(df) == "sah_hs07"] <- "month07"
  ```
- Line 30: lname, name
  ```
  colnames(df)[colnames(df) == "sah_hs08"] <- "month08"
  ```
- Line 31: lname, name
  ```
  colnames(df)[colnames(df) == "sah_hs09"] <- "month09"
  ```
- Line 32: lname, name
  ```
  colnames(df)[colnames(df) == "sah_hs10"] <- "month10"
  ```
- Line 33: lname, name
  ```
  colnames(df)[colnames(df) == "sah_hs11"] <- "month11"
  ```
- Line 34: lname, name
  ```
  colnames(df)[colnames(df) == "sah_hs12"] <- "month12"
  ```
- Line 40: lname, name
  ```
  month_cols <- colnames(subset(df,select = month01:month12))
  ```
- Line 63: lat
  ```
  # calculate months of work in a year
  ```
- Line 66: lat
  ```
  # calculate avergae monthly salary
  ```
- Line 74: lat
  ```
  df <- merge(df, df_population, by = "id")
  ```
- Line 75: birth
  ```
  df <- df[t - birth_year >= 22]
  ```
- Line 78: birth, sex
  ```
  df <- df[,.(id,year,birth_year,sex)]
  ```
- Line 86: lat
  ```
  rm(df_population,df)
  ```
- Line 88: birth
  ```
  df_employment <- df_employment[, .(birth_year = mean(birth_year),
  ```
- Line 89: sex
  ```
  sex = mean(sex),
  ```
- Line 92: birth
  ```
  df_employment <- df_employment[, last_age := last_year - birth_year]
  ```
- Line 98: name
  ```
  filename <- paste0(data, "retirement.Rdata")
  ```
- Line 99: name
  ```
  save(df, file = filename)
  ```
- Line 103: name
  ```
  filename <- paste0(data, "retirement.Rdata")
  ```
- Line 104: name
  ```
  load(filename)
  ```
- Line 106: sex
  ```
  table = df_employment[last_age >= 50 & last_year >= 2006,.N, by =.(last_age, sex)]
  ```
- Line 109: name
  ```
  filename <- paste0(output, "table_retirement.csv")
  ```
- Line 110: name
  ```
  write.csv(table,filename)
  ```

**/replication-package/labor_networks/code/inter/tables_structural_data_multiple2.R**

- Line 2: child
  ```
  # load the children sample
  ```
- Line 3: child, name
  ```
  filename <- paste0(data, "children_sample.Rdata")
  ```
- Line 4: name
  ```
  load(filename)
  ```
- Line 5: child
  ```
  df_children <- df
  ```
- Line 9: birth, child, city
  ```
  df_children <- df_children[,.(id,id_firm,year,age = year - birth_year, ethnicity,
  ```
- Line 10: sex
  ```
  education = 1*(education>0),sex)]
  ```
- Line 13: name
  ```
  filename <- paste0(data, "akm_firm.Rdata")
  ```
- Line 14: name
  ```
  load(filename)
  ```
- Line 15: child
  ```
  df_children <- merge(df_children,df[,.(id_firm,year,firm_rank)], by = c("id_firm","year"))
  ```
- Line 19: child
  ```
  df_children[,id_job := 1:.N]
  ```
- Line 22: child
  ```
  ## get children types
  ```
- Line 23: child, city, sex
  ```
  df_children_types <- unique(df_children[,.(ethnicity,education,sex)])
  ```
- Line 24: child, city, sex
  ```
  setorder(df_children_types,ethnicity,education,sex)
  ```
- Line 25: child
  ```
  df_children_types[,worker_type := 1:.N]
  ```
- Line 26: child, city, sex
  ```
  df_children <- merge(df_children,df_children_types, by = c("ethnicity","education","sex"))
  ```
- Line 30: child
  ```
  df_jobs <- df_children[,.(id_firm,id_job, year,firm_rank)]
  ```
- Line 41: child
  ```
  # merge with df_children
  ```
- Line 42: child
  ```
  df_children <- merge(df_children,df_jobs[,.(id_job,year,job_type)], by = c("id_job","year"))
  ```
- Line 46: name
  ```
  filename <- paste0(data, "connections_type_multiple2.Rdata")
  ```
- Line 47: name
  ```
  load(filename)
  ```
- Line 50: child
  ```
  df_connections <- merge(df_connections,df_children[,.(id)], by = "id")
  ```
- Line 53: child
  ```
  # merge df_children with df_connections
  ```
- Line 54: child
  ```
  df_children <- merge(df_children,df_connections, by = c("id","id_firm"), all.x = TRUE)
  ```
- Line 55: child
  ```
  df_children[is.na(con_type), con_type := 0]
  ```
- Line 58: child
  ```
  df_children[,year := year - min(year) + 1]
  ```
- Line 62: child
  ```
  mu_txyc <- df_children[,.(obs = .N) ,
  ```
- Line 69: child
  ```
  df_connections <- merge(df_connections,df_children[,.(id,year,worker_type)] , by = "id")
  ```
- Line 113: name
  ```
  filename <- paste0(output, "d_xyc_multiple2.csv")
  ```
- Line 114: name
  ```
  write.csv(d_txyc,filename,row.names = FALSE)
  ```

**/replication-package/labor_networks/code/inter/tables_summary_children_multiple2.R**

- Line 1: child, name
  ```
  filename <- paste0(data, "summary_children_multiple2.Rdata")
  ```
- Line 2: name
  ```
  load(filename)
  ```
- Line 3: child
  ```
  df_children <- df
  ```
- Line 7: child
  ```
  table1 <- df_children[,.(obs = .N,
  ```
- Line 8: city
  ```
  ethnicity = mean(ethnicity) ,
  ```
- Line 9: sex
  ```
  sex = mean(sex),
  ```
- Line 46: child
  ```
  table2 <- df_children[,.(obs = .N,
  ```
- Line 47: sex
  ```
  sex = mean(sex),
  ```
- Line 83: city
  ```
  by = "ethnicity"]
  ```
- Line 85: child
  ```
  table3 <- df_children[,.(obs = .N,
  ```
- Line 86: city
  ```
  ethnicity = mean(ethnicity) ,
  ```
- Line 87: sex
  ```
  sex = mean(sex),
  ```
- Line 124: child
  ```
  table4 <- df_children[,.(obs = .N,
  ```
- Line 125: city
  ```
  ethnicity = mean(ethnicity) ,
  ```
- Line 161: sex
  ```
  by = "sex"]
  ```
- Line 167: child, name
  ```
  filename <- paste0(output, "table_summary_children_multiple2.csv")
  ```
- Line 168: name
  ```
  write.csv(table,filename)
  ```

**/replication-package/labor_networks/code/inter/tables_summary_firms.R**

- Line 6: name
  ```
  filename <- paste0(data, "wages_",t,".Rdata")
  ```
- Line 7: name
  ```
  load(filename)
  ```
- Line 45: name
  ```
  filename <- paste0(output, "table_summary_firms.csv")
  ```
- Line 46: name
  ```
  write.csv(table,filename)
  ```

**/replication-package/labor_networks/code/inter/‏‏functions_reg_emp_con_25.R**

- Line 5: child
  ```
  get.reg.emp.con.data <- function(df_children) {
  ```
- Line 8: name
  ```
  filename <- paste0(data, "connections_type_25.Rdata")
  ```
- Line 9: name
  ```
  load(filename)
  ```
- Line 12: child
  ```
  df_connections <- merge(df_connections,df_children[,.(id,year)], by = "id")
  ```
- Line 15: child
  ```
  # gen groups of children
  ```
- Line 16: child
  ```
  df_children[,education := 1* (education > 0)]
  ```
- Line 17: birth, child, city, district, sex
  ```
  df_groups <- df_children[,.(n = .N), by = c("year","birth_year","ethnicity","sex","education","distr
  ```
- Line 20: birth, child, city, district, sex
  ```
  df_children = merge(df_children,df_groups, by = c("year","birth_year","ethnicity","sex","education",
  ```
- Line 23: child
  ```
  # get the group of each child in the connections data
  ```
- Line 24: child
  ```
  df_connections <- merge(df_children[,.(id,group)], df_connections, by = "id")
  ```
- Line 28: child
  ```
  df_employment <- df_children[,.(id,id_firm)]
  ```
- Line 37: child
  ```
  df_employment_group <- merge(df_employment_group,df_children[,.(id,group)], by = "id")
  ```
- Line 44: child
  ```
  # get the number of children in each group
  ```
- Line 93: city, sex
  ```
  df_reg <- merge(df_reg,df_groups[,.(group,ethnicity,sex,education)], by = "group")
  ```
- Line 103: name
  ```
  run.reg.emp.con <- function(df_reg,name_dep_var = 'employment') {
  ```
- Line 105: name
  ```
  df_reg[,dep_var := get(name_dep_var)]
  ```
- Line 107: name
  ```
  df_reg[,dep_var_0 := get(paste0(name_dep_var,"_0"))]
  ```
- Line 127: name
  ```
  run.reg.emp.con.event <- function(df_reg,name_dep_var = 'employment') {
  ```
- Line 129: name
  ```
  df_reg[,dep_var := get(name_dep_var)]
  ```
- Line 149: child
  ```
  get.statistics <- function(df_children) {
  ```
- Line 151: child
  ```
  df_children1 <- df_children
  ```
- Line 152: child
  ```
  rm(df_children)
  ```
- Line 154: child
  ```
  df_children1[,education := 1* (education > 0)]
  ```
- Line 155: birth, child, city, district, sex
  ```
  df_groups <- df_children1[,.(n = .N), by = c("year","birth_year","ethnicity","sex","education","dist
  ```
- Line 161: birth, child, city, district, sex
  ```
  df_children1 <- merge(df_children1,df_groups, by = c("year","birth_year","ethnicity","sex","educatio
  ```
- Line 164: name
  ```
  filename <- paste0(data, "connections_type_25.Rdata")
  ```
- Line 165: name
  ```
  load(filename)
  ```
- Line 171: child
  ```
  df_children <- df_children1[V1 == cc]
  ```
- Line 173: child
  ```
  df_connections <- merge(df_connections1,df_children[,.(id,year)], by = "id")
  ```
- Line 176: child
  ```
  # get the group of each child in the connections data
  ```
- Line 177: child
  ```
  df_connections <- merge(df_children[,.(id,group)], df_connections, by = "id")
  ```
- Line 184: child
  ```
  # get the number of children in each group
  ```
- Line 211: child
  ```
  workers <- df_children1[,.N]
  ```

**/replication-package/labor_networks/code/inter/‏‏tables_reg_emp_con_event_multiple2.R**

- Line 3: name
  ```
  filename <- paste0(log, "reg_emp_con_",today,".txt")
  ```
- Line 4: name
  ```
  sink(file = filename,split = TRUE)
  ```
- Line 14: child
  ```
  #take 20% of children
  ```
- Line 18: child
  ```
  # load the children sample
  ```
- Line 19: child, name
  ```
  filename <- paste0(data, "children_sample.Rdata")
  ```
- Line 20: name
  ```
  load(filename)
  ```
- Line 21: child
  ```
  df_children <- df
  ```
- Line 24: child
  ```
  df_children = cbind(df_children,data.table(runif(dim(df_children)[1])))
  ```
- Line 25: child
  ```
  df_children <- df_children[V1 < 0.2 ]
  ```
- Line 26: child
  ```
  df_children[,V1 := NULL]
  ```
- Line 28: child
  ```
  df_reg <- get.reg.emp.con.data.multiple2(df_children)
  ```
- Line 29: child
  ```
  rm(df_children)
  ```
- Line 52: name
  ```
  filename <- paste0(output, "reg_emp_con_event_multiple2.Rdata")
  ```
- Line 55: name
  ```
  file = filename)
  ```
- Line 60: name
  ```
  filename <- paste0(output, "reg_emp_con_event_multiple2.Rdata")
  ```
- Line 61: name
  ```
  load(filename)
  ```
- Line 64: child, name
  ```
  filename <- paste0(data, "children_sample.Rdata")
  ```
- Line 65: name
  ```
  load(filename)
  ```
- Line 66: child
  ```
  df_children <- df
  ```
- Line 69: child
  ```
  stat1 <- get.statistics(df_children)
  ```
- Line 84: name
  ```
  filename <- paste0(output, "table_reg_emp_con_multiple2.csv")
  ```
- Line 85: name
  ```
  write.csv(table,filename)
  ```
- Line 97: name
  ```
  filename <- paste0(output, "figure_reg_emp_con_event_multiple2.csv")
  ```
- Line 98: name
  ```
  write.csv(table,filename)
  ```

**/replication-package/labor_networks/code/inter/‏‏‏‏functions_reg_emp_con_grad1.R**

- Line 5: child
  ```
  get.reg.emp.con.data <- function(df_children) {
  ```
- Line 8: name
  ```
  filename <- paste0(data, "connections_type_grad1.Rdata")
  ```
- Line 9: name
  ```
  load(filename)
  ```
- Line 12: child
  ```
  df_connections <- merge(df_connections,df_children[,.(id,year)], by = "id")
  ```
- Line 15: child
  ```
  # gen groups of children
  ```
- Line 16: child
  ```
  df_children[,education := 1* (education > 0)]
  ```
- Line 17: birth, child, city, district, sex
  ```
  df_groups <- df_children[,.(n = .N), by = c("year","birth_year","ethnicity","sex","education","distr
  ```
- Line 20: birth, child, city, district, sex
  ```
  df_children = merge(df_children,df_groups, by = c("year","birth_year","ethnicity","sex","education",
  ```
- Line 23: child
  ```
  # get the group of each child in the connections data
  ```
- Line 24: child
  ```
  df_connections <- merge(df_children[,.(id,group)], df_connections, by = "id")
  ```
- Line 28: child
  ```
  df_employment <- df_children[,.(id,id_firm)]
  ```
- Line 37: child
  ```
  df_employment_group <- merge(df_employment_group,df_children[,.(id,group)], by = "id")
  ```
- Line 44: child
  ```
  # get the number of children in each group
  ```
- Line 93: city, sex
  ```
  df_reg <- merge(df_reg,df_groups[,.(group,ethnicity,sex,education)], by = "group")
  ```
- Line 103: name
  ```
  run.reg.emp.con <- function(df_reg,name_dep_var = 'employment') {
  ```
- Line 105: name
  ```
  df_reg[,dep_var := get(name_dep_var)]
  ```
- Line 107: name
  ```
  df_reg[,dep_var_0 := get(paste0(name_dep_var,"_0"))]
  ```
- Line 127: name
  ```
  run.reg.emp.con.event <- function(df_reg,name_dep_var = 'employment') {
  ```
- Line 129: name
  ```
  df_reg[,dep_var := get(name_dep_var)]
  ```
- Line 149: child
  ```
  get.statistics <- function(df_children) {
  ```
- Line 151: child
  ```
  df_children1 <- df_children
  ```
- Line 152: child
  ```
  rm(df_children)
  ```
- Line 154: child
  ```
  df_children1[,education := 1* (education > 0)]
  ```
- Line 155: birth, child, city, district, sex
  ```
  df_groups <- df_children1[,.(n = .N), by = c("year","birth_year","ethnicity","sex","education","dist
  ```
- Line 161: birth, child, city, district, sex
  ```
  df_children1 <- merge(df_children1,df_groups, by = c("year","birth_year","ethnicity","sex","educatio
  ```
- Line 164: name
  ```
  filename <- paste0(data, "connections_type_grad1.Rdata")
  ```
- Line 165: name
  ```
  load(filename)
  ```
- Line 171: child
  ```
  df_children <- df_children1[V1 == cc]
  ```
- Line 173: child
  ```
  df_connections <- merge(df_connections1,df_children[,.(id,year)], by = "id")
  ```
- Line 176: child
  ```
  # get the group of each child in the connections data
  ```
- Line 177: child
  ```
  df_connections <- merge(df_children[,.(id,group)], df_connections, by = "id")
  ```
- Line 184: child
  ```
  # get the number of children in each group
  ```
- Line 211: child
  ```
  workers <- df_children1[,.N]
  ```

**/replication-package/labor_networks/code/inter/‏‏‏‏tables_reg_emp_con_long_int.r**

- Line 3: lon, name
  ```
  filename <- paste0(log, "reg_emp_con_long_int_",today,".txt")
  ```
- Line 4: name
  ```
  sink(file = filename,split = TRUE)
  ```
- Line 6: lon
  ```
  source(paste0(process, "functions_reg_emp_con_long.R"))
  ```
- Line 18: child
  ```
  #take 10% of children
  ```
- Line 22: child
  ```
  # load the children sample
  ```
- Line 23: child, name
  ```
  filename <- paste0(data, "children_sample.Rdata")
  ```
- Line 24: name
  ```
  load(filename)
  ```
- Line 25: child
  ```
  df_children <- df
  ```
- Line 29: child
  ```
  df_children = cbind(df_children,data.table(runif(dim(df_children)[1])))
  ```
- Line 30: child
  ```
  df_children <- df_children[V1 < 0.1 ]
  ```
- Line 31: child
  ```
  df_children[,V1 := NULL]
  ```
- Line 33: child
  ```
  list1 <- get.reg.emp.con.data.int(df_children)
  ```
- Line 36: lon
  ```
  df_connections_long_firm = list1[[2]]
  ```
- Line 41: lon
  ```
  table_temp <- run.reg.emp.con.long.figure(df_reg = df_reg_firm ,df_connections_long = df_connections
  ```
- Line 42: lon
  ```
  df_connections_long_firm[,bin_var := NULL]
  ```
- Line 43: lon
  ```
  df_connections_long_firm[,bin := NULL]
  ```
- Line 54: lon, name
  ```
  filename <- paste0(data, "reg_emp_con_long_int.Rdata")
  ```
- Line 55: name
  ```
  save(table,file = filename)
  ```
- Line 62: lon, name
  ```
  filename <- paste0(data, "reg_emp_con_long_int.Rdata")
  ```
- Line 63: name
  ```
  load(filename)
  ```
- Line 68: lon
  ```
  table_k <- prepare.reg.emp.con.table.long.figure(table[[k]],bin_vars[k]		)
  ```
- Line 77: lon, name
  ```
  filename <- paste0(output, "figure_reg_emp_con_long_int.csv")
  ```
- Line 78: name
  ```
  fwrite(table1,filename,col.names = F)
  ```

**/replication-package/labor_networks/code/master_all.R**

- Line 2: network
  ```
  ## master_all.R  --  single entry point for the labor-networks replication
  ```
- Line 6: lat
  ```
  ## stage-masters (master_simulate / master_inter / master_output) inherit every
  ```
- Line 10: lat
  ```
  ##       Stage 0 SIMULATION       code/simulate/master_simulate.R  -> data/raw/
  ```
- Line 16: lat
  ```
  ##       Skips simulation + BTL. Stage 2 reads the cleared real-number CSVs in
  ```
- Line 17: minute
  ```
  ##       output/csv_real/ and reproduces the paper's exhibits in ~2 minutes.
  ```
- Line 46: name
  ```
  ## 3. ALL PATHS  --  single source of truth (edit folder names here only)
  ```
- Line 53: lat
  ```
  process_simulate <- paste0(root, "code/simulate/")  # master_simulate.R + simulate_*.R
  ```
- Line 107: lat
  ```
  message("\n== STAGE 0: SIMULATION (synthetic raw data) ==")
  ```
- Line 108: lat
  ```
  source(paste0(process_simulate, "master_simulate.R"))
  ```

**/replication-package/labor_networks/code/output/gen_figures.R**

- Line 21: city
  ```
  ggtitle("A. Weak connections by ethnicity") +
  ```
- Line 45: city
  ```
  ggtitle("B. Strong connections by ethnicity") +
  ```
- Line 83: gender
  ```
  ggtitle("C. Weak connections by gender") +
  ```
- Line 107: gender
  ```
  ggtitle("D. Strong connections by gender") +
  ```
- Line 175: child, lat
  ```
  x= "Last year parent's coworker worked at the firm relative to child's labor-market entry year",
  ```
- Line 204: lon
  ```
  df1 <- read.csv(paste0( output, "figure_reg_emp_con_long1.csv"))
  ```
- Line 240: lon
  ```
  df1 <- read.csv(paste0( output, "figure_reg_emp_con_long2.csv"))
  ```
- Line 272: lon
  ```
  df1 <- read.csv(paste0( output, "figure_reg_emp_con_long3.csv"))
  ```
- Line 303: child, gender
  ```
  "J. Child's gender",
  ```
- Line 304: gender
  ```
  "K. Parent's gender",
  ```
- Line 305: gender
  ```
  "L. Coworker's gender",
  ```
- Line 306: child, city
  ```
  "M. Child's ethnicity",
  ```
- Line 307: city
  ```
  "N. Coworker's ethnicity",
  ```
- Line 308: child
  ```
  "O. Child's education",
  ```
- Line 309: child, gender
  ```
  "P. Gender child-parent",
  ```
- Line 310: child, gender
  ```
  "Q. Gender child-coworker",
  ```
- Line 311: child, city
  ```
  "R. Ethnicity child-coworker"
  ```
- Line 326: lon
  ```
  df1 <- read.csv(paste0( output, "figure_reg_emp_con_long4.csv"))
  ```
- Line 396: lon
  ```
  df1 <- read.csv(paste0(output, "figure_reg_emp_con_long_firm.csv"))
  ```
- Line 413: name
  ```
  diff_name <- paste0("diff", i)
  ```
- Line 414: name
  ```
  lb_name <- paste0("diff", i, "_lb")
  ```
- Line 415: name
  ```
  ub_name <- paste0("diff", i, "_ub")
  ```
- Line 417: name
  ```
  beta[i] <- as.numeric(df_section[df_section[, 1] == diff_name, 2])
  ```
- Line 418: name
  ```
  lb[i] <- as.numeric(df_section[df_section[, 1] == lb_name, 2])
  ```
- Line 419: name
  ```
  ub[i] <- as.numeric(df_section[df_section[, 1] == ub_name, 2])
  ```
- Line 459: name
  ```
  diff_name <- paste0("diff", i)
  ```
- Line 460: name
  ```
  sector_effects[i] <- as.numeric(df_section[df_section[, 1] == diff_name, 2])
  ```
- Line 475: lat
  ```
  # Create three correlation plots for right column
  ```
- Line 540: lon
  ```
  ggsave(paste0(figures, "figure_reg_emp_con_long_firm.pdf"), g, width = 8, height = 8)
  ```
- Line 565: child, lat
  ```
  x= "Last year parent's coworker worked at the firm relative to child's labor-market entry year",
  ```
- Line 588: child
  ```
  df1 = read.csv(paste0( output, "figure_children_panel.csv"))
  ```
- Line 597: name
  ```
  setnames(df,c("diff","diff_se"))
  ```
- Line 616: coord
  ```
  coord_cartesian(xlim = c(-0.1, 4.1)) +
  ```
- Line 703: city, sex
  ```
  df <- df[sex == -1 & ethnicity == -1]
  ```
- Line 705: name
  ```
  if("V1" %in% names(df)) {
  ```
- Line 850: lat
  ```
  # Calculate bin width
  ```
- Line 930: child, lat
  ```
  x= "Last year parent's coworker worked at the firm relative to child's labor-market entry year",
  ```
- Line 992: child, lat
  ```
  bottom_title <- textGrob("Last year parent's coworker worked at the firm relative to child's labor-m
  ```
- Line 1062: child, lat
  ```
  bottom_title <- textGrob("Last year parent's coworker worked at the firm relative to child's labor-m
  ```
- Line 1080: city
  ```
  ### Figure A8: Ratio weak-phantom by age at first job and ethnicity     ###
  ```
- Line 1179: child, lat
  ```
  bottom_title <- textGrob("Last year parent's coworker worked at the firm relative to child's labor-m
  ```
- Line 1218: child, lat
  ```
  x= "Last year parent's coworker worked at the firm relative to child's labor-market entry year",
  ```
- Line 1237: sex
  ```
  df[,sex1 := "Males"]
  ```
- Line 1238: sex
  ```
  df[sex == 1,sex1 := "Females"]
  ```
- Line 1241: sex
  ```
  df[, Frequency := N/sum(N), by = "sex"]
  ```
- Line 1243: sex
  ```
  g1 <- ggplot(data=df[sex == 0], mapping=aes(x=last_age))+
  ```
- Line 1256: sex
  ```
  g2 = ggplot(data=df[sex == 1], mapping=aes(x=last_age))+
  ```
- Line 1277: gender
  ```
  ### Figure A12: Heterogeneity: effect by gender and sector ###
  ```
- Line 1280: lon, sex
  ```
  df1 <- read.csv(paste0( output, "figure_reg_emp_con_long_sector_sex.csv"))
  ```
- Line 1289: name
  ```
  diff_name <- paste0("diff", i)
  ```
- Line 1290: name
  ```
  lb_name <- paste0("diff", i, "_lb")
  ```
- Line 1291: name
  ```
  ub_name <- paste0("diff", i, "_ub")
  ```
- Line 1293: name
  ```
  beta[i] <- as.numeric(df1[df1[,1] == diff_name, 2])
  ```
- Line 1294: name
  ```
  lb[i] <- as.numeric(df1[df1[,1] == lb_name, 2])
  ```
- Line 1295: name
  ```
  ub[i] <- as.numeric(df1[df1[,1] == ub_name, 2])
  ```
- Line 1317: gender
  ```
  gender = "Male"
  ```
- Line 1325: gender
  ```
  gender = "Female"
  ```
- Line 1345: gender
  ```
  ggplot(data = df, aes(x = sector, y = beta, fill = gender)) +
  ```
- Line 1371: lon, sex
  ```
  ggsave(paste0( figures, "figure_reg_emp_con_long_sector_sex.pdf"), width=8, height=4.5)
  ```
- Line 1377: lon
  ```
  df1 <- read.csv(paste0( output, "figure_reg_emp_con_long_year.csv"))
  ```

**/replication-package/labor_networks/code/output/gen_tables.R**

- Line 5: child
  ```
  df <- read.csv(paste0( output, "table_summary_children_multiple2.csv"))
  ```
- Line 9: child, name
  ```
  filename  <- paste0(tables, "table_summary_children_body.tex")
  ```
- Line 12: city
  ```
  & \\multicolumn{2}{c}{Ethnicity}
  ```
- Line 13: gender
  ```
  & \\multicolumn{2}{c}{Gender}
  ```
- Line 36: city
  ```
  " & " ,format(round(df[1,"ethnicity"], 3), nsmall = 3),
  ```
- Line 37: city
  ```
  " & " ,format(round(df[2,"ethnicity"], 3), nsmall = 3),
  ```
- Line 38: city
  ```
  " & " ,format(round(df[3,"ethnicity"], 3), nsmall = 3),
  ```
- Line 39: city
  ```
  " & " ,format(round(df[4,"ethnicity"], 3), nsmall = 3),
  ```
- Line 40: city
  ```
  " & " ,format(round(df[5,"ethnicity"], 3), nsmall = 3),
  ```
- Line 43: sex
  ```
  " & " ,format(round(df[1,"sex"], 3), nsmall = 3),
  ```
- Line 44: sex
  ```
  " & " ,format(round(df[2,"sex"], 3), nsmall = 3),
  ```
- Line 45: sex
  ```
  " & " ,format(round(df[3,"sex"], 3), nsmall = 3),
  ```
- Line 46: sex
  ```
  " & " ,format(round(df[4,"sex"], 3), nsmall = 3),
  ```
- Line 47: sex
  ```
  " & " ,format(round(df[5,"sex"], 3), nsmall = 3),
  ```
- Line 196: name
  ```
  file=filename,sep="\n",append=FALSE)
  ```
- Line 205: name
  ```
  filename  <- paste0(tables, "table_reg_emp_con_multiple2_body.tex")
  ```
- Line 469: name
  ```
  file=filename,sep="\n",append=FALSE)
  ```
- Line 476: child
  ```
  df <- read.csv(paste0(output, "table_reg_children_panel_employment.csv"))
  ```
- Line 477: name
  ```
  filename <- paste0(tables, "table_reg_employment_panel_body.tex")
  ```
- Line 534: name
  ```
  file = filename, sep = "\n", append = FALSE)
  ```
- Line 547: name
  ```
  filename  <- paste0(tables, "table_reg_salary_duration_con_multiple2_body.tex")
  ```
- Line 676: name
  ```
  file=filename,sep="\n",append=FALSE)
  ```
- Line 692: name
  ```
  filename <- paste0(tables, "table_reg_salary_subs_5years_multiple2_body.tex")
  ```
- Line 803: name
  ```
  file = filename, sep = "\n", append = FALSE)
  ```
- Line 813: name
  ```
  filename  <- paste0(tables, "table_summary_firms_body.tex")
  ```
- Line 842: name
  ```
  file=filename,sep="\n",append=FALSE)
  ```
- Line 852: name
  ```
  filename  <- paste0(tables, "table_reg_emp_con_event_full_body.tex")
  ```
- Line 1000: name
  ```
  file=filename,sep="\n",append=FALSE)
  ```
- Line 1011: name
  ```
  filename <- paste0(tables, "table_reg_emp_con_multiple2_firm_size_body.tex")
  ```
- Line 1173: name
  ```
  file = filename, sep = "\n", append = FALSE)
  ```
- Line 1185: name
  ```
  filename  <- paste0(tables, "table_reg_balancing_body.tex")
  ```
- Line 1272: name
  ```
  file=filename,sep="\n",append=FALSE)
  ```
- Line 1281: name
  ```
  filename  <- paste0(tables, "table_reg_emp_con_exit_body.tex")
  ```
- Line 1394: name
  ```
  file=filename,sep="\n",append=FALSE)
  ```
- Line 1405: name
  ```
  filename  <- paste0(tables, "table_reg_emp_con_placebo_body.tex")
  ```
- Line 1549: name
  ```
  file=filename,sep="\n",append=FALSE)
  ```
- Line 1552: city
  ```
  ### Table A7: Effects on salary and duration by ethnicity  ###
  ```
- Line 1567: city
  ```
  df_ethnicity <- rbind(df_jews_salary, df_arabs_salary,
  ```
- Line 1571: city, name
  ```
  filename <- paste0(tables, "table_reg_salary_duration_con_multiple2_ethnicity_body.tex")
  ```
- Line 1595: city
  ```
  " & ", format(round(df_ethnicity[1,"con1"], 3), nsmall = 3),
  ```
- Line 1596: city
  ```
  " & ", format(round(df_ethnicity[2,"con1"], 3), nsmall = 3),
  ```
- Line 1597: city
  ```
  " & ", format(round(df_ethnicity[3,"con1"], 3), nsmall = 3),
  ```
- Line 1598: city
  ```
  " & ", format(round(df_ethnicity[4,"con1"], 3), nsmall = 3),
  ```
- Line 1599: city
  ```
  " & ", format(round(df_ethnicity[5,"con1"], 3), nsmall = 3),
  ```
- Line 1600: city
  ```
  " & ", format(round(df_ethnicity[6,"con1"], 3), nsmall = 3),
  ```
- Line 1602: city
  ```
  paste0(" & ", "(", format(round(df_ethnicity[1,"con1_se"], 3), nsmall = 3), ")",
  ```
- Line 1603: city
  ```
  " & ", "(", format(round(df_ethnicity[2,"con1_se"], 3), nsmall = 3), ")",
  ```
- Line 1604: city
  ```
  " & ", "(", format(round(df_ethnicity[3,"con1_se"], 3), nsmall = 3), ")",
  ```
- Line 1605: city
  ```
  " & ", "(", format(round(df_ethnicity[4,"con1_se"], 3), nsmall = 3), ")",
  ```
- Line 1606: city
  ```
  " & ", "(", format(round(df_ethnicity[5,"con1_se"], 3), nsmall = 3), ")",
  ```
- Line 1607: city
  ```
  " & ", "(", format(round(df_ethnicity[6,"con1_se"], 3), nsmall = 3), ")",
  ```
- Line 1611: city
  ```
  " & ", format(round(df_ethnicity[1,"con2"], 3), nsmall = 3),
  ```
- Line 1612: city
  ```
  " & ", format(round(df_ethnicity[2,"con2"], 3), nsmall = 3),
  ```
- Line 1613: city
  ```
  " & ", format(round(df_ethnicity[3,"con2"], 3), nsmall = 3),
  ```
- Line 1614: city
  ```
  " & ", format(round(df_ethnicity[4,"con2"], 3), nsmall = 3),
  ```
- Line 1615: city
  ```
  " & ", format(round(df_ethnicity[5,"con2"], 3), nsmall = 3),
  ```
- Line 1616: city
  ```
  " & ", format(round(df_ethnicity[6,"con2"], 3), nsmall = 3),
  ```
- Line 1618: city
  ```
  paste0(" & ", "(", format(round(df_ethnicity[1,"con2_se"], 3), nsmall = 3), ")",
  ```
- Line 1619: city
  ```
  " & ", "(", format(round(df_ethnicity[2,"con2_se"], 3), nsmall = 3), ")",
  ```
- Line 1620: city
  ```
  " & ", "(", format(round(df_ethnicity[3,"con2_se"], 3), nsmall = 3), ")",
  ```
- Line 1621: city
  ```
  " & ", "(", format(round(df_ethnicity[4,"con2_se"], 3), nsmall = 3), ")",
  ```
- Line 1622: city
  ```
  " & ", "(", format(round(df_ethnicity[5,"con2_se"], 3), nsmall = 3), ")",
  ```
- Line 1623: city
  ```
  " & ", "(", format(round(df_ethnicity[6,"con2_se"], 3), nsmall = 3), ")",
  ```
- Line 1627: city
  ```
  " & ", format(round(df_ethnicity[1,"con3"], 3), nsmall = 3),
  ```
- Line 1628: city
  ```
  " & ", format(round(df_ethnicity[2,"con3"], 3), nsmall = 3),
  ```
- Line 1629: city
  ```
  " & ", format(round(df_ethnicity[3,"con3"], 3), nsmall = 3),
  ```
- Line 1630: city
  ```
  " & ", format(round(df_ethnicity[4,"con3"], 3), nsmall = 3),
  ```
- Line 1631: city
  ```
  " & ", format(round(df_ethnicity[5,"con3"], 3), nsmall = 3),
  ```
- Line 1632: city
  ```
  " & ", format(round(df_ethnicity[6,"con3"], 3), nsmall = 3),
  ```
- Line 1634: city
  ```
  paste0(" & ", "(", format(round(df_ethnicity[1,"con3_se"], 3), nsmall = 3), ")",
  ```
- Line 1635: city
  ```
  " & ", "(", format(round(df_ethnicity[2,"con3_se"], 3), nsmall = 3), ")",
  ```
- Line 1636: city
  ```
  " & ", "(", format(round(df_ethnicity[3,"con3_se"], 3), nsmall = 3), ")",
  ```
- Line 1637: city
  ```
  " & ", "(", format(round(df_ethnicity[4,"con3_se"], 3), nsmall = 3), ")",
  ```
- Line 1638: city
  ```
  " & ", "(", format(round(df_ethnicity[5,"con3_se"], 3), nsmall = 3), ")",
  ```
- Line 1639: city
  ```
  " & ", "(", format(round(df_ethnicity[6,"con3_se"], 3), nsmall = 3), ")",
  ```
- Line 1643: city
  ```
  " & ", format(round(df_ethnicity[1,"con4"], 3), nsmall = 3),
  ```
- Line 1644: city
  ```
  " & ", format(round(df_ethnicity[2,"con4"], 3), nsmall = 3),
  ```
- Line 1645: city
  ```
  " & ", format(round(df_ethnicity[3,"con4"], 3), nsmall = 3),
  ```
- Line 1646: city
  ```
  " & ", format(round(df_ethnicity[4,"con4"], 3), nsmall = 3),
  ```
- Line 1647: city
  ```
  " & ", format(round(df_ethnicity[5,"con4"], 3), nsmall = 3),
  ```
- Line 1648: city
  ```
  " & ", format(round(df_ethnicity[6,"con4"], 3), nsmall = 3),
  ```
- Line 1650: city
  ```
  paste0(" & ", "(", format(round(df_ethnicity[1,"con4_se"], 3), nsmall = 3), ")",
  ```
- Line 1651: city
  ```
  " & ", "(", format(round(df_ethnicity[2,"con4_se"], 3), nsmall = 3), ")",
  ```
- Line 1652: city
  ```
  " & ", "(", format(round(df_ethnicity[3,"con4_se"], 3), nsmall = 3), ")",
  ```
- Line 1653: city
  ```
  " & ", "(", format(round(df_ethnicity[4,"con4_se"], 3), nsmall = 3), ")",
  ```
- Line 1654: city
  ```
  " & ", "(", format(round(df_ethnicity[5,"con4_se"], 3), nsmall = 3), ")",
  ```
- Line 1655: city
  ```
  " & ", "(", format(round(df_ethnicity[6,"con4_se"], 3), nsmall = 3), ")",
  ```
- Line 1659: city
  ```
  " & ", format(round(df_ethnicity[1,"con5"], 3), nsmall = 3),
  ```
- Line 1660: city
  ```
  " & ", format(round(df_ethnicity[2,"con5"], 3), nsmall = 3),
  ```
- Line 1661: city
  ```
  " & ", format(round(df_ethnicity[3,"con5"], 3), nsmall = 3),
  ```
- Line 1662: city
  ```
  " & ", format(round(df_ethnicity[4,"con5"], 3), nsmall = 3),
  ```
- Line 1663: city
  ```
  " & ", format(round(df_ethnicity[5,"con5"], 3), nsmall = 3),
  ```
- Line 1664: city
  ```
  " & ", format(round(df_ethnicity[6,"con5"], 3), nsmall = 3),
  ```
- Line 1666: city
  ```
  paste0(" & ", "(", format(round(df_ethnicity[1,"con5_se"], 3), nsmall = 3), ")",
  ```
- Line 1667: city
  ```
  " & ", "(", format(round(df_ethnicity[2,"con5_se"], 3), nsmall = 3), ")",
  ```
- Line 1668: city
  ```
  " & ", "(", format(round(df_ethnicity[3,"con5_se"], 3), nsmall = 3), ")",
  ```
- Line 1669: city
  ```
  " & ", "(", format(round(df_ethnicity[4,"con5_se"], 3), nsmall = 3), ")",
  ```
- Line 1670: city
  ```
  " & ", "(", format(round(df_ethnicity[5,"con5_se"], 3), nsmall = 3), ")",
  ```
- Line 1671: city
  ```
  " & ", "(", format(round(df_ethnicity[6,"con5_se"], 3), nsmall = 3), ")",
  ```
- Line 1675: city
  ```
  " & ", format(round(df_ethnicity[1,"con6"], 3), nsmall = 3),
  ```
- Line 1676: city
  ```
  " & ", format(round(df_ethnicity[2,"con6"], 3), nsmall = 3),
  ```
- Line 1677: city
  ```
  " & ", format(round(df_ethnicity[3,"con6"], 3), nsmall = 3),
  ```
- Line 1678: city
  ```
  " & ", format(round(df_ethnicity[4,"con6"], 3), nsmall = 3),
  ```
- Line 1679: city
  ```
  " & ", format(round(df_ethnicity[5,"con6"], 3), nsmall = 3),
  ```
- Line 1680: city
  ```
  " & ", format(round(df_ethnicity[6,"con6"], 3), nsmall = 3),
  ```
- Line 1682: city
  ```
  paste0(" & ", "(", format(round(df_ethnicity[1,"con6_se"], 3), nsmall = 3), ")",
  ```
- Line 1683: city
  ```
  " & ", "(", format(round(df_ethnicity[2,"con6_se"], 3), nsmall = 3), ")",
  ```
- Line 1684: city
  ```
  " & ", "(", format(round(df_ethnicity[3,"con6_se"], 3), nsmall = 3), ")",
  ```
- Line 1685: city
  ```
  " & ", "(", format(round(df_ethnicity[4,"con6_se"], 3), nsmall = 3), ")",
  ```
- Line 1686: city
  ```
  " & ", "(", format(round(df_ethnicity[5,"con6_se"], 3), nsmall = 3), ")",
  ```
- Line 1687: city
  ```
  " & ", "(", format(round(df_ethnicity[6,"con6_se"], 3), nsmall = 3), ")",
  ```
- Line 1691: city
  ```
  " & ", format(round(df_ethnicity[1,"con7"], 3), nsmall = 3),
  ```
- Line 1692: city
  ```
  " & ", format(round(df_ethnicity[2,"con7"], 3), nsmall = 3),
  ```
- Line 1693: city
  ```
  " & ", format(round(df_ethnicity[3,"con7"], 3), nsmall = 3),
  ```
- Line 1694: city
  ```
  " & ", format(round(df_ethnicity[4,"con7"], 3), nsmall = 3),
  ```
- Line 1695: city
  ```
  " & ", format(round(df_ethnicity[5,"con7"], 3), nsmall = 3),
  ```
- Line 1696: city
  ```
  " & ", format(round(df_ethnicity[6,"con7"], 3), nsmall = 3),
  ```
- Line 1698: city
  ```
  paste0(" & ", "(", format(round(df_ethnicity[1,"con7_se"], 3), nsmall = 3), ")",
  ```
- Line 1699: city
  ```
  " & ", "(", format(round(df_ethnicity[2,"con7_se"], 3), nsmall = 3), ")",
  ```
- Line 1700: city
  ```
  " & ", "(", format(round(df_ethnicity[3,"con7_se"], 3), nsmall = 3), ")",
  ```
- Line 1701: city
  ```
  " & ", "(", format(round(df_ethnicity[4,"con7_se"], 3), nsmall = 3), ")",
  ```
- Line 1702: city
  ```
  " & ", "(", format(round(df_ethnicity[5,"con7_se"], 3), nsmall = 3), ")",
  ```
- Line 1703: city
  ```
  " & ", "(", format(round(df_ethnicity[6,"con7_se"], 3), nsmall = 3), ")",
  ```
- Line 1707: city
  ```
  " & ", format(round(df_ethnicity[1,"con8"], 3), nsmall = 3),
  ```
- Line 1708: city
  ```
  " & ", format(round(df_ethnicity[2,"con8"], 3), nsmall = 3),
  ```
- Line 1709: city
  ```
  " & ", format(round(df_ethnicity[3,"con8"], 3), nsmall = 3),
  ```
- Line 1710: city
  ```
  " & ", format(round(df_ethnicity[4,"con8"], 3), nsmall = 3),
  ```
- Line 1711: city
  ```
  " & ", format(round(df_ethnicity[5,"con8"], 3), nsmall = 3),
  ```
- Line 1712: city
  ```
  " & ", format(round(df_ethnicity[6,"con8"], 3), nsmall = 3),
  ```
- Line 1714: city
  ```
  paste0(" & ", "(", format(round(df_ethnicity[1,"con8_se"], 3), nsmall = 3), ")",
  ```
- Line 1715: city
  ```
  " & ", "(", format(round(df_ethnicity[2,"con8_se"], 3), nsmall = 3), ")",
  ```
- Line 1716: city
  ```
  " & ", "(", format(round(df_ethnicity[3,"con8_se"], 3), nsmall = 3), ")",
  ```
- Line 1717: city
  ```
  " & ", "(", format(round(df_ethnicity[4,"con8_se"], 3), nsmall = 3), ")",
  ```
- Line 1718: city
  ```
  " & ", "(", format(round(df_ethnicity[5,"con8_se"], 3), nsmall = 3), ")",
  ```
- Line 1719: city
  ```
  " & ", "(", format(round(df_ethnicity[6,"con8_se"], 3), nsmall = 3), ")",
  ```
- Line 1725: city
  ```
  " & ", format(round(df_ethnicity[1,"diff41"], 3), nsmall = 3),
  ```
- Line 1726: city
  ```
  " & ", format(round(df_ethnicity[2,"diff41"], 3), nsmall = 3),
  ```
- Line 1727: city
  ```
  " & ", format(round(df_ethnicity[3,"diff41"], 3), nsmall = 3),
  ```
- Line 1728: city
  ```
  " & ", format(round(df_ethnicity[4,"diff41"], 3), nsmall = 3),
  ```
- Line 1729: city
  ```
  " & ", format(round(df_ethnicity[5,"diff41"], 3), nsmall = 3),
  ```
- Line 1730: city
  ```
  " & ", format(round(df_ethnicity[6,"diff41"], 3), nsmall = 3),
  ```
- Line 1732: city
  ```
  paste0(" & ", "(", format(round(df_ethnicity[1,"diff41_se"], 3), nsmall = 3), ")",
  ```
- Line 1733: city
  ```
  " & ", "(", format(round(df_ethnicity[2,"diff41_se"], 3), nsmall = 3), ")",
  ```
- Line 1734: city
  ```
  " & ", "(", format(round(df_ethnicity[3,"diff41_se"], 3), nsmall = 3), ")",
  ```
- Line 1735: city
  ```
  " & ", "(", format(round(df_ethnicity[4,"diff41_se"], 3), nsmall = 3), ")",
  ```
- Line 1736: city
  ```
  " & ", "(", format(round(df_ethnicity[5,"diff41_se"], 3), nsmall = 3), ")",
  ```
- Line 1737: city
  ```
  " & ", "(", format(round(df_ethnicity[6,"diff41_se"], 3), nsmall = 3), ")",
  ```
- Line 1741: city
  ```
  " & ", format(round(df_ethnicity[1,"diff52"], 3), nsmall = 3),
  ```
- Line 1742: city
  ```
  " & ", format(round(df_ethnicity[2,"diff52"], 3), nsmall = 3),
  ```
- Line 1743: city
  ```
  " & ", format(round(df_ethnicity[3,"diff52"], 3), nsmall = 3),
  ```
- Line 1744: city
  ```
  " & ", format(round(df_ethnicity[4,"diff52"], 3), nsmall = 3),
  ```
- Line 1745: city
  ```
  " & ", format(round(df_ethnicity[5,"diff52"], 3), nsmall = 3),
  ```
- Line 1746: city
  ```
  " & ", format(round(df_ethnicity[6,"diff52"], 3), nsmall = 3),
  ```
- Line 1748: city
  ```
  paste0(" & ", "(", format(round(df_ethnicity[1,"diff52_se"], 3), nsmall = 3), ")",
  ```
- Line 1749: city
  ```
  " & ", "(", format(round(df_ethnicity[2,"diff52_se"], 3), nsmall = 3), ")",
  ```
- Line 1750: city
  ```
  " & ", "(", format(round(df_ethnicity[3,"diff52_se"], 3), nsmall = 3), ")",
  ```
- Line 1751: city
  ```
  " & ", "(", format(round(df_ethnicity[4,"diff52_se"], 3), nsmall = 3), ")",
  ```
- Line 1752: city
  ```
  " & ", "(", format(round(df_ethnicity[5,"diff52_se"], 3), nsmall = 3), ")",
  ```
- Line 1753: city
  ```
  " & ", "(", format(round(df_ethnicity[6,"diff52_se"], 3), nsmall = 3), ")",
  ```
- Line 1757: city
  ```
  " & ", format(round(df_ethnicity[1,"diff63"], 3), nsmall = 3),
  ```
- Line 1758: city
  ```
  " & ", format(round(df_ethnicity[2,"diff63"], 3), nsmall = 3),
  ```
- Line 1759: city
  ```
  " & ", format(round(df_ethnicity[3,"diff63"], 3), nsmall = 3),
  ```
- Line 1760: city
  ```
  " & ", format(round(df_ethnicity[4,"diff63"], 3), nsmall = 3),
  ```
- Line 1761: city
  ```
  " & ", format(round(df_ethnicity[5,"diff63"], 3), nsmall = 3),
  ```
- Line 1762: city
  ```
  " & ", format(round(df_ethnicity[6,"diff63"], 3), nsmall = 3),
  ```
- Line 1764: city
  ```
  paste0(" & ", "(", format(round(df_ethnicity[1,"diff63_se"], 3), nsmall = 3), ")",
  ```
- Line 1765: city
  ```
  " & ", "(", format(round(df_ethnicity[2,"diff63_se"], 3), nsmall = 3), ")",
  ```
- Line 1766: city
  ```
  " & ", "(", format(round(df_ethnicity[3,"diff63_se"], 3), nsmall = 3), ")",
  ```
- Line 1767: city
  ```
  " & ", "(", format(round(df_ethnicity[4,"diff63_se"], 3), nsmall = 3), ")",
  ```
- Line 1768: city
  ```
  " & ", "(", format(round(df_ethnicity[5,"diff63_se"], 3), nsmall = 3), ")",
  ```
- Line 1769: city
  ```
  " & ", "(", format(round(df_ethnicity[6,"diff63_se"], 3), nsmall = 3), ")",
  ```
- Line 1775: city
  ```
  " & ", format(round(df_ethnicity[1,"y0"], 3), nsmall = 3),
  ```
- Line 1776: city
  ```
  " & ", format(round(df_ethnicity[2,"y0"], 3), nsmall = 3),
  ```
- Line 1777: city
  ```
  " & ", format(round(df_ethnicity[3,"y0"], 3), nsmall = 3),
  ```
- Line 1778: city
  ```
  " & ", format(round(df_ethnicity[4,"y0"], 3), nsmall = 3),
  ```
- Line 1779: city
  ```
  " & ", format(round(df_ethnicity[5,"y0"], 3), nsmall = 3),
  ```
- Line 1780: city
  ```
  " & ", format(round(df_ethnicity[6,"y0"], 3), nsmall = 3),
  ```
- Line 1784: city
  ```
  " & ", format(round(df_ethnicity[1,"obs"], 0), nsmall = 0, big.mark = ","),
  ```
- Line 1785: city
  ```
  " & ", format(round(df_ethnicity[2,"obs"], 0), nsmall = 0, big.mark = ","),
  ```
- Line 1786: city
  ```
  " & ", format(round(df_ethnicity[3,"obs"], 0), nsmall = 0, big.mark = ","),
  ```
- Line 1787: city
  ```
  " & ", format(round(df_ethnicity[4,"obs"], 0), nsmall = 0, big.mark = ","),
  ```
- Line 1788: city
  ```
  " & ", format(round(df_ethnicity[5,"obs"], 0), nsmall = 0, big.mark = ","),
  ```
- Line 1789: city
  ```
  " & ", format(round(df_ethnicity[6,"obs"], 0), nsmall = 0, big.mark = ","),
  ```
- Line 1792: name
  ```
  file = filename, sep = "\n", append = FALSE)
  ```
- Line 1794: city
  ```
  print("Ethnicity table created successfully!")
  ```
- Line 1798: gender
  ```
  ### Table A8: Effects on salary and duration by gender  ###
  ```
- Line 1814: gender
  ```
  df_gender <- rbind(df_males_salary, df_females_salary,
  ```
- Line 1818: gender, name
  ```
  filename <- paste0(tables, "table_reg_salary_duration_con_multiple2_gender_body.tex")
  ```
- Line 1842: gender
  ```
  " & ", format(round(df_gender[1,"con1"], 3), nsmall = 3),
  ```
- Line 1843: gender
  ```
  " & ", format(round(df_gender[2,"con1"], 3), nsmall = 3),
  ```
- Line 1844: gender
  ```
  " & ", format(round(df_gender[3,"con1"], 3), nsmall = 3),
  ```
- Line 1845: gender
  ```
  " & ", format(round(df_gender[4,"con1"], 3), nsmall = 3),
  ```
- Line 1846: gender
  ```
  " & ", format(round(df_gender[5,"con1"], 3), nsmall = 3),
  ```
- Line 1847: gender
  ```
  " & ", format(round(df_gender[6,"con1"], 3), nsmall = 3),
  ```
- Line 1849: gender
  ```
  paste0(" & ", "(", format(round(df_gender[1,"con1_se"], 3), nsmall = 3), ")",
  ```
- Line 1850: gender
  ```
  " & ", "(", format(round(df_gender[2,"con1_se"], 3), nsmall = 3), ")",
  ```
- Line 1851: gender
  ```
  " & ", "(", format(round(df_gender[3,"con1_se"], 3), nsmall = 3), ")",
  ```
- Line 1852: gender
  ```
  " & ", "(", format(round(df_gender[4,"con1_se"], 3), nsmall = 3), ")",
  ```
- Line 1853: gender
  ```
  " & ", "(", format(round(df_gender[5,"con1_se"], 3), nsmall = 3), ")",
  ```
- Line 1854: gender
  ```
  " & ", "(", format(round(df_gender[6,"con1_se"], 3), nsmall = 3), ")",
  ```
- Line 1858: gender
  ```
  " & ", format(round(df_gender[1,"con2"], 3), nsmall = 3),
  ```
- Line 1859: gender
  ```
  " & ", format(round(df_gender[2,"con2"], 3), nsmall = 3),
  ```
- Line 1860: gender
  ```
  " & ", format(round(df_gender[3,"con2"], 3), nsmall = 3),
  ```
- Line 1861: gender
  ```
  " & ", format(round(df_gender[4,"con2"], 3), nsmall = 3),
  ```
- Line 1862: gender
  ```
  " & ", format(round(df_gender[5,"con2"], 3), nsmall = 3),
  ```
- Line 1863: gender
  ```
  " & ", format(round(df_gender[6,"con2"], 3), nsmall = 3),
  ```
- Line 1865: gender
  ```
  paste0(" & ", "(", format(round(df_gender[1,"con2_se"], 3), nsmall = 3), ")",
  ```
- Line 1866: gender
  ```
  " & ", "(", format(round(df_gender[2,"con2_se"], 3), nsmall = 3), ")",
  ```
- Line 1867: gender
  ```
  " & ", "(", format(round(df_gender[3,"con2_se"], 3), nsmall = 3), ")",
  ```
- Line 1868: gender
  ```
  " & ", "(", format(round(df_gender[4,"con2_se"], 3), nsmall = 3), ")",
  ```
- Line 1869: gender
  ```
  " & ", "(", format(round(df_gender[5,"con2_se"], 3), nsmall = 3), ")",
  ```
- Line 1870: gender
  ```
  " & ", "(", format(round(df_gender[6,"con2_se"], 3), nsmall = 3), ")",
  ```
- Line 1874: gender
  ```
  " & ", format(round(df_gender[1,"con3"], 3), nsmall = 3),
  ```
- Line 1875: gender
  ```
  " & ", format(round(df_gender[2,"con3"], 3), nsmall = 3),
  ```
- Line 1876: gender
  ```
  " & ", format(round(df_gender[3,"con3"], 3), nsmall = 3),
  ```
- Line 1877: gender
  ```
  " & ", format(round(df_gender[4,"con3"], 3), nsmall = 3),
  ```
- Line 1878: gender
  ```
  " & ", format(round(df_gender[5,"con3"], 3), nsmall = 3),
  ```
- Line 1879: gender
  ```
  " & ", format(round(df_gender[6,"con3"], 3), nsmall = 3),
  ```
- Line 1881: gender
  ```
  paste0(" & ", "(", format(round(df_gender[1,"con3_se"], 3), nsmall = 3), ")",
  ```
- Line 1882: gender
  ```
  " & ", "(", format(round(df_gender[2,"con3_se"], 3), nsmall = 3), ")",
  ```
- Line 1883: gender
  ```
  " & ", "(", format(round(df_gender[3,"con3_se"], 3), nsmall = 3), ")",
  ```
- Line 1884: gender
  ```
  " & ", "(", format(round(df_gender[4,"con3_se"], 3), nsmall = 3), ")",
  ```
- Line 1885: gender
  ```
  " & ", "(", format(round(df_gender[5,"con3_se"], 3), nsmall = 3), ")",
  ```
- Line 1886: gender
  ```
  " & ", "(", format(round(df_gender[6,"con3_se"], 3), nsmall = 3), ")",
  ```
- Line 1890: gender
  ```
  " & ", format(round(df_gender[1,"con4"], 3), nsmall = 3),
  ```
- Line 1891: gender
  ```
  " & ", format(round(df_gender[2,"con4"], 3), nsmall = 3),
  ```
- Line 1892: gender
  ```
  " & ", format(round(df_gender[3,"con4"], 3), nsmall = 3),
  ```
- Line 1893: gender
  ```
  " & ", format(round(df_gender[4,"con4"], 3), nsmall = 3),
  ```
- Line 1894: gender
  ```
  " & ", format(round(df_gender[5,"con4"], 3), nsmall = 3),
  ```
- Line 1895: gender
  ```
  " & ", format(round(df_gender[6,"con4"], 3), nsmall = 3),
  ```
- Line 1897: gender
  ```
  paste0(" & ", "(", format(round(df_gender[1,"con4_se"], 3), nsmall = 3), ")",
  ```
- Line 1898: gender
  ```
  " & ", "(", format(round(df_gender[2,"con4_se"], 3), nsmall = 3), ")",
  ```
- Line 1899: gender
  ```
  " & ", "(", format(round(df_gender[3,"con4_se"], 3), nsmall = 3), ")",
  ```
- Line 1900: gender
  ```
  " & ", "(", format(round(df_gender[4,"con4_se"], 3), nsmall = 3), ")",
  ```
- Line 1901: gender
  ```
  " & ", "(", format(round(df_gender[5,"con4_se"], 3), nsmall = 3), ")",
  ```
- Line 1902: gender
  ```
  " & ", "(", format(round(df_gender[6,"con4_se"], 3), nsmall = 3), ")",
  ```
- Line 1906: gender
  ```
  " & ", format(round(df_gender[1,"con5"], 3), nsmall = 3),
  ```
- Line 1907: gender
  ```
  " & ", format(round(df_gender[2,"con5"], 3), nsmall = 3),
  ```
- Line 1908: gender
  ```
  " & ", format(round(df_gender[3,"con5"], 3), nsmall = 3),
  ```
- Line 1909: gender
  ```
  " & ", format(round(df_gender[4,"con5"], 3), nsmall = 3),
  ```
- Line 1910: gender
  ```
  " & ", format(round(df_gender[5,"con5"], 3), nsmall = 3),
  ```
- Line 1911: gender
  ```
  " & ", format(round(df_gender[6,"con5"], 3), nsmall = 3),
  ```
- Line 1913: gender
  ```
  paste0(" & ", "(", format(round(df_gender[1,"con5_se"], 3), nsmall = 3), ")",
  ```
- Line 1914: gender
  ```
  " & ", "(", format(round(df_gender[2,"con5_se"], 3), nsmall = 3), ")",
  ```
- Line 1915: gender
  ```
  " & ", "(", format(round(df_gender[3,"con5_se"], 3), nsmall = 3), ")",
  ```
- Line 1916: gender
  ```
  " & ", "(", format(round(df_gender[4,"con5_se"], 3), nsmall = 3), ")",
  ```
- Line 1917: gender
  ```
  " & ", "(", format(round(df_gender[5,"con5_se"], 3), nsmall = 3), ")",
  ```
- Line 1918: gender
  ```
  " & ", "(", format(round(df_gender[6,"con5_se"], 3), nsmall = 3), ")",
  ```
- Line 1922: gender
  ```
  " & ", format(round(df_gender[1,"con6"], 3), nsmall = 3),
  ```
- Line 1923: gender
  ```
  " & ", format(round(df_gender[2,"con6"], 3), nsmall = 3),
  ```
- Line 1924: gender
  ```
  " & ", format(round(df_gender[3,"con6"], 3), nsmall = 3),
  ```
- Line 1925: gender
  ```
  " & ", format(round(df_gender[4,"con6"], 3), nsmall = 3),
  ```
- Line 1926: gender
  ```
  " & ", format(round(df_gender[5,"con6"], 3), nsmall = 3),
  ```
- Line 1927: gender
  ```
  " & ", format(round(df_gender[6,"con6"], 3), nsmall = 3),
  ```
- Line 1929: gender
  ```
  paste0(" & ", "(", format(round(df_gender[1,"con6_se"], 3), nsmall = 3), ")",
  ```
- Line 1930: gender
  ```
  " & ", "(", format(round(df_gender[2,"con6_se"], 3), nsmall = 3), ")",
  ```
- Line 1931: gender
  ```
  " & ", "(", format(round(df_gender[3,"con6_se"], 3), nsmall = 3), ")",
  ```
- Line 1932: gender
  ```
  " & ", "(", format(round(df_gender[4,"con6_se"], 3), nsmall = 3), ")",
  ```
- Line 1933: gender
  ```
  " & ", "(", format(round(df_gender[5,"con6_se"], 3), nsmall = 3), ")",
  ```
- Line 1934: gender
  ```
  " & ", "(", format(round(df_gender[6,"con6_se"], 3), nsmall = 3), ")",
  ```
- Line 1938: gender
  ```
  " & ", format(round(df_gender[1,"con7"], 3), nsmall = 3),
  ```
- Line 1939: gender
  ```
  " & ", format(round(df_gender[2,"con7"], 3), nsmall = 3),
  ```
- Line 1940: gender
  ```
  " & ", format(round(df_gender[3,"con7"], 3), nsmall = 3),
  ```
- Line 1941: gender
  ```
  " & ", format(round(df_gender[4,"con7"], 3), nsmall = 3),
  ```
- Line 1942: gender
  ```
  " & ", format(round(df_gender[5,"con7"], 3), nsmall = 3),
  ```
- Line 1943: gender
  ```
  " & ", format(round(df_gender[6,"con7"], 3), nsmall = 3),
  ```
- Line 1945: gender
  ```
  paste0(" & ", "(", format(round(df_gender[1,"con7_se"], 3), nsmall = 3), ")",
  ```
- Line 1946: gender
  ```
  " & ", "(", format(round(df_gender[2,"con7_se"], 3), nsmall = 3), ")",
  ```
- Line 1947: gender
  ```
  " & ", "(", format(round(df_gender[3,"con7_se"], 3), nsmall = 3), ")",
  ```
- Line 1948: gender
  ```
  " & ", "(", format(round(df_gender[4,"con7_se"], 3), nsmall = 3), ")",
  ```
- Line 1949: gender
  ```
  " & ", "(", format(round(df_gender[5,"con7_se"], 3), nsmall = 3), ")",
  ```
- Line 1950: gender
  ```
  " & ", "(", format(round(df_gender[6,"con7_se"], 3), nsmall = 3), ")",
  ```
- Line 1954: gender
  ```
  " & ", format(round(df_gender[1,"con8"], 3), nsmall = 3),
  ```
- Line 1955: gender
  ```
  " & ", format(round(df_gender[2,"con8"], 3), nsmall = 3),
  ```
- Line 1956: gender
  ```
  " & ", format(round(df_gender[3,"con8"], 3), nsmall = 3),
  ```
- Line 1957: gender
  ```
  " & ", format(round(df_gender[4,"con8"], 3), nsmall = 3),
  ```
- Line 1958: gender
  ```
  " & ", format(round(df_gender[5,"con8"], 3), nsmall = 3),
  ```
- Line 1959: gender
  ```
  " & ", format(round(df_gender[6,"con8"], 3), nsmall = 3),
  ```
- Line 1961: gender
  ```
  paste0(" & ", "(", format(round(df_gender[1,"con8_se"], 3), nsmall = 3), ")",
  ```
- Line 1962: gender
  ```
  " & ", "(", format(round(df_gender[2,"con8_se"], 3), nsmall = 3), ")",
  ```
- Line 1963: gender
  ```
  " & ", "(", format(round(df_gender[3,"con8_se"], 3), nsmall = 3), ")",
  ```
- Line 1964: gender
  ```
  " & ", "(", format(round(df_gender[4,"con8_se"], 3), nsmall = 3), ")",
  ```
- Line 1965: gender
  ```
  " & ", "(", format(round(df_gender[5,"con8_se"], 3), nsmall = 3), ")",
  ```
- Line 1966: gender
  ```
  " & ", "(", format(round(df_gender[6,"con8_se"], 3), nsmall = 3), ")",
  ```
- Line 1972: gender
  ```
  " & ", format(round(df_gender[1,"diff41"], 3), nsmall = 3),
  ```
- Line 1973: gender
  ```
  " & ", format(round(df_gender[2,"diff41"], 3), nsmall = 3),
  ```
- Line 1974: gender
  ```
  " & ", format(round(df_gender[3,"diff41"], 3), nsmall = 3),
  ```
- Line 1975: gender
  ```
  " & ", format(round(df_gender[4,"diff41"], 3), nsmall = 3),
  ```
- Line 1976: gender
  ```
  " & ", format(round(df_gender[5,"diff41"], 3), nsmall = 3),
  ```
- Line 1977: gender
  ```
  " & ", format(round(df_gender[6,"diff41"], 3), nsmall = 3),
  ```
- Line 1979: gender
  ```
  paste0(" & ", "(", format(round(df_gender[1,"diff41_se"], 3), nsmall = 3), ")",
  ```
- Line 1980: gender
  ```
  " & ", "(", format(round(df_gender[2,"diff41_se"], 3), nsmall = 3), ")",
  ```
- Line 1981: gender
  ```
  " & ", "(", format(round(df_gender[3,"diff41_se"], 3), nsmall = 3), ")",
  ```
- Line 1982: gender
  ```
  " & ", "(", format(round(df_gender[4,"diff41_se"], 3), nsmall = 3), ")",
  ```
- Line 1983: gender
  ```
  " & ", "(", format(round(df_gender[5,"diff41_se"], 3), nsmall = 3), ")",
  ```
- Line 1984: gender
  ```
  " & ", "(", format(round(df_gender[6,"diff41_se"], 3), nsmall = 3), ")",
  ```
- Line 1988: gender
  ```
  " & ", format(round(df_gender[1,"diff52"], 3), nsmall = 3),
  ```
- Line 1989: gender
  ```
  " & ", format(round(df_gender[2,"diff52"], 3), nsmall = 3),
  ```
- Line 1990: gender
  ```
  " & ", format(round(df_gender[3,"diff52"], 3), nsmall = 3),
  ```
- Line 1991: gender
  ```
  " & ", format(round(df_gender[4,"diff52"], 3), nsmall = 3),
  ```
- Line 1992: gender
  ```
  " & ", format(round(df_gender[5,"diff52"], 3), nsmall = 3),
  ```
- Line 1993: gender
  ```
  " & ", format(round(df_gender[6,"diff52"], 3), nsmall = 3),
  ```
- Line 1995: gender
  ```
  paste0(" & ", "(", format(round(df_gender[1,"diff52_se"], 3), nsmall = 3), ")",
  ```
- Line 1996: gender
  ```
  " & ", "(", format(round(df_gender[2,"diff52_se"], 3), nsmall = 3), ")",
  ```
- Line 1997: gender
  ```
  " & ", "(", format(round(df_gender[3,"diff52_se"], 3), nsmall = 3), ")",
  ```
- Line 1998: gender
  ```
  " & ", "(", format(round(df_gender[4,"diff52_se"], 3), nsmall = 3), ")",
  ```
- Line 1999: gender
  ```
  " & ", "(", format(round(df_gender[5,"diff52_se"], 3), nsmall = 3), ")",
  ```
- Line 2000: gender
  ```
  " & ", "(", format(round(df_gender[6,"diff52_se"], 3), nsmall = 3), ")",
  ```
- Line 2004: gender
  ```
  " & ", format(round(df_gender[1,"diff63"], 3), nsmall = 3),
  ```
- Line 2005: gender
  ```
  " & ", format(round(df_gender[2,"diff63"], 3), nsmall = 3),
  ```
- Line 2006: gender
  ```
  " & ", format(round(df_gender[3,"diff63"], 3), nsmall = 3),
  ```
- Line 2007: gender
  ```
  " & ", format(round(df_gender[4,"diff63"], 3), nsmall = 3),
  ```
- Line 2008: gender
  ```
  " & ", format(round(df_gender[5,"diff63"], 3), nsmall = 3),
  ```
- Line 2009: gender
  ```
  " & ", format(round(df_gender[6,"diff63"], 3), nsmall = 3),
  ```
- Line 2011: gender
  ```
  paste0(" & ", "(", format(round(df_gender[1,"diff63_se"], 3), nsmall = 3), ")",
  ```
- Line 2012: gender
  ```
  " & ", "(", format(round(df_gender[2,"diff63_se"], 3), nsmall = 3), ")",
  ```
- Line 2013: gender
  ```
  " & ", "(", format(round(df_gender[3,"diff63_se"], 3), nsmall = 3), ")",
  ```
- Line 2014: gender
  ```
  " & ", "(", format(round(df_gender[4,"diff63_se"], 3), nsmall = 3), ")",
  ```
- Line 2015: gender
  ```
  " & ", "(", format(round(df_gender[5,"diff63_se"], 3), nsmall = 3), ")",
  ```
- Line 2016: gender
  ```
  " & ", "(", format(round(df_gender[6,"diff63_se"], 3), nsmall = 3), ")",
  ```
- Line 2022: gender
  ```
  " & ", format(round(df_gender[1,"y0"], 3), nsmall = 3),
  ```
- Line 2023: gender
  ```
  " & ", format(round(df_gender[2,"y0"], 3), nsmall = 3),
  ```
- Line 2024: gender
  ```
  " & ", format(round(df_gender[3,"y0"], 3), nsmall = 3),
  ```
- Line 2025: gender
  ```
  " & ", format(round(df_gender[4,"y0"], 3), nsmall = 3),
  ```
- Line 2026: gender
  ```
  " & ", format(round(df_gender[5,"y0"], 3), nsmall = 3),
  ```
- Line 2027: gender
  ```
  " & ", format(round(df_gender[6,"y0"], 3), nsmall = 3),
  ```
- Line 2031: gender
  ```
  " & ", format(round(df_gender[1,"obs"], 0), nsmall = 0, big.mark = ","),
  ```
- Line 2032: gender
  ```
  " & ", format(round(df_gender[2,"obs"], 0), nsmall = 0, big.mark = ","),
  ```
- Line 2033: gender
  ```
  " & ", format(round(df_gender[3,"obs"], 0), nsmall = 0, big.mark = ","),
  ```
- Line 2034: gender
  ```
  " & ", format(round(df_gender[4,"obs"], 0), nsmall = 0, big.mark = ","),
  ```
- Line 2035: gender
  ```
  " & ", format(round(df_gender[5,"obs"], 0), nsmall = 0, big.mark = ","),
  ```
- Line 2036: gender
  ```
  " & ", format(round(df_gender[6,"obs"], 0), nsmall = 0, big.mark = ","),
  ```
- Line 2039: name
  ```
  file = filename, sep = "\n", append = FALSE)
  ```

**/replication-package/labor_networks/code/output/master_output.R**

- Line 26: name
  ```
  if (!requireNamespace(p, quietly = TRUE))
  ```
- Line 33: name
  ```
  ## `csv_btl`); define both so either name resolves to the mode's folder.
  ```
- Line 39: lat
  ```
  SIMULATED <- identical(run_mode, "A")
  ```
- Line 40: lat
  ```
  ylim_s   <- function(lo, hi) if (SIMULATED) NULL else ggplot2::ylim(lo, hi)
  ```
- Line 41: lat
  ```
  ylim_c_s <- function(lo, hi) if (SIMULATED) ggplot2::scale_y_continuous() else
  ```
- Line 48: lat
  ```
  message("== Building figures (SIMULATED = ", SIMULATED, ") ==")
  ```

**/replication-package/labor_networks/code/simulate/master_simulate.R**

- Line 2: lat
  ```
  ## master_simulate.R  --  STAGE 0 driver (synthetic raw data)
  ```
- Line 14: lat
  ```
  ## >>> ALL tunable simulation parameters live in section 3. This is the only
  ```
- Line 21: name
  ```
  if (!requireNamespace(p, quietly = TRUE))
  ```
- Line 27: lat
  ```
  ## ---- 2. SIMULATION PARAMETERS  (the ONLY place to edit) -----------------
  ```
- Line 32: child
  ```
  n_families      <- 60000    # families with linked children (parent-child links)
  ```
- Line 33: lat
  ```
  extra_adults    <- 60000    # unrelated adults (parents' co-worker pool)
  ```
- Line 36: loc
  ```
  n_cities        <- 100      # locality codes (setl_mid_point.xlsx must cover)
  ```
- Line 44: birth
  ```
  par_birth_min   <- 1930     # parents' birth-year range (older -> more 50+ workers for retirement fi
  ```
- Line 45: birth
  ```
  par_birth_max   <- 1968
  ```
- Line 46: child, father
  ```
  kid_gap_min     <- 24       # child born this many years after the father ...
  ```
- Line 48: birth, child
  ```
  kid_birth_min   <- 1978     # ... then clamped into this child cohort
  ```
- Line 49: birth
  ```
  kid_birth_max   <- 1993
  ```
- Line 50: birth, lat
  ```
  adult_birth_min <- 1930     # extra-adult birth-year range (older -> populate retirement ages)
  ```
- Line 51: birth
  ```
  adult_birth_max <- 1970
  ```
- Line 63: child
  ```
  min_firm_size   <- 2        # allow genuinely small firms (child + 1 contact)
  ```
- Line 70: lat
  ```
  ## -- population shares --
  ```
- Line 78: district
  ```
  n_districts     <- 7
  ```
- Line 79: district
  ```
  n_subdistricts  <- 15
  ```
- Line 81: birth, country
  ```
  n_foreign_countries <- 10   # foreign birth-country codes 101:(100 + n_foreign_countries)
  ```
- Line 85: lat
  ```
  ## (population first: the other generators read it back to keep the id universe
  ```
- Line 91: birth
  ```
  "par_birth_min","par_birth_max","kid_gap_min","kid_gap_max",
  ```
- Line 92: birth
  ```
  "kid_birth_min","kid_birth_max","adult_birth_min","adult_birth_max",
  ```
- Line 97: district
  ```
  "n_districts","n_subdistricts","n_neighborhoods","n_foreign_countries")
  ```
- Line 100: lat
  ```
  message("== [1/6] all_population.dta ==");            source(paste0(process_simulate, "simulate_all_
  ```
- Line 101: lat
  ```
  message("== [2/6] hardi.dta ==");                     source(paste0(process_simulate, "simulate_hard
  ```
- Line 102: lat
  ```
  message("== [3/6] sachar/sachar_<year>.dta ==");      source(paste0(process_simulate, "simulate_wage
  ```
- Line 103: lat, loc, location
  ```
  message("== [4/6] ktovat/ktovet_<year>.dta ==");      source(paste0(process_simulate, "simulate_loca
  ```
- Line 104: lat
  ```
  message("== [5/6] limodim.dta ==");                   source(paste0(process_simulate, "simulate_educ
  ```
- Line 105: birth, country, lat
  ```
  message("== [6/6] excel crosswalks (birth_country, institutions, setl_mid_point, sectors) =="); sour
  ```

**/replication-package/labor_networks/code/simulate/simulate_all_population.R**

- Line 2: lat
  ```
  ## simulate_all_population.R
  ```
- Line 3: lat, name
  ```
  ## Synthetic raw all_population.dta with RAW column names for prepare_population.R.
  ```
- Line 12: birth
  ```
  if (!exists("par_birth_min"))   par_birth_min   <- 1950
  ```
- Line 13: birth
  ```
  if (!exists("par_birth_max"))   par_birth_max   <- 1968
  ```
- Line 16: birth
  ```
  if (!exists("kid_birth_min"))   kid_birth_min   <- 1978
  ```
- Line 17: birth
  ```
  if (!exists("kid_birth_max"))   kid_birth_max   <- 1993
  ```
- Line 18: birth
  ```
  if (!exists("adult_birth_min")) adult_birth_min <- 1950
  ```
- Line 19: birth
  ```
  if (!exists("adult_birth_max")) adult_birth_max <- 1970
  ```
- Line 29: father, mother
  ```
  ## ---- 1. Parents: one father + one mother per family ----
  ```
- Line 34: birth
  ```
  dad_by <- sample(par_birth_min:par_birth_max, n_families, replace = TRUE)
  ```
- Line 45: child, father, mother
  ```
  ## ---- 2. Children: linked to a father & mother ----
  ```
- Line 52: birth
  ```
  kid_by  <- pmin(kid_birth_max, pmax(kid_birth_min,
  ```
- Line 56: child
  ```
  children <- data.table(
  ```
- Line 71: birth
  ```
  yy_leda = sample(adult_birth_min:adult_birth_max, extra_adults, replace = TRUE)
  ```
- Line 75: child, name
  ```
  df <- rbindlist(list(parents, children, extra), use.names = TRUE)
  ```
- Line 83: birth, country
  ```
  ## birth_country (ealia): 0 = Israel-born (native). foreign codes 101:(100+n).
  ```
- Line 84: birth, country
  ```
  ## birth_country.xlsx MUST map ealia==0 -> birth_region1==4 and foreign -> != 4.
  ```
- Line 94: birth
  ```
  df[, dead := (yy_leda <= par_birth_max) & (runif(N) < death_share)]
  ```
- Line 104: lat
  ```
  write_dta(df, paste0(raw, "all_population.dta"))
  ```
- Line 105: child, lat, son
  ```
  message(sprintf("Wrote all_population.dta : %d persons (%d parents, %d children, %d extra adults)",
  ```

**/replication-package/labor_networks/code/simulate/simulate_crosswalks.R**

- Line 2: lat
  ```
  ## simulate_crosswalks.R
  ```
- Line 18: birth, country
  ```
  ## ---- 1. birth_country.xlsx (sheet "data") ----
  ```
- Line 21: birth, country
  ```
  birth_country <- data.table(
  ```
- Line 22: birth, country
  ```
  birth_country     = c(0L, foreign_codes),
  ```
- Line 23: birth, country
  ```
  birth_country_heb = c("Israel", paste0("Country_", foreign_codes)),
  ```
- Line 24: birth
  ```
  birth_region1     = c(4L, sample(1:3, n_foreign_countries, replace = TRUE))
  ```
- Line 26: birth, country
  ```
  write_xlsx(list(data = as.data.frame(birth_country)),
  ```
- Line 27: birth, country
  ```
  paste0(excel, "birth_country.xlsx"))
  ```
- Line 37: name
  ```
  ## ---- 3. setl_mid_point.xlsx (X, Y, setl_name_ltn, setl_code) ----
  ```
- Line 41: loc, name
  ```
  setl_name_ltn= paste0("Locality_", 1:n_cities),
  ```
- Line 54: name
  ```
  main_sectors       <- data.table(main_sector = 1:10, main_sector_name = paste0("Sector_", 1:10))
  ```
- Line 65: birth, country
  ```
  message("Wrote crosswalks: birth_country.xlsx, educational_institutions_classification.xlsx, ",
  ```

**/replication-package/labor_networks/code/simulate/simulate_education.R**

- Line 2: lat
  ```
  ## simulate_education.R
  ```
- Line 11: birth
  ```
  if (!exists("kid_birth_min"))  kid_birth_min  <- 1978
  ```
- Line 14: lat
  ```
  pop <- as.data.table(read_dta(paste0(raw, "all_population.dta")))
  ```
- Line 15: birth
  ```
  pop <- pop[, .(tz, birth_year = yy_leda)]
  ```
- Line 17: birth
  ```
  young <- pop[birth_year >= kid_birth_min]
  ```
- Line 22: birth
  ```
  edu[, mtar_lim  := as.Date(paste0(birth_year + start_age,             "-10-01"))]
  ```
- Line 23: birth
  ```
  edu[, adtar_lim := as.Date(paste0(birth_year + start_age + dur_years, "-06-30"))]
  ```

**/replication-package/labor_networks/code/simulate/simulate_hardi.R**

- Line 2: lat
  ```
  ## simulate_hardi.R
  ```
- Line 12: lat
  ```
  pop <- as.data.table(read_dta(paste0(raw, "all_population.dta")))
  ```

**/replication-package/labor_networks/code/simulate/simulate_location.R**

- Line 2: lat, loc, location
  ```
  ## simulate_location.R
  ```
- Line 12: district
  ```
  if (!exists("n_districts"))     n_districts     <- 7
  ```
- Line 13: district
  ```
  if (!exists("n_subdistricts"))  n_subdistricts  <- 15
  ```
- Line 18: lat
  ```
  pop <- as.data.table(read_dta(paste0(raw, "all_population.dta")))
  ```
- Line 21: loc
  ```
  loc <- data.table(
  ```
- Line 23: city
  ```
  city        = sample(1:n_cities,        length(ids), replace = TRUE),
  ```
- Line 24: district
  ```
  district    = sample(1:n_districts,     length(ids), replace = TRUE),
  ```
- Line 25: district
  ```
  subdistrict = sample(1:n_subdistricts,  length(ids), replace = TRUE),
  ```
- Line 30: loc
  ```
  out <- copy(loc)
  ```
- Line 31: city, district, name
  ```
  setnames(out, c("district","subdistrict","city","neighborhood"),
  ```
- Line 35: son
  ```
  message(sprintf("Wrote %d yearly ktovet files (%d-%d) for %d persons, cities 1:%d.",
  ```

**/replication-package/labor_networks/code/simulate/simulate_wages.R**

- Line 2: lat
  ```
  ## simulate_wages.R
  ```
- Line 3: name
  ```
  ## Synthetic raw sachar/sachar_<year>.dta (one per year), RAW column names.
  ```
- Line 8: child
  ```
  ## => a smooth size distribution: many small firms (single child-hire per year,
  ```
- Line 11: child
  ```
  ##    exists has at least `min_firm_size` workers (so a hired child has a contact).
  ```
- Line 26: child
  ```
  if (!exists("min_firm_size")) min_firm_size <- 3     # min workers per firm-year (child + >=1 contac
  ```
- Line 31: lat
  ```
  pop <- as.data.table(read_dta(paste0(raw, "all_population.dta")))
  ```
- Line 32: birth
  ```
  pop <- pop[, .(id = tz, birth_year = yy_leda)]
  ```
- Line 33: birth
  ```
  pop <- pop[!is.na(id) & !is.na(birth_year)]
  ```
- Line 47: son
  ```
  ## person-year records over the working ages, with a per-person career-start
  ```
- Line 54: son
  ```
  ## per-person RETIREMENT age: people stop working at a retirement age drawn
  ```
- Line 64: birth
  ```
  yrs <- years_wage[years_wage - birth_year >= age_lo + start_delay &
  ```
- Line 65: birth
  ```
  years_wage - birth_year <= pmin(age_hi, retire_age)]
  ```
- Line 67: birth
  ```
  }, by = .(id, birth_year, start_delay, retire_age)]
  ```
- Line 68: birth
  ```
  py[, c("birth_year", "start_delay", "retire_age") := NULL]
  ```
- Line 70: son
  ```
  ## assign a firm to each person-year, weighted by firm size, with persistence
  ```
- Line 79: child
  ```
  ## (so every firm-year that remains can host a hired child AND a contact)
  ```
- Line 89: name
  ```
  month_names <- sprintf("sah_hs%02d", 1:12)
  ```
- Line 90: name
  ```
  py[, (month_names) := 1L]
  ```
- Line 92: name
  ```
  ## write one raw .dta per year (raw column names)
  ```
- Line 93: name
  ```
  setnames(py, c("id","id_firm","industry","yearly_salary"),
  ```
- Line 96: name
  ```
  out <- py[year == t, c("tz","s_total","id_maavid","anaf", month_names, "year"), with = FALSE]
  ```
- Line 99: son
  ```
  message(sprintf("Wrote %d yearly sachar files (%d-%d), %d firms, %d person-year rows.",
  ```

