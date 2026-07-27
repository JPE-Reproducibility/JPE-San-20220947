  # open log file
today <- today()
filename <- paste0(log, "reg_emp_con_multiple2_firm_size",today,".txt")
sink(file = filename,split = TRUE)

source(paste0(process, "functions_reg_emp_con.R"))

set.seed(12345)



B = 100
for (b in 1:B) {
#take 20% of children
  print('b = ')
  print(b)
  
  # load the children sample
  filename <- paste0(data, "children_sample.Rdata")
  load(filename)
  df_children <- df
  rm(df)
  
df_children = cbind(df_children,data.table(runif(dim(df_children)[1])))
df_children <- df_children[V1 < 0.2 ]
df_children[,V1 := NULL]


## table xx


# all

df_reg <- get.reg.emp.con.data.multiple2.firm.size(df_children,min_size = 0, max_size = log(500),type = "past")
table_temp <- run.reg.emp.con.multiple2(df_reg)
rm(df_reg)
if (b == 1){table1 <- table_temp}
if (b > 1) {table1 <- rbind(table1,table_temp)}

# past firm size - small
df_reg <- get.reg.emp.con.data.multiple2.firm.size(df_children,min_size = 0, max_size = log(200),type = "past")
table_temp <- run.reg.emp.con.multiple2(df_reg)
rm(df_reg)

if (b == 1){table2 <- table_temp}
if (b > 1) {table2 <- rbind(table2,table_temp)}


# past firm size - large
df_reg <- get.reg.emp.con.data.multiple2.firm.size(df_children,min_size = log(200), max_size = log(500),type = "past")
table_temp <- run.reg.emp.con.multiple2(df_reg)
rm(df_reg)
if (b == 1){table3 <- table_temp}
if (b > 1) {table3 <- rbind(table3,table_temp)}


# current firm size - small
df_reg <- get.reg.emp.con.data.multiple2.firm.size(df_children,min_size = 0, max_size = log(200),type = "current")
table_temp <- run.reg.emp.con.multiple2(df_reg)
rm(df_reg)

if (b == 1){ table4 <- table_temp}
if (b > 1) {table4 <- rbind(table4,table_temp)}


# current firm size - large
df_reg <- get.reg.emp.con.data.multiple2.firm.size(df_children,min_size = log(200), max_size = log(500),type = "current")
table_temp <- run.reg.emp.con.multiple2(df_reg)
rm(df_reg)

if (b == 1){ table5 <- table_temp}
if (b > 1) {table5 <- rbind(table5,table_temp)}

# save the tables
filename <- paste0(data, "reg_emp_con_multiple2_firm_size.Rdata")
save(table1,table2,table3,table4,table5,
     file = filename)
}

# load the tables

filename <- paste0(data, "reg_emp_con_multiple2_firm_size.Rdata")
load(filename)

## get statistics
filename <- paste0(data, "children_sample.Rdata")
load(filename)
df_children <- df
rm(df)

stat1 <- get.statistics.size(df_children,min_size = 0, max_size = log(500),type = "past")
stat2 <- get.statistics.size(df_children,min_size = 0, max_size = log(200),type = "past")
stat3 <- get.statistics.size(df_children,min_size = log(200), max_size = log(500),type = "past")
stat4 <- get.statistics.size(df_children,min_size = 0, max_size = log(200),type = "current")
stat5 <- get.statistics.size(df_children,min_size = log(200), max_size = log(500),type = "current")

## prepare the regression tables

table1 <- prepare.reg.emp.con.table.multiple2(table1)
table2 <- prepare.reg.emp.con.table.multiple2(table2)
table3 <- prepare.reg.emp.con.table.multiple2(table3)
table4 <- prepare.reg.emp.con.table.multiple2(table4)
table5 <- prepare.reg.emp.con.table.multiple2(table5)

table1 <- cbind(table1,stat1)
table2 <- cbind(table2,stat2)
table3 <- cbind(table3,stat3)
table4 <- cbind(table4,stat4)
table5 <- cbind(table5,stat5)



table <- rbind(table1,table2,table3,table4,table5)


# export the table
filename <- paste0(output, "table_reg_emp_con_multiple2_firm_size.csv")
write.csv(table,filename)
