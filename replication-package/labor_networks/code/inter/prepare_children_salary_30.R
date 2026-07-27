## load the children sample 
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
  df_wages <- df[,.(id,id_firm,salary,salary_rank)]
  rm(df)
  
  # get firm id and wages when the child is 30
  df_children_30 <- merge(df_children[,.(id,birth_year)], 
                           df_wages, by = "id")[t-birth_year == 30]
  rm(df_wages)
  
  df_children_30[,year := t]
  if (count > 0){
    df_children_30 = rbind(df_children_30_1,df_children_30)
  }
  df_children_30_1 <- df_children_30
  rm(df_children_30)
  count = count + 1
}

# get firm premium at 30
filename <- paste0(data, "akm_firm.Rdata")
load(filename)
df_children_30_1 <- merge(df_children_30_1,df[,.(id_firm,year,firm_rank)], by = c("id_firm","year"))

# rename the vars
colnames(df_children_30_1)[colnames(df_children_30_1) == "salary"] <- "salary_30"
colnames(df_children_30_1)[colnames(df_children_30_1) == "id_firm"] <- "id_firm_30"
colnames(df_children_30_1)[colnames(df_children_30_1) == "salary_rank"] <- "salary_rank_30"
colnames(df_children_30_1)[colnames(df_children_30_1) == "firm_rank"] <- "firm_rank_30"


# save the file
df <- df_children_30_1
filename <- paste0(data, "children_salary_30.Rdata")
save(df, file = filename)
rm(df,df_children_30_1)
