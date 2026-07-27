# load the children sample
filename <- paste0(data, "children_sample_employment.Rdata")
load(filename)
df_children <- df
rm(df)

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

df_wages [,employment := 1* !is.na(yearly_salary)]
df_wages [,yearly_salary0 := yearly_salary]
df_wages [is.na(yearly_salary0),yearly_salary0 := 0]
setorder(df_wages,id,year)
df_wages[,id_firm_lag := shift(id_firm,1), by = "id"]
df_wages[,switch := 1 * (id_firm_lag != id_firm & employment == 1)]
df_wages[is.na(switch),switch := 0]
df_wages[,id_firm_lag:=NULL]

# merge with firm rank
filename <- paste0(data, "akm_firm.Rdata")
load(filename)
df_wages = merge(df_wages,df[,.(id_firm,firm_rank,year)], by = c("id_firm","year"), all.x = T)
rm(df)

# load connections

filename <- paste0(data, "connections_indirect_employment_pahntom_past.Rdata")
load(filename)
df_wages = merge(df_wages,
                 df,
                 by = c("id","year"))
rm(df)



# merge with other children vars

df_wages = merge(df_wages,
                 unique(df_children[,.(id,birth_year,ethnicity, sex,education = education>0,district)]),
                 by = c("id"))



# create group variables 
df_wages[,group := interaction(factor(birth_year),factor(ethnicity),sep = ":")]
df_wages[,group := interaction(group,factor(year),sep = ":")]
df_wages[,group := interaction(group,factor(sex),sep = ":")]
df_wages[,group := interaction(group,factor(education),sep = ":")]
df_wages[,group := interaction(group,factor(district),sep = ":")]

# prepare vars
df_wages[, log_yearly_salary:= log(yearly_salary)]
df_wages[, log_yearly_salary0:= log(yearly_salary0+1)]

df_wages[is.na(contacts_1),contacts_1 :=0]
df_wages[is.na(contacts_0),contacts_0 :=0]

df_wages[,employment_10 := employment_1 + employment_0]
df_wages[,firm_rank_10 := firm_rank_1 + firm_rank_0]

df_wages[,log_contacts_1 := log(contacts_1+1) ]
df_wages[,log_contacts_0 := log(contacts_0+1) ]
df_wages[,log_contacts_10 := log(contacts_1+1) + log(contacts_0+1)]

df_wages[,log_contacts_1 := log(contacts_1+1) ]
df_wages[,log_contacts_0 := log(contacts_0+1) ]
df_wages[,log_contacts_10 := log(contacts_1+1) + log(contacts_0+1)]

# save the data
df = df_wages
filename <- paste0(data, "children_panel_employment_phantom_past.Rdata")
save(df, file = filename)
rm(df,df_wages)
