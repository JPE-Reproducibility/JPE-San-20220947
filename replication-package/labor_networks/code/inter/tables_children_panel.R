# load the data
filename <- paste0(data, "children_panel.Rdata")
load(filename)
df_wages = df
rm(df)

filename <- paste0(data, "children_first_job_data.Rdata")
load(filename)
df_children <- df
rm(df)


df_wages = merge(df_wages,df_children[,.(id,duration_first_job)], by = "id")



# create group variables 
df_wages[,group := interaction(factor(year_first_job),factor(ethnicity),sep = ":")]
df_wages[,group := interaction(group,factor(age_first_job),sep = ":")]
df_wages[,group := interaction(group,factor(sex),sep = ":")]
df_wages[,group := interaction(group,factor(education),sep = ":")]
df_wages[,group := interaction(group,factor(district),sep = ":")]

# prepare vars

df_wages[, stay := 1 * (period < duration_first_job-1 ) ]
df_wages[period >= duration_first_job, stay := NA ]

df_wages[,id_firm_first_job := factor(id_firm_first_job)]


df_wages[,log_salary := log(salary)]

df_wages[,con1 := 1 * (con_type_first_job == 1)]
df_wages[,con2 := 1 * (con_type_first_job == 2)]
df_wages[,con3 := 1 * (con_type_first_job == 3)]

df_wages[,con12 := con1 + con2]
df_wages[,con13 := con1 + con3]

df_wages[period < duration_first_job,log_salary_first_job := log_salary]

df_wages = df_wages[order(id,year)]

df_wages[,log_salary_lead := shift(log_salary, n =1 , type = "lead"), by = id]
df_wages[,year_lead := shift(year, n =1 , type = "lead"), by = id]
df_wages[year < year_lead - 1,log_salary_lead := NA]
df_wages[,wage_growth := log_salary_lead - log_salary]

df_wages[period < duration_first_job - 1,wage_growth_first_job := wage_growth]

# keep first P periods

P = 5
df_wages = df_wages[period < P]

# run the regressions

vars = c("log_salary",
         "log_salary_first_job" ,
         "wage_growth" ,
         "wage_growth_first_job",
         "stay")

count <- 0

