# load the children sample
filename <- paste0(data, "children_sample.Rdata")
load(filename)
df_children <- df
rm(df)


filename <- paste0(data, "akm_firm.Rdata")
load(filename)
df_akm <- df[,.(id_firm,year,firm_rank)]
rm(df,filename)



first_year = 2006
last_year = 2015

count = 0
for (t in first_year:last_year){
  print(t)
  filename <- paste0(data, "wages_total_",t,".Rdata")
  load(filename)
  
  df = merge(df[salary>0],df_children[,.(id)],by = "id")
  
  # keep the job with a maximal yearly salary for a worker (in a given year)
  df1 <- df[df[, .I[which.max(yearly_salary)],
               by = id]$V1]
  
  
  df2 = df[,.(yearly_salary = sum(yearly_salary)), by = "id"]
  df = merge(df1[,.(id,id_firm )],df1[,.(id,yearly_salary )] , by = "id")
  df = merge(df,df_children[,.(id)],by = "id", all.y = T)
  df[,year := t]
  rm(df1,df2)
  if (count > 0){
    df = rbind(df,df_wages)
  }
  df_wages <- df
  rm(df)
  count = count + 1
}


filename <- paste0(data, "children_first_job_data_multiple2.Rdata")
load(filename)
df_wages <- merge(df_wages,
                  df[,.(id, year_first_job = year, sex,age_first_job = age,
                        education,ethnicity,district,con_type,max_lag)],
                  by = "id")
rm(df)

# get 5-year discounted salary
df_wages[is.na(yearly_salary), yearly_salary := 0]
df_wages[,period := year - year_first_job  ]
df_wages = df_wages[period >= 0 & period<=4 ]
df_wages[,discounted_salary := mean(yearly_salary*(1-0.04)^period), by = "id"]


first_job <- df_wages[df_wages[, .I[which.min(year)],
             by = id]$V1][,.(id,id_firm_first_job = id_firm)]

df_wages_subs_job = merge(df_wages,first_job, by = "id")
df_wages_subs_job[,first_job := 1*(id_firm == id_firm_first_job )]

df_wages_subs_job = df_wages_subs_job[first_job == 0]
df_wages_subs_job<- df_wages_subs_job[df_wages_subs_job[, .I[which.min(year)],
                                       by = id]$V1]

df_wages_subs_job = merge(df_wages_subs_job,df_akm,by = c("id_firm","year"), all.x = T)

df_wages = merge(df_wages,df_akm,by = c("id_firm","year"), all.x = T)

df_wages = df_wages[df_wages[, .I[which.min(year)],
                             by = id]$V1]


df_wages = merge(df_wages,
                 df_wages_subs_job[,.(id,yearly_salary_subs = yearly_salary,
                                      firm_rank_subs = firm_rank,
                                      period_subs = period)], by = "id", all.x = T)



# create group variables 
df_wages[,group := interaction(factor(age_first_job),factor(ethnicity),sep = ":")]
df_wages[,group := interaction(group,factor(year),sep = ":")]
df_wages[,group := interaction(group,factor(sex),sep = ":")]
df_wages[,group := interaction(group,factor(education),sep = ":")]
df_wages[,group := interaction(group,factor(district),sep = ":")]

# prepare vars
df_wages[, log_yearly_salary:= log(yearly_salary)]
df_wages[, log_discounted_salary:= log(discounted_salary)]
df_wages[, log_yearly_salary_subs:= log(yearly_salary_subs)]

df_wages[,con1 := 1 * (con_type == 1)]
df_wages[,con2 := 1 * (con_type == 2)]
df_wages[,con3 := 1 * (con_type == 3)]
df_wages[,con4 := 1 * (con_type == 4)]
df_wages[,con5 := 1 * (con_type == 5)]
df_wages[,con6 := 1 * (con_type == 6)]
df_wages[,con7 := 1 * (con_type == 7)]
df_wages[,con8 := 1 * (con_type == 8)]

df_wages[,con14 := con1 + con4]
df_wages[,con25 := con2 + con5]
df_wages[,con36 := con3 + con6]


# save the data

df = df_wages
filename <- paste0(data, "children_panel_total_5years_multiple2.Rdata")
save(df, file = filename)
rm(df,df_wages,df_wages_subs_job,df_akm,df_children,first_job)


