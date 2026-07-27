# load the children sample
filename <- paste0(data, "children_sample.Rdata")
load(filename)
df_children <- df
rm(df)



# get all employment history of children
first_year <- 2006
last_year <- 2015
count = 0
for (t in first_year:last_year){
  print(t)
  filename <- paste0(data, "wages_",t,".Rdata")
  load(filename)
  df_wages <- df[,.(id,id_firm,salary)]
  rm(df)
  
  # get firm id and wages of all future jobs of the child
  df_wages <- merge(df_children[,.(id,id_firm_first_job = id_firm,year_first_job = year)], 
                    df_wages, by = "id")[t >= year_first_job]
  
  df_wages[,year := t]
  if (count > 0){
    df_wages = rbind(df_employment,df_wages)
  }
  df_employment <- df_wages
  rm(df_wages)
  count = count + 1
}

df_employment[, first_firm := 1 * (id_firm == id_firm_first_job)]

# keep salary at first job
df_salary <- df_employment[year == year_first_job]
df_salary <- df_salary[,.(id,salary)]

# keep all years of the first firm
df_employment_first_firm <- df_employment[first_firm == 1]

# keep only sequential years
df_employment_first_firm[,rank := rank(year), by = "id" ]
df_employment_first_firm[,temp := year - rank - year_first_job + 1]
df_employment_first_firm <- df_employment_first_firm[temp == 0]

# get duration at the first firm
df_employment_first_firm <- df_employment_first_firm[,.(duration_first_job = .N), by = "id"]

# check employment, salary, salary growth, and indicator for staying at same firm, after 3 years

df_employment3 = df_employment[year_first_job <= 2012]
df_employment3 <- df_employment3[year == year_first_job | year == year_first_job + 3]
df_employment3[,n := rank(year), by = "id"]
df_employment3 <- dcast(df_employment3, id ~ n, value.var=c("id_firm","salary"))
df_employment3[,employment3 := 1 * (!is.na(id_firm_2 ))]
df_employment3[,salary3 := salary_2]
df_employment3[,salary_growth3 := salary_2/salary_1 - 1 ]
df_employment3[,same_firm3 := 1 * (id_firm_2 == id_firm_1) ]
df_employment3[same_firm3 == 1,salary_growth_same_firm3 := salary_growth3 ]
df_employment3 <- df_employment3[,.(id,employment3,salary3,salary_growth3,same_firm3,salary_growth_same_firm3)]

## merge with connections type at first firm
filename <- paste0(data, "connections_type.Rdata")
load(filename)
df_children = merge(df_children,df[,.(id,id_firm,con_type,max_lag)], by = c("id","id_firm") , all.x = TRUE)
df_children[is.na(con_type),con_type := 0]
rm(df)



# merge with other vars
df_children = merge(df_children,df_salary, by = c("id"), all.x = TRUE)
df_children = merge(df_children,df_employment_first_firm, by = c("id"), all.x = TRUE)
df_children = merge(df_children,df_employment3, by = c("id"), all.x = TRUE)
rm(df_employment_first_firm,df_employment3)

# gen event of end of first job (for survival analysis)
df_children[,event := 1 * (year + duration_first_job <= last_year)]

# keep relevant vars
df_children <- df_children[,.(id,
                              id_firm,
                              year,
                              sex,
                              age = year - birth_year,
                              education = 1*(education>0),
                              ethnicity,
                              district,
                              salary,
                              duration_first_job,
                              event,
                              employment3,
                              salary3,
                              salary_growth3,
                              same_firm3,
                              salary_growth_same_firm3,
                              con_type,
                              max_lag)]

# save the file
df <- df_children
filename <- paste0(data, "children_first_job_data.Rdata")
save(df, file = filename)
rm(df,df_children,df_employment,df_salary)
