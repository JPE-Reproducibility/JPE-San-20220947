# prepare one file keeping firms with number of workers between 5 and 500
first_year <- 1991
last_year <- 2015
for (t in first_year:last_year){
  print(t)
  filename <- paste0(data, "wages_1927_",t,".Rdata")
  load(filename)
  df <- df[firm_size >= 5 & firm_size <= 500]
  df[, c("firm_size") := NULL]
  df[, year := t]
  df[, c("yearly_salary","months") := NULL]
  if (t == first_year) {
    df_wages <- df
  } else {
    df_wages <- rbind(df_wages,df)
  }
}

# save the file
df <- df_wages
rm(df_wages)
filename <- paste0(data, "employment_history_1927.Rdata")
save(df, file = filename)
rm(df)

