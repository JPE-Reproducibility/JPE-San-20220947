# open log file
today <- today()
filename <- paste0(log, "reg_emp_con_long_figure_", today, ".txt")
sink(file = filename, split = TRUE)

source(paste0(process, "functions_reg_emp_con_long_figure.R"))

set.seed(12345)

bin_vars1 = c("log_firm_size_past", "rank_total_parent", "rank_firm_parent",
              "rank_total_pco_past", "rank_firm_pco_past",
              "log_firm_size_current",
              "rank_firm_diff_parent_pco")

bin_vars2 = c("duration_past", "lag_past", "sex_child", "sex_parent", "sex_pco",
              "ethnicity_child", "ethnicity_pco", "education_child", "same_sex_child_parent",
              "same_sex_child_pco", "same_ethnicity_child_pco")

table1 = vector(mode = "list", length = length(bin_vars1))
table2 = vector(mode = "list", length = length(bin_vars2))

B = 100
for (b in 1:B) {

  # take 20% of children
  print('b = ')
  print(b)

  # load the children sample
  filename <- paste0(data, "children_sample.Rdata")
  load(filename)
  df_children <- df
  rm(df)

  df_children = cbind(df_children, data.table(runif(dim(df_children)[1])))
  df_children <- df_children[V1 < 0.2]
  df_children[, V1 := NULL]

  list1 <- get.reg.emp.con.data.long.figure(df_children)
  rm(df_children)

  for (k in 1:length(bin_vars1)) {
    bin_var = bin_vars1[k]
    print(bin_var)
    table_temp <- run.reg.emp.con.long.figure(df_reg = list1[[1]], df_connections_long = list1[[2]], bin_var = bin_var, bins = 10)
    list1[[2]][, bin_var := NULL]
    list1[[2]][, bin := NULL]
    if (b == 1) { table1[[k]] <- table_temp } else { table1[[k]] <- rbind(table1[[k]], table_temp) }
    if (b == 1) setattr(table1[[k]], "bins_list", attr(table_temp, "bins_list"))
    rm(table_temp)
  }
  filename <- paste0(data, "reg_emp_con_long_figure1.Rdata")
  save(table1, file = filename)

  for (k in 1:length(bin_vars2)) {
    bin_var = bin_vars2[k]
    print(bin_var)
    table_temp <- run.reg.emp.con.long.figure(df_reg = list1[[1]], df_connections_long = list1[[2]], bin_var = bin_var, bins = NULL)
    list1[[2]][, bin_var := NULL]
    list1[[2]][, bin := NULL]
    if (b == 1) { table2[[k]] <- table_temp } else { table2[[k]] <- rbind(table2[[k]], table_temp) }
    if (b == 1) setattr(table2[[k]], "bins_list", attr(table_temp, "bins_list"))
    rm(table_temp)
  }
  filename <- paste0(data, "reg_emp_con_long_figure2.Rdata")
  save(table2, file = filename)
}

filename <- paste0(data, "reg_emp_con_long_figure1.Rdata")
load(filename)
for (l in 1:length(table1)) {
  table_l <- prepare.reg.emp.con.table.long.figure(table1[[l]], bin_vars1[l], labs = 1:10)
  if (l == 1) table <- table_l else table <- rbind(table, table_l, fill = TRUE)
}
table <- data.table(table)
write.csv(table, paste0(output, "figure_reg_emp_con_long1.csv"))

filename <- paste0(data, "reg_emp_con_long_figure2.Rdata")
load(filename)
table <- prepare.reg.emp.con.table.long.figure(table2[[1]], bin_vars2[1], labs = 1:10)
table <- data.table(table)
write.csv(table, paste0(output, "figure_reg_emp_con_long2.csv"))

nbins3 <- (length(table2[[2]]) - 2) / 3
table <- prepare.reg.emp.con.table.long.figure(table2[[2]], bin_vars2[2], labs = 1:nbins3)
table <- data.table(table)
write.csv(table, paste0(output, "figure_reg_emp_con_long3.csv"))

table_rest <- table2[3:length(table2)]
for (l in 1:length(table_rest)) {
  table_l <- prepare.reg.emp.con.table.long.figure(table_rest[[l]], bin_vars2[2 + l], labs = 0:1)
  if (l == 1) table <- table_l else table <- rbind(table, table_l, fill = TRUE)
}
table <- data.table(table)
write.csv(table, paste0(output, "figure_reg_emp_con_long4.csv"))

sink()
