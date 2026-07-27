## prepare population file

filename <- paste0(raw, "all_population.dta")
df <- read_dta(filename)
df <- data.table(df)

colnames(df)[colnames(df) == "tz"] <- "id"
colnames(df)[colnames(df) == "zav"] <- "id_father"
colnames(df)[colnames(df) == "zem"] <- "id_mother"
colnames(df)[colnames(df) == "leom2"] <- "nation"
colnames(df)[colnames(df) == "ealia"] <- "birth_country"
colnames(df)[colnames(df) == "yy_leda"] <- "birth_year"
colnames(df)[colnames(df) == "mm_leda"] <- "birth_month"
colnames(df)[colnames(df) == "yy_alia"] <- "immigration_year"
colnames(df)[colnames(df) == "mm_alia"] <- "immigration_month"
colnames(df)[colnames(df) == "yy_ptira"] <- "death_year"
colnames(df)[colnames(df) == "mm_ptira"] <- "death_month"
colnames(df)[colnames(df) == "min1"] <- "sex"


df[, sex:= sex - 1]

filename <- paste0(excel, "birth_country.xlsx")
df_birth_country <- read_xlsx(filename,"data")
df_birth_country <- data.table(df_birth_country)
df_birth_country[,birth_country_heb:=NULL]
df <- merge(df,  df_birth_country, by = c("birth_country"),
             all.x = TRUE , allow.cartesian=TRUE)

df[, native := NA ]
df[(!(is.na(immigration_year)) & (birth_region1 != 4 )), native := 0 ]
df[ (is.na(immigration_year) & (birth_region1 == 4 )), native := 1]

## merge with the ultra-orthodox file 
filename <- paste0(raw, "hardi.dta")
df1 <- read_dta(filename)
df1 <- data.table(df1)
colnames(df1)[colnames(df1) == "tz"] <- "id"
colnames(df1)[colnames(df1) == "hardi"] <- "ultraorthodox"
df1 <- df1[, .(id,ultraorthodox)]
df1 <- unique(df1, by=c("id"))

df <- merge(df,  df1, by = c("id"),
            all.x = TRUE , allow.cartesian=TRUE)

df[is.na(ultraorthodox), ultraorthodox := 0]


df <- unique(df, by=c("id"))

## gen groups: 
# 0- jews, 
# 1: Arabs: Muslims + Christians + Druz + Cherkes
# note: individuas without nation information assumed to be jews (based on check of their birth contries and residential cities)

df[(nation == 0 | is.na(nation)) , ethnicity := 0]
df[nation >= 1 & nation <= 4 , ethnicity := 1]


filename <- paste0(data, "population.Rdata")
save(df, file = filename)
rm(df)

