# open log file
today <- today()
filename <- paste0(log, "reg_emp_con_exit_",today,".txt")
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
  
  df_reg <- get.reg.emp.con.data.exit(df_children)
  rm(df_children)
  
  ## table xx
  
  # death
  
  table_temp <- run.reg.emp.con.exit(df_reg,"d")
  
  if (b == 1){table1 <- table_temp}
  if (b > 1) {table1 <- rbind(table1,table_temp)}
  
  # retirement
  
  table_temp <- run.reg.emp.con.exit(df_reg,"r")
  
  if (b == 1){table2 <- table_temp}
  if (b > 1) {table2 <- rbind(table2,table_temp)}
  
  # death or retirement
  
  table_temp <- run.reg.emp.con.exit(df_reg,"dr")
  
  if (b == 1){table3 <- table_temp}
  if (b > 1) {table3 <- rbind(table3,table_temp)}
  
  # remove the reg data
  rm(df_reg)
  
  # save the tables
  filename <- paste0(data, "reg_emp_con_exit.Rdata")
  save(table1,table2,table3,file = filename)
}

# load the tables

filename <- paste0(data, "reg_emp_con_exit.Rdata")
load(filename)


## get statistics
filename <- paste0(data, "children_sample.Rdata")
load(filename)
df_children <- df
rm(df)

stat <- get.statistics.exit(df_children)
stat1 <- stat[,.(obs,firms,groups,workers,connections,connections_3,
                 connections_10 =  connections_1d0, 
                 connections_11 =  connections_1d1, 
                 connections_20 = connections_2d0, 
                 connections_21 = connections_2d1)]
stat2 <- stat[,.(obs,firms,groups,workers,connections,connections_3,
                 connections_10 = connections_1r0,
                 connections_11 = connections_1r1,
                 connections_20 = connections_2r0, 
                 connections_21 = connections_2r1)]
stat3 <- stat[,.(obs,firms,groups,workers,connections,connections_3,
                 connections_10 = connections_1dr0,
                 connections_11 = connections_1dr1,
                 connections_20 = connections_2dr0, 
                 connections_21 = connections_2dr1)]
## prepare the regression tables

table1 <- prepare.reg.emp.con.table.exit(table1)
table2 <- prepare.reg.emp.con.table.exit(table2)
table3 <- prepare.reg.emp.con.table.exit(table3)

table1 <- cbind(table1,stat1)
table2 <- cbind(table2,stat2)
table3 <- cbind(table3,stat3)


table <- rbind(table1,table2,table3)

# export the table
filename <- paste0(output, "table_reg_emp_con_exit.csv")
write.csv(table,filename)
