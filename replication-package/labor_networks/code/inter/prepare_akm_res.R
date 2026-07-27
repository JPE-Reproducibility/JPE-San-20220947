# load the children sample 
filename <- paste0(data, "children_sample.Rdata")
load(filename)
df_children <- df[,.(id)]
df_children[,child := 1]
rm(df)

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
  
  # keep only observations that not in the children sample (so the salary of children will not impact the results)
  df_wages <- merge(df_wages,df_children[,.(id,child)],by = c("id"),all.x = TRUE)
  df_wages <- df_wages[is.na(child)]
  df_wages[,child := NULL]
  
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
  e = data.table(est[["residuals"]])
  res = cbind(df_wages[,.(id_firm,salary)],res = e)
  firms =res[,.(res.salary= mean(abs(res.salary))),by = "id_firm"]
  firms[,year := t]
   # save the akm raw results
  filename <- paste0(data, "akm_est_",t,".Rdata")
  save(est, file = filename)
  rm(est,df_wages)
  
  # append the residuals by firm
  if (t >first_year ) {
    firms <- rbind(firms1,firms)
  }
  firms1 <- firms
  rm(df)
  count = count + 1
}

df = firms1
filename <- paste0(data, "firms_akm_res.Rdata")
save(df, file = filename)

# create bins

filename <- paste0(data, "firms_akm_res.Rdata")
load(filename)
firms1 = df
firms1 = firms1[,.(akm_res = mean(res.salary)), by = "id_firm"]
firms1 = firms1[akm_res>10^-5]
firms1[,bin_akm_res := ceiling((rank(akm_res)/.N)*10)]

df = firms1
filename <- paste0(data, "firms_akm_res_bins.Rdata")
save(df, file = filename)
rm(df,firms1)

