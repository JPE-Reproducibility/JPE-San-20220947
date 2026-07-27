library(data.table)
library(ggplot2)
library(haven)
library(readxl)


# load the education file
filename <- paste0(raw, "limodim.dta")
df <- read_dta(filename)
df <- data.table(df)

# rename the variables
colnames(df)[colnames(df) == "tz"] <- "id"
colnames(df)[colnames(df) == "mtar_lim"] <- "start_date"
colnames(df)[colnames(df) == "adtar_lim"] <- "end_date"
colnames(df)[colnames(df) == "kod_mosad"] <- "institution_id"

# drop if education institution is a religious school, high-school, art and unknown
filename <- paste0(excel, "educational_institutions_classification.xlsx")
institutions <- read_xlsx(filename)
institutions <- data.table(institutions)
institutions <- institutions[, .(institution_id, F)]
df <- df[institutions, on = "institution_id"]
df <- df[F == 0]
df[,F := NULL]
df_education <- df
rm(df)

# drop if end_date is after the individual is 29
filename <- paste0(data, "population.Rdata")
load(filename)
birth_year <- df[,.(id,birth_year)]
rm(df)

df_education <- merge(df_education,birth_year, by = "id")
df_education <- df_education[year(end_date) - birth_year <= 29 ]
df_education[,birth_year := NULL]

# calculate total years of education, first start date and last end date by id
df_education[, education := ((end_date - start_date)/365.25)]
df_education[, education := round(education)]

df_education <- df_education[, .(start_date = min(start_date), 
            end_date = max(end_date), education = sum(education)),
         keyby = .(id)]
df_education[,graduation_year := year(end_date)]

# drop if education = 0
df_education <- df_education[education != 0]

# save the data
df <- df_education
filename <- paste0(data, "education.Rdata")
save(df, file = filename)
rm(df,df_education)
