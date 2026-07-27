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


## merge with connections type at first job
filename <- paste0(data, "connections_type.Rdata")
load(filename)
df_employment = merge(df_employment,df[,.(id,id_firm,con_type)], by = c("id","id_firm") , all.x = TRUE)
df_employment[is.na(con_type),con_type := 0]
df_employment[year == year_first_job,con_type_first_job := con_type]
df_employment[,con_type_first_job := max(con_type_first_job,na.rm = T), by = "id" ]
df_employment[,con_type := NULL]
rm(df)


# merge with demographic vars
df_employment = merge(df_employment,
                      df_children[,.(id,sex,birth_year,education = 1*(education>0),ethnicity,district)],
                      by = c("id"))
rm(df_children)

# gen vars
df_employment[,age := year - birth_year]
df_employment[,period := year - year_first_job]
df_employment[,age_first_job := year_first_job - birth_year]

# save the file
df <- df_employment
filename <- paste0(data, "children_panel.Rdata")
save(df, file = filename)
rm(df,df_employment)
