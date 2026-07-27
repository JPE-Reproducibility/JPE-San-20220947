# load all wages and gen indicator for 5-500 firms
first_year <- 2006
last_year <- 2015
for (t in first_year:last_year){
  print(t)
  filename <- paste0(data, "wages_",t,".Rdata")
  load(filename)
  df <- df[, firm_size_ind := 1 ]
  df <- df[firm_size >= 5 , firm_size_ind := 2 ]
  df <- df[firm_size > 500, firm_size_ind := 3]
  df[, year := t]
  df[, c("firm_size","yearly_salary","months","real","salary_rank") := NULL]
  if (t == first_year) {
    df_wages <- df
  } else {
    df_wages <- rbind(df_wages,df)
  }
}

# collapse by id_firm year
df_wages <- df_wages[,.(workers = .N), 
                     by = c("id_firm", "year","firm_size_ind")]


# collapse by firm_size_ind year
df_wages <- df_wages[,.( firms = .N,
                          firm_size = mean(workers,na.rm = TRUE),
                         workers =  sum(workers,na.rm = TRUE)),
                         by = c("firm_size_ind", "year")]


df_wages[,share_workers := workers/sum(workers), by  =  "year"]
df_wages[,share_firms := firms/sum(firms), by  =  "year"]

# collapse by firm_size_ind 
table <- df_wages[,.( firms = mean(firms),
                         firm_size = mean(firm_size),
                         workers =  mean(workers),
                         share_workers =  mean(share_workers),
                         share_firms =  mean(share_firms)),
                     by = c("firm_size_ind")]

setorder(table,firm_size_ind)
# export the table
filename <- paste0(output, "table_summary_firms.csv")
write.csv(table,filename)