
first_year <- 1991
last_year <- 2015
count <- 0
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
  df <- df[!is.na(id) & !is.na(id_firm) & id_firm != 0 & !(is.na(industry) | industry == 0)]
  
  df <- df[, .N, by = c("id_firm","industry")]

  # by firm: keep the industry with maximal occurences
  df <- df[df[, .I[which.max(N)],
              by = id_firm]$V1]
  
  df[, year := t]
  
  if (count >0 ) {
    df <- rbind(df1,df,fill=TRUE)
  }
  df1 <- df
  
rm(df)
count = count + 1

}
df <- df1[,.(id_firm,industry,year)]

# check the frequency of firms moving from industry A to B in sequenctial years
df1 <- merge(df,df, by = "id_firm", allow.cartesian = TRUE)[year.y - year.x == 1,  .N, by = c("year.x","year.y","industry.x","industry.y") ]

# keep only industry change (A!=B) that is ranked first
df1[,same := 1*(industry.x == industry.y )]
df1[,rank := .N - rank(N) + 1, by = .(year.x, industry.x) ]
df1 <- df1[same == 0  & rank <= 1]

# look for chains of changes: A -> B -> C
df2 <- df1[,.(year0 = year.x, year1 = year.y,industry0 = industry.x,industry1 = industry.y)]
df3 <- df1[,.(year2 = year.x, year3 = year.y,industry2 = industry.x,industry3 = industry.y)]
df1 <- merge(df2,df3, by.x = "industry1", by.y = "industry2", allow.cartesian = TRUE)[year2>=year0]
df1 <- df1[,.(industry1,industry3)]
df1 <- merge(df2,df1, by = "industry1", all.x = TRUE)
df1 <- df1[!is.na(industry3),industry1 := industry3]
df1 <- unique(df1[industry0 != industry1,.(industry0,industry1)])

# merge the industries changes with the firm to industry file
df <- merge(df,df1,by.x = "industry", by.y = "industry0", all.x = TRUE)
rm(df1,df2,df3)
df <- df[!is.na(industry1),industry := industry1]

# by firm: keep the latest industry
df <- df[df[, .I[which.max(year)],
            by = id_firm]$V1]

df  = df[,.(id_firm,industry)]

# save the data
filename <- paste0(data, "firm_industry.Rdata")
save(df, file = filename)
rm(df)