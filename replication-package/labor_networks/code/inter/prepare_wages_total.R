###########################################################################
## prepare_wages_total.R
##
## Builds wages_total_<year>.Rdata : one row per person-firm (i.e. ALL jobs of
## a person in a year), so consumers can compute total earnings across jobs and
## pick the main firm themselves. This is prepare_wages.R WITHOUT the two steps
## that collapse to a single job:
##   - NO "keep only February (month02==1)" restriction
##   - NO "keep the max-salary job per worker" step
## Everything else (cleaning, CPI adjustment, months, salary, age filter,
## >25% mean wage filter) is identical to prepare_wages.R.
##
## Consumers (prepare_children_panel_employment.R,
## prepare_children_panel_total_5years[_multiple2].R) read id, id_firm,
## yearly_salary, salary and filter on salary>0.
###########################################################################

# CPI in January of each year taken from the Israeli CBS website
cpi_1983 <- 0.99
cpi_1984 <- 4.68
cpi_1985 <- 10.52
cpi_1986 <- 15.59
cpi_1987 <- 18.68
cpi_1988 <- 21.72
cpi_1989 <- 26.11
cpi_1990 <- 30.6
cpi_1991 <- 36.41
cpi_1992 <- 40.76
cpi_1993 <- 45.22
cpi_1994 <- 50.79
cpi_1995 <- 55.9
cpi_1996 <- 62.23
cpi_1997 <- 67.83
cpi_1998 <- 71.5
cpi_1999 <- 75.22
cpi_2000 <- 76.07
cpi_2001 <- 76.91
cpi_2002 <- 81.25
cpi_2003 <- 81.82
cpi_2004 <- 81.49
cpi_2005 <- 82.55
cpi_2006 <- 84.33
cpi_2007 <- 84.76
cpi_2008 <- 88.63
cpi_2009 <- 91.56
cpi_2010 <- 94.04
cpi_2011 <- 97.33
cpi_2012 <- 98.93
cpi_2013 <- 100.51
cpi_2014 <- 100.91
cpi_2015 <- 100.3
cpi_2016 <- 99.8
cpi_2017 <- 100

# load the population file to get the age of the workers
filename <- paste0(data, "population.Rdata")
load(filename)
df_population <- df[,.(id,birth_year)]
df_population <- df_population[!(is.na(id) | is.na(birth_year))]
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

 # adjust for 2017 prices

 cpi <- eval(parse(text =paste0("cpi_", t) ))
 df[, yearly_salary := yearly_salary*cpi_2017/cpi]

 # calculate months of work in a year
 df[, months := month01 + month02 + month03 + month04 + month05 + month06 + month07 + month08 + month09 + month10 + month11 + month12]

 # calculate avergae monthly salary
 df <- df[, salary := yearly_salary / months]

 ## NOTE: unlike prepare_wages.R, we do NOT restrict to February workers
 ##       and we do NOT keep only the max-salary job -> ALL jobs are kept.
 df <- df[ , (month_cols) := NULL]

 # keep workers ages 22-69
 df <- merge(df, df_population, by = "id")
 df <- df[t - birth_year >= 22 & t - birth_year <= 69]
 df[,birth_year := NULL ]

 # drop individuals with less than 25% of the average wage in the sample
 mean_salary <- df[, mean(salary)]
 df <- df[salary > 0.25 * mean_salary]

 # save the data (one row per person-firm: all jobs)
 filename <- paste0(data, "wages_total_",t,".Rdata")
 save(df, file = filename)
 rm(df)
}

rm(df_population)