for (k in 1:length(vars)){
  print(vars[k])
  for (s in 1:2){
    print(s)
    if (s == 1) {  
      form1 = as.formula(paste0(vars[k], "~   con1:factor(period) + con2:factor(period) + con3:factor(period) |
                                group  + period + age + year | 0 | group"))
      form2 =  as.formula(paste0(vars[k], "~   con2:factor(period) + con12:factor(period) + con3:factor(period) |
                                group  + period + age + year | 0 | group "))
      form3 = as.formula(paste0(vars[k], "~   con3:factor(period) + con13:factor(period) + con2:factor(period) |
                                group  + period + age + year | 0 | group"))
    }
    
    if (s == 2) {  
      form1 = as.formula(paste0(vars[k], "~   con1:factor(period) + con2:factor(period) + con3:factor(period) |
                                group  + period + age + year  +  id_firm| 0 | group "))
      form2 =  as.formula(paste0(vars[k], "~   con2:factor(period) + con12:factor(period) + con3:factor(period) |
                                group  + period + age + year  +  id_firm| 0 | group "))
      form3 = as.formula(paste0(vars[k], "~   con3:factor(period) + con13:factor(period) + con2:factor(period) |
                                group  + period + age + year  +  id_firm| 0 | group"))
    }
    
    
    est1 <- felm(form1,df_wages)
    est2 <- felm(form2,df_wages)
    est3 <- felm(form3,df_wages)
    
    x = df_wages[!is.na(get(vars[k])),.N, by = "id_firm"]
    
    firms_n = x[,.N]
    
    x = df_wages[!is.na(get(vars[k])),.N, by = "id"]
    
    workers_n = x[,.N]
    
    y0 = df_wages[con_type_first_job == 0,mean(get(vars[k]),na.rm = T),by = "period"][order(period)]
    
    table1 = cbind(data.table(beta = t(est1[["beta"]])),
                   data.table(beta.se = t(est1[["cse"]])),
                   data.table(beta21 = t(est2[["beta"]]))[,1:P],
                   data.table(beta21.se = t(est2[["cse"]]))[,1:P],
                   data.table(beta31 =t(est3[["beta"]]))[,1:P],
                   data.table(beta31.se =t(est3[["cse"]]))[,1:P],
                   data.table(var = vars[k]),
                   data.table(fe =s),
                   data.table(firms = firms_n),
                   data.table(workers = workers_n),
                   data.table(fe =s),
                   data.table(r2 =summary(est1)[["r2"]][1]),
                   data.table(pr2 = summary(est1)[["P.r.squared"]][1]),
                   data.table(y0=t(y0[,2])),
                   data.table(obs = est1[["N"]]))
    
    
    rm(est1,est2,est3)
    
    if (count == 0){
      table <- table1
    }
    if (count > 0){
      table <- rbind(table,table1)
    }
    count <- count + 1
  }
}



# keep first period only (for a table)

P = 1
df_wages = df_wages[period < P]

# run the regressions

vars = c("log_salary",
         "log_salary_first_job" ,
         "wage_growth" ,
         "wage_growth_first_job",
         "stay")

count <- 0

for (k in 1:length(vars)){
  print(vars[k])
  for (s in 1:2){
    print(s)
    if (s == 1) {  
      form1 = as.formula(paste0(vars[k], "~   con1 + con2 + con3 |
                                group  + period + age + year | 0 | group"))
      form2 =  as.formula(paste0(vars[k], "~   con2 + con12+ con3|
                                group  + period + age + year | 0 | group "))
      form3 = as.formula(paste0(vars[k], "~   con3 + con13 + con2 |
                                group  + period + age + year | 0 | group"))
    }
    
    if (s == 2) {  
      form1 = as.formula(paste0(vars[k], "~   con1 + con2 + con3 |
                                group  + period + age + year  +  id_firm| 0 | group "))
      form2 =  as.formula(paste0(vars[k], "~   con2 + con12+ con3|
                                group  + period + age + year  +  id_firm| 0 | group "))
      form3 = as.formula(paste0(vars[k], "~   con3 + con13 + con2 |
                                group  + period + age + year  +  id_firm| 0 | group"))
    }
    
    
    est1 <- felm(form1,df_wages)
    est2 <- felm(form2,df_wages)
    est3 <- felm(form3,df_wages)
    
    x = df_wages[!is.na(get(vars[k])),.N, by = "id_firm"]
    
    firms_n = x[,.N]
    
    x = df_wages[!is.na(get(vars[k])),.N, by = "id"]
    
    workers_n = x[,.N]
    
    y0 = df_wages[con_type_first_job == 0,mean(get(vars[k]),na.rm = T),by = "period"][order(period)]
    
    table1 = cbind(data.table(beta = t(est1[["beta"]])),
                   data.table(beta.se = t(est1[["cse"]])),
                   data.table(beta21 = t(est2[["beta"]]))[,1:P],
                   data.table(beta21.se = t(est2[["cse"]]))[,1:P],
                   data.table(beta31 =t(est3[["beta"]]))[,1:P],
                   data.table(beta31.se =t(est3[["cse"]]))[,1:P],
                   data.table(var = vars[k]),
                   data.table(fe =s),
                   data.table(firms = firms_n),
                   data.table(workers = workers_n),
                   data.table(fe =s),
                   data.table(r2 =summary(est1)[["r2"]][1]),
                   data.table(pr2 = summary(est1)[["P.r.squared"]][1]),
                   data.table(y0=t(y0[,2])),
                   data.table(obs = est1[["N"]]))
    
    
    rm(est1,est2,est3)
    
    if (count == 0){
      table2 <- table1
    }
    if (count > 0){
      table2 <- rbind(table2,table1)
    }
    count <- count + 1
  }
}


# export the results


filename  <- paste0(output, "figure_children_panel.csv")
write.csv(table,filename)


rm(table,table1,table2,x,df_wages,df_children)

