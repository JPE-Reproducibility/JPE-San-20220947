
# load the population file to get the age of the workers 
filename <- paste0(data, "population.Rdata")
load(filename)
df_population <- df[,.(id,birth_year,sex)]
df_population <- df_population[!(is.na(id) | is.na(birth_year) | is.na(sex))]
rm(df)

first_year <- 1991
last_year <- 2015
for (t in first_year:last_year){
  print(t)
  # load the raw employment data
  
  filename <- paste0(raw, "sachar/sachar_", t, ".dta")
  df <- read_dta(filename)
  df <- data.table(df)
  # rename the variables
  colnames(df)[colnames(df) == "tz"] <- "id"
  colnames(df)[colnames(df) == "s_total"] <- "yearly_salary"
  colnames(df)[colnames(df) == "id_maavid"] <- "id_firm"
  colnames(df)[colnames(df) == "anaf"] <- "industry"
  colnames(df)[colnames(df) == "sah_hs01"] <- "month01"
  colnames(df)[colnames(df) == "sah_hs02"] <- "month02"
  colnames(df)[colnames(df) == "sah_hs03"] <- "month03"
  colnames(df)[colnames(df) == "sah_hs04"] <- "month04"
  colnames(df)[colnames(df) == "sah_hs05"] <- "month05"
  colnames(df)[colnames(df) == "sah_hs06"] <- "month06"
  colnames(df)[colnames(df) == "sah_hs07"] <- "month07"
  colnames(df)[colnames(df) == "sah_hs08"] <- "month08"
  colnames(df)[colnames(df) == "sah_hs09"] <- "month09"
  colnames(df)[colnames(df) == "sah_hs10"] <- "month10"
  colnames(df)[colnames(df) == "sah_hs11"] <- "month11"
  colnames(df)[colnames(df) == "sah_hs12"] <- "month12"
  
  # drop obs with empty id or id_firm
  df <- df[!is.na(id) & !is.na(id_firm) & id_firm != 0]
  
  # replace empty monthly indicators with zeros  
  month_cols <- colnames(subset(df,select = month01:month12))
  df <- df[,
           (month_cols) := lapply(.SD, function(x) { x[is.na(x)] <- 0 ; x }),
           .SDcols = month_cols] ## for just those specified in .SDcols
  
  # drop duplicates in terms of id, id_firm, yearly_salary and monthly indicators 
  df <- df[,c("industry","year") := NULL]
  df <- unique(df)
  
  
  # for duplicates of id, id_firm: take the max of the monthly indicators and 
  # the sum of the yearly_salary
  df <- df[,
           (month_cols) :=  lapply(.SD, max), ## compute the max
           by = .(id, id_firm), ## for every 'id,id_firm'
           .SDcols = month_cols] ## for just those specified in .SDcols
  
  df <- df [ ,  c("yearly_salary") := lapply(.SD, sum),
             by = .(id, id_firm),
             .SDcols = c("yearly_salary")]
  
  df <- unique(df)
  
  # calculate months of work in a year
  df[, months := month01 + month02 + month03 + month04 + month05 + month06 + month07 + month08 + month09 + month10 + month11 + month12]
  
  # calculate avergae monthly salary 
  df <- df[, salary := yearly_salary / months]
  
  # keep the job with a maximal monthly salary for a worker (in a given year)
  df <- df[df[, .I[which.max(salary)],
              by = id]$V1]
  
  # keep workers ages 22-
  df <- merge(df, df_population, by = "id")
  df <- df[t - birth_year >= 22]

    df[, year := t]
 df <- df[,.(id,year,birth_year,sex)]
    if (t == first_year) {
      df_employment <- df
    } else {
      df_employment <- rbind(df_employment,df)
    }
  }
  
  rm(df_population,df)
  
  df_employment <- df_employment[, .(birth_year = mean(birth_year),
                                    sex = mean(sex),
                                    last_year = max(year)), by = "id"]
  
  df_employment <- df_employment[, last_age := last_year - birth_year]
  df_employment <- df_employment[last_year < 2015 & last_age<=80]
  
  
  # save the file
  df <- df_employment
  filename <- paste0(data, "retirement.Rdata")
  save(df, file = filename)
  rm(df)
  
  
  filename <- paste0(data, "retirement.Rdata")
  load(filename)
  df_employment <- df
  table = df_employment[last_age >= 50 & last_year >= 2006,.N, by =.(last_age, sex)]
  
  # export the table
  filename <- paste0(output, "table_retirement.csv")
  write.csv(table,filename)
  