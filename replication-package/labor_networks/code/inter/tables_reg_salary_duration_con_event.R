filename <- paste0(data, "children_first_job_data.Rdata")
load(filename)
df_children <- df
rm(df)

## create groups
df_children[,group := interaction(factor(year),factor(ethnicity),sep = ":")]
df_children[,group := interaction(group,factor(age),sep = ":")]
df_children[,group := interaction(group,factor(sex),sep = ":")]
df_children[,group := interaction(group,factor(education),sep = ":")]
df_children[,group := interaction(group,factor(district),sep = ":")]

df_children <- df_children[,.(id,id_firm,year,group,salary, duration_first_job,
                              employment3,  salary3, salary_growth3,
                              same_firm3, salary_growth_same_firm3,con_type,max_lag)]

df_children[con_type == 0, max_lag:=0 ]
df_children[con_type == 3, max_lag:=0 ]

df_children[,con_int := interaction(factor(max_lag),factor(con_type),sep = ":")]

df_children[,log_salary := log(salary)]
df_children[,log_salary3 := log(salary3)]

df_children[,id_firm := factor(id_firm)]




# run the regressions

vars = c("log_salary")


count <- 0

for (k in 1:length(vars)){
  print(vars[k])
  for (s in 1:2){
    print(s)
    if (s == 1) {  
      form1 = as.formula(paste0(vars[k], "~   factor(con_int)  |
                               group | 0 |group"))
    }
    
    if (s == 2) {  
      form1 = as.formula(paste0(vars[k], "~  factor(con_int)  |
                               id_firm + group | 0 |group"))

    }
    
    
    est1 <- felm(form1,df_children)
    x = df_children[!is.na(get(vars[k])),.N, by = "id_firm"]
    
    firms = x[,.N]
    
    y0 = df_children[con_type == 0,mean(get(vars[k]),na.rm = T),]
    
    table1 = data.table(obs = est1[["N"]][1],
                        t(est1[["beta"]]),
                        t(est1[["cse"]]),
                        var = vars[k],
                        fe = s,
                        firms = firms,
                        r2 = summary(est1)[["r2"]][1],
                        pr2 = summary(est1)[["P.r.squared"]][1],
                        y0)
    
    if (count == 0){
      table <-table1
    }
    if (count > 0){
      table <- rbind(table,table1)
    }
    count <- count + 1
  } 
}



filename  <- paste0(output, "table_reg_salary_duration_con_event.csv")
write.csv(table,filename)
rm(table,table1,x,df_children)
