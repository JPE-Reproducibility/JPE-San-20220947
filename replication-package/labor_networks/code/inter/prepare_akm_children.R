

first_year <- 2006
last_year <- 2015
for (t in first_year:last_year){
  print(t)
  
  # estimate 5-year backward akm model
  first_year1 <- t-4
  last_year1 <- t
  count = 0
  for (t1 in first_year1:last_year1){
    filename <- paste0(data, "wages_",t1,".Rdata")
    load(filename)
    df <- df[,.(id,id_firm,salary)]
    df[,salary := log(salary)]
    df[,year := t1]
    if (count >0 ) {
      df <- rbind(df_wages,df)
    }
    df_wages <- df
    rm(df)
    count = count + 1
  }
  #temp
  # df_wages = df_wages[id%%1000 == 0]

  # find largest connected set
  print("compfactor")
  cf <- compfactor(list(f1=df_wages[,as.factor(id)],f2=df_wages[,as.factor(id_firm)]))
  df_wages <- data.table(df_wages,cf)
  df_wages <- df_wages[cf == 1]
  df_wages[,cf := NULL]
  rm(cf)
  
  # load the population file to get the age of the workers 
  filename <- paste0(data, "population.Rdata")
  load(filename)
  df_population <- df[,.(id,birth_year)]
  rm(df)
  df_wages <- merge(df_wages, df_population, by = "id")
  rm(df_population)
  df_wages[, age := year - birth_year]
  df_wages[, age2 := (age - 40)^2]
  df_wages[, age3 := (age - 40)^3]
  
  df_wages[,birth_year := NULL ]
  df_wages[,age := NULL]
  # run the AKM regression
  print("felm")
  est <- felm(salary ~ age2 + age3   | factor(id) + factor(id_firm) + factor(year),  data = df_wages)
  rm(df_wages)
  # get fixed effects
  print("getfe")
  alpha <- getfe(est)
  rm(est)
  alpha <- as.data.table(alpha)
  alpha[,idx := as.numeric(as.character(idx))]
  alpha[,fe := as.factor(fe)]
  
  alpha_firm <- alpha[fe == "factor(id_firm)",.(idx,effect)]
  colnames(alpha_firm)[colnames(alpha_firm) == "idx"] <- "id_firm"
  colnames(alpha_firm)[colnames(alpha_firm) == "effect"] <- "firm_fe"
  alpha_firm[,firm_rank := rank(firm_fe)/.N ]
  
  alpha_person <- alpha[fe == "factor(id)",.(idx,effect)]
  colnames(alpha_person)[colnames(alpha_person) == "idx"] <- "id"
  colnames(alpha_person)[colnames(alpha_person) == "effect"] <- "person_fe"
  alpha_person[,person_rank := rank(person_fe)/.N ]
  
  rm(alpha)
  # save the files
  df <- alpha_firm
  filename <- paste0(data, "akm_firm_children_",t,".Rdata")
  save(df, file = filename)
  rm(df,alpha_firm)
  
  df <- alpha_person
  filename <- paste0(data, "akm_person_children_",t,".Rdata")
  save(df, file = filename)
  rm(df,alpha_person)

}

# maerge and save the files (firms)

count <- 0
for (t in first_year:last_year){
  print(t)
  filename <- paste0(data, "akm_firm_children_",t,".Rdata")
  load(filename)
  df_akm_firm <- df
  rm(df)
  df_akm_firm[,year := t]
  if (count > 0 ) {
    df_akm_firm <- rbind(df_akm_firm1,df_akm_firm)
  }
  df_akm_firm1 <- df_akm_firm 
  count <- count + 1
}

df <- df_akm_firm1
rm(df_akm_firm1,df_akm_firm)
filename <- paste0(data, "akm_firm_children.Rdata")
save(df, file = filename)
rm(df)

# maerge and save the files (persons)

count <- 0
for (t in first_year:last_year){
  print(t)
  filename <- paste0(data, "akm_person_children_",t,".Rdata")
  load(filename)
  df_akm_person <- df
  rm(df)
  df_akm_person[,year := t]
  if (count > 0 ) {
    df_akm_person <- rbind(df_akm_person1,df_akm_person)
  }
  df_akm_person1 <- df_akm_person 
  count <- count + 1
}

df <- df_akm_person1
rm(df_akm_person1,df_akm_person)
filename <- paste0(data, "akm_person_children_only.Rdata")
save(df, file = filename)
rm(df)