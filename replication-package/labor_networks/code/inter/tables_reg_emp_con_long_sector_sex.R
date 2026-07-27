# open log file								
today <- today()								
filename <- paste0(log, "reg_emp_con_long_sector_sex_",today,".txt")								
sink(file = filename,split = TRUE)								

source(paste0(process, "functions_reg_emp_con_long.R"))								

set.seed(12345)								



table = vector(mode = "list", length = 1)

B = 100					
for (b in 1:B) {								
  
  #take 10% of children								
  print('b = ')								
  print(b)								
  
  # load the children sample								
  filename <- paste0(data, "children_sample.Rdata")								
  load(filename)								
  df_children <- df								
  rm(df)								
  
  
  df_children = cbind(df_children,data.table(runif(dim(df_children)[1])))								
  df_children <- df_children[V1 < 0.1 ]								
  df_children[,V1 := NULL]								
  
  list1 <- get.reg.emp.con.data.firm(df_children)								
  
  df_reg_firm =  list1[[1]]
  df_connections_long_firm = list1[[2]]
  df_connections_long_firm = merge(df_connections_long_firm,df_children[,.(id,sex)], by = "id")
  df_connections_long_firm[,main_sector_sex := main_sector + sex*10]
  
  rm(list1)
    bin_var = "main_sector_sex"

    table_temp <- run.reg.emp.con.long.figure(df_reg = df_reg_firm ,df_connections_long = df_connections_long_firm,bin_var = bin_var,bins = NULL)								
    
    df_connections_long_firm[,bin_var := NULL]								
    df_connections_long_firm[,bin := NULL]								
    if (b == 1){								
      table<- table_temp								
    }								
    if (b > 1) {								
      table <- rbind(table,table_temp)								
    }								
    rm(table_temp)								
    
  								
  filename <- paste0(data, "reg_emp_con_long_sector_sex.Rdata")								
  save(table,file = filename)		
  
}								




filename <- paste0(data, "reg_emp_con_long_sector_sex.Rdata")								
load(filename)


table1 <- prepare.reg.emp.con.table.long.figure(table,bin_var = bin_var		)

table1 <- data.table(table1)

table2 <- prepare.table.sex_sector(table	)

table2 <- data.table(table2)

table = rbind(table2,table1)
# export the tables								
filename <- paste0(output, "figure_reg_emp_con_long_sector_sex.csv")								
fwrite(table,filename)		

rm(table,table1,table2)


