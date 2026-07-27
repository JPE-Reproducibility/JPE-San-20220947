# open log file
today <- today()
filename <- paste0(log, "reg_balancing_",today,".txt")
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
  df_children <- df_children[V1 < 0.02 ]
  df_children[,V1 := NULL]
  
  df_reg <- get.reg.balancing.data(df_children)
  rm(df_children)
  
  ## table xx
  
  # log distance
  
  table_temp <- run.reg.emp.con(df_reg,'log_distance')
  
  if (b == 1){table1 <- table_temp}
  if (b > 1) {table1 <- rbind(table1,table_temp)}
  
  # same industry
  table_temp <- run.reg.emp.con(df_reg,'same_industry')
  
  if (b == 1){table2 <- table_temp}
  if (b > 1) {table2 <- rbind(table2,table_temp)}
  
  # remove the reg data
  rm(df_reg)
  
  # save the tables
  filename <- paste0(data, "reg_balancing.Rdata")
  save(table1,table2,file = filename)
}

filename <- paste0(data, "reg_balancing.Rdata")
load(filename)

## get statistics
filename <- paste0(data, "children_sample.Rdata")
load(filename)
df_children <- df
rm(df)

stat1 <- get.statistics(df_children)

## prepare the regression tables

table1 <- prepare.reg.emp.con.table(table1)
table2 <- prepare.reg.emp.con.table(table2)

table1 <- cbind(table1,stat1)
table2 <- cbind(table2,stat1)

table <- rbind(table1,table2)

# export the table
filename <- paste0(output, "table_reg_balancing.csv")
write.csv(table,filename)
