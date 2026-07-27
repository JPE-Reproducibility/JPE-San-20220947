# open log file
today <- today()
filename <- paste0(log, "reg_emp_con_",today,".txt")
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
  
  # gen a list of firms with number of jobs per firm-year
  df_jobs = df_children[,.(jobs = .N), by = .(id_firm, year)]
  
  # keep 20% of children
  df_children = cbind(df_children,data.table(runif(dim(df_children)[1])))
  df_children <- df_children[V1 < 0.2]
  df_children[,V1 := NULL]
  
  
  # keep children working in a firm with more than one job per year
  df_children = merge(df_children,df_jobs, by = c("id_firm", "year"))
  df_children = df_children[jobs > 1]
  df_children[,jobs := NULL]
  
  # get the reg data
  df_reg <- get.reg.emp.con.data(df_children)
  rm(df_children,df_jobs)
  
  ## table xx
  
  # all
  
  table_temp <- run.reg.emp.con(df_reg)
  
  if (b == 1){table1 <- table_temp}
  if (b > 1) {table1 <- rbind(table1,table_temp)}
  

  ## Event study- all
  table_temp <- run.reg.emp.con.event(df_reg)
  
  if (b == 1){table8 <- table_temp}
  if (b > 1) {table8 <- rbind(table8,table_temp)}
  
 
  
  
  # remove the reg data
  rm(df_reg)
  
  # save the tables
  filename <- paste0(data, "reg_emp_con_multiple_jobs.Rdata")
  save(table1,
       table8,
       file = filename)
}

# load the tables

filename <- paste0(data, "reg_emp_con_multiple_jobs.Rdata")
load(filename)

## get statistics
filename <- paste0(data, "children_sample.Rdata")
load(filename)
df_children <- df
rm(df)

# drop children working in a firm with more than one job per year
df_jobs = df_children[,.(jobs = .N), by = .(id_firm, year)]
df_children = merge(df_children,df_jobs, by = c("id_firm", "year"))
df_children = df_children[jobs == 1]
df_children[,jobs := NULL]
rm(df_jobs)

# gen a list of firms with number of jobs per firm-year

stat1 <- get.statistics(df_children)



## prepare the regression tables

table1 <- prepare.reg.emp.con.table(table1)


table1 <- cbind(table1,stat1)



table <- rbind(table1)

# export the table
#filename <- paste0(output, "table_reg_emp_con_multiple_jobs.csv")
#write.csv(table,filename)

## prepare the event study tables

table8 <- prepare.reg.emp.con.event.table(table8)

table8 <- cbind(table8,stat1)


table <- rbind(table8)

# export the table
filename <- paste0(output, "figure_reg_emp_con_event_multiple_jobs.csv")
write.csv(table,filename)