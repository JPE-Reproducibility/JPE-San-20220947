# load the children sample
filename <- paste0(data, "children_sample_25.Rdata")
load(filename)
df_children <- df
rm(df)

first_year = 2001
last_year = 2015

count = 0
for (t in first_year:last_year){
  print(t)
  filename <- paste0(data, "wages_",t,".Rdata")
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

df_wages [,employment := 1* !is.na(yearly_salary)]
df_wages [,yearly_salary0 := yearly_salary]
df_wages [is.na(yearly_salary0),yearly_salary0 := 0]
setorder(df_wages,id,year)
df_wages[,id_firm_lag := shift(id_firm,1), by = "id"]
df_wages[,switch := 1 * (id_firm_lag != id_firm & employment == 1)]
df_wages[is.na(switch),switch := 0]

# load connections

filename <- paste0(data, "connections_type_25.Rdata")
load(filename)
df_connections <- df[,.(id,id_firm,con_type)]
rm(df)

# merge with firm rank
filename <- paste0(data, "akm_firm.Rdata")
load(filename)
df_connections = merge(df_connections,df_children[,.(id,year)], by = c("id"))

df_connections = merge(df_connections,df[,.(id_firm,firm_rank,year)], by = c("id_firm","year"))

df_connections = df_connections[,.(connections = .N,
                                   mean_firm_rank = mean(firm_rank)),
                                by = .(id,con_type)]


df_connections = dcast(df_connections,id~con_type, value.var = c("connections","mean_firm_rank"),fill = 0 )


# load other children vars

filename <- paste0(data, "children_first_job_data_multiple2.Rdata")
load(filename)
df_children_first_job <- df[,.(id, year_first_job = year, sex,age_first_job = age,education,ethnicity,district,con_type,max_lag)]
rm(df)

# merge datasets
df_wages = merge(df_wages,df_connections, by = "id")

df_wages = merge(df_wages,df_children_first_job, by = "id")
df_wages
df_wages[,period := year - year_first_job]
df_wages = df_wages[period>=0 & period<=4]


# create group variables 
df_wages[,group := interaction(factor(year_first_job),factor(ethnicity),sep = ":")]
df_wages[,group := interaction(group,factor(age_first_job),sep = ":")]
df_wages[,group := interaction(group,factor(sex),sep = ":")]
df_wages[,group := interaction(group,factor(education),sep = ":")]
df_wages[,group := interaction(group,factor(district),sep = ":")]


df_wages[,connections_rank_1 := connections_1 * mean_firm_rank_1]
df_wages[,connections_rank_2 := connections_2 * mean_firm_rank_2]
df_wages[,connections_rank_3 := connections_3 * mean_firm_rank_3]
df_wages[,connections_rank_4 := connections_4 * mean_firm_rank_4]
df_wages[,connections_rank_5 := connections_5 * mean_firm_rank_5]
df_wages[,connections_rank_6 := connections_6 * mean_firm_rank_6]
df_wages[,connections_rank_7 := connections_7 * mean_firm_rank_7]
df_wages[,connections_rank_8 := connections_8 * mean_firm_rank_8]


summary(felm((employment) ~ factor(con_type)|period + group,df_wages))

summary(felm((employment) ~ factor(con_type)|group,df_wages[period==0]))
summary(felm((employment) ~ factor(con_type)|group,df_wages[period==1]))
summary(felm((employment) ~ factor(con_type)|group,df_wages[period==2]))
summary(felm((employment) ~ factor(con_type)|group,df_wages[period==3]))
summary(felm((employment) ~ factor(con_type)|group,df_wages[period==4]))

summary(felm((employment) ~ connections_1 + connections_2 + connections_3 +
               connections_4 + connections_5 + connections_6 +
               connections_7 + connections_8 |period + group,df_wages))

summary(felm((switch) ~ connections_1 + connections_2 + connections_3 +
               connections_4 + connections_5 + connections_6 +
               connections_7 + connections_8 |period + group,df_wages[employment==1]))


summary(felm((log(yearly_salary)) ~ connections_1 + connections_2 + connections_3 +
               connections_4 + connections_5 + connections_6 +
               connections_7 + connections_8 |period + group,df_wages))

summary(felm((employment) ~ connections_rank_1 + connections_rank_2 + connections_rank_3 +
               connections_rank_4 + connections_rank_5 + connections_rank_6 +
               connections_rank_7 + connections_rank_8 |period + group,df_wages))

summary(felm((log(yearly_salary)) ~ connections_rank_1 + connections_rank_2 + connections_rank_3 +
               connections_rank_4 + connections_rank_5 + connections_rank_6 +
               connections_rank_7 + connections_rank_8 |period + group,df_wages))


df_wages[,con1 := con_type==1]
df_wages[,con2 := con_type==2]
df_wages[,con3 := con_type==3]

felm(employment ~ factor(period) + con1:factor(period) + con2:factor(period) + con3:factor(period)|group,df_wages)

