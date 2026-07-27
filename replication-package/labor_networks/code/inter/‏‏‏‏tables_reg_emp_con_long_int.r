# open log file								
today <- today()								
filename <- paste0(log, "reg_emp_con_long_int_",today,".txt")								
sink(file = filename,split = TRUE)								

source(paste0(process, "functions_reg_emp_con_long.R"))								

set.seed(12345)								

				
bin_vars = c("gap")

table = vector(mode = "list", length = length(bin_vars))								

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
  
  list1 <- get.reg.emp.con.data.int(df_children)								
  
  df_reg_firm =  list1[[1]]
  df_connections_long_firm = list1[[2]]
  rm(list1)
  for (k in 1:length(bin_vars)){								
    bin_var = bin_vars[k]								
    print(bin_var)
    table_temp <- run.reg.emp.con.long.figure(df_reg = df_reg_firm ,df_connections_long = df_connections_long_firm,bin_var = bin_var,bins = 10)								
    df_connections_long_firm[,bin_var := NULL]								
    df_connections_long_firm[,bin := NULL]								
    if (b == 1){								
      table[[k]] <- table_temp								
    }								
    if (b > 1) {								
      table[[k]] <- rbind(table[[k]],table_temp)								
    }								
    rm(table_temp)								
    
  }								
  
  filename <- paste0(data, "reg_emp_con_long_int.Rdata")								
  save(table,file = filename)		
  
}								




filename <- paste0(data, "reg_emp_con_long_int.Rdata")								
load(filename)		


for (k in 1:length(bin_vars)){								
  
  table_k <- prepare.reg.emp.con.table.long.figure(table[[k]],bin_vars[k]		)
  
  if (k == 1) {								
    table1 <- t(table_k)								
  } else								
    table1 <-rbind(table1,t(table_k[,2]))							
}	
table1 <- data.table(table1)
# export the table								
filename <- paste0(output, "figure_reg_emp_con_long_int.csv")								
fwrite(table1,filename,col.names = F)		
rm(table,table1,table_k)

