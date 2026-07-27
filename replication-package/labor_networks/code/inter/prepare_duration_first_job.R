# load the children sample
filename <- paste0(data, "children_sample.Rdata")
load(filename)
df_children <- df
rm(df)


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

# keep all years of the first firm
df_employment_first_firm = df_employment[first_firm == 1]

# keep only sequential years
df_employment_first_firm[,rank := rank(year), by = "id" ]
df_employment_first_firm[,temp := year - rank - year_first_job + 1]
df_employment_first_firm <- df_employment_first_firm[temp == 0]

# get the salary growth rate at the first firm
df_employment_first_firm[,year_last := max(year), by = "id"]
df_employment_first_firm[,salary_first := max( salary * (year == year_first_job)), by = "id"]
df_employment_first_firm[,salary_last := max( salary * (year == year_last)), by = "id"]
df_employment_first_firm[,salary_last_first := salary_last/salary_first]

df_employment_first_firm <- df_employment_first_firm[,.(duration_first_job = .N,
                                  salary_last_first = mean(salary_last_first)), by = "id"]

# keep only the first two years and check employment at the same firm and wage growth
df_employment_two_years = df_employment[year == year_first_job | year == year_first_job + 1]
df_employment_two_years[,obs := .N,by = "id"]
df_employment_two_years <- df_employment_two_years[obs == 2]
df_employment_two_years[, year := year - year_first_job + 1]
df_employment_two_years <- df_employment_two_years[,.(id,year,salary,first_firm)]

df_employment_two_years[,salary1 := max( salary * (year == 1)), by = "id"]
df_employment_two_years[,salary2 := max( salary * (year == 2)), by = "id"]
df_employment_two_years[,stay := max( (first_firm == 1) * (year == 2)), by = "id"]
df_employment_two_years[,salary21 := salary2/salary1]
df_employment_two_years <- df_employment_two_years[year == 2]
df_employment_two_years <- df_employment_two_years[,.(id,stay,salary21)]

df_children = merge(df_children[,.(id)],df_employment_two_years, by = c("id"), all.x = TRUE)
df_children = merge(df_children,df_employment_first_firm, by = c("id"))
rm(df_employment_two_years,df_employment_first_firm)
# save the file
df <- df_children
filename <- paste0(data, "duration_first_job.Rdata")
save(df, file = filename)
rm(df,df_children,df_employment)
