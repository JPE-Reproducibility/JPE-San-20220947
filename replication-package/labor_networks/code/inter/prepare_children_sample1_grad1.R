
# load the employment_history file 
filename <- paste0(data, "employment_history.Rdata")
load(filename)
df_children <- df
rm(df)

# load the population file 
filename <- paste0(data, "population.Rdata")
load(filename)
df_population <- df[,.(id,sex,birth_year,native,ethnicity,ultraorthodox,id_father,id_mother)]
rm(df)

# keep if there is information on all relevant demographic vars (see the definition of native- more restrictive)
df_population <- df_population[!is.na(id) & !is.na(sex) & 
                !is.na(birth_year) & !is.na(ethnicity) & !is.na(ultraorthodox) & 
                  !is.na(id_father) & !is.na(id_mother)]

# merge the employment and population files
df_children <- merge(df_children, df_population, by = "id")
rm(df_population)

# keep children in ages 22-27  + natives (born in Israel and no immigration year information) + non ultraorthodox 
df_children <- df_children[(year - birth_year >= 22 & year - birth_year <= 27)]
df_children <- df_children[native == 1] 
df_children <- df_children[ultraorthodox == 0] 

# get education data
filename <- paste0(data, "education.Rdata")
load(filename)

df_children <- merge(df_children, df, by = "id", all.x = TRUE)
df_children[is.na(education),education := 0]
df_children[is.na(graduation_year),graduation_year := birth_year + 21]
rm(df)

# call the year after graduation the year of first job
df_children <- df_children[, year_first_job := graduation_year + 1,by = id]

# keep children when year(of first job) >=2006 
df_children <- df_children[year_first_job >= 2006]

# keep one obs per child (get the firm id of the year of first job)
df_children <- df_children[year == year_first_job]

# get the location of the child at the year she is 21
for (k in 2000:2014){
  print(k)
  filename <- paste0(data, "location_",k,".Rdata")
  load(filename)
  df_location <- df[,.(id,X,Y,setl_name_ltn,district,subdistrict,city,neighborhood)]
  rm(df)
  df_location[,birth_year := k - 21]
  
  df_children <- merge(df_children,df_location,by.x = c("id","birth_year"),
                       by.y = c("id","birth_year"), all.x = TRUE)
  df_children[birth_year == k - 21, X_temp := X]
  df_children[birth_year == k - 21, Y_temp := Y]
  df_children[birth_year == k - 21, setl_name_ltn_temp := setl_name_ltn]
  df_children[birth_year == k - 21, district_temp := district]
  df_children[birth_year == k - 21, subdistrict_temp := subdistrict]
  df_children[birth_year == k - 21, city_temp := city]
  df_children[birth_year == k - 21, neighborhood_temp := neighborhood]
  
  df_children[,c("X","Y","setl_name_ltn","district","subdistrict","city","neighborhood") := NULL]
  rm(df_location)
}
colnames(df_children)[colnames(df_children) == "X_temp"] <- "X"
colnames(df_children)[colnames(df_children) == "Y_temp"] <- "Y"
colnames(df_children)[colnames(df_children) == "setl_name_ltn_temp"] <- "setl_name_ltn"
colnames(df_children)[colnames(df_children) == "district_temp"] <- "district"
colnames(df_children)[colnames(df_children) == "subdistrict_temp"] <- "subdistrict"
colnames(df_children)[colnames(df_children) == "city_temp"] <- "city"
colnames(df_children)[colnames(df_children) == "neighborhood_temp"] <- "neighborhood"

# keep only children with location information
df_children <- df_children[!is.na(X) & !is.na(Y) & 
                             !is.na(district) & !is.na(subdistrict) & !is.na(city) & !is.na(neighborhood)]

# keep the relevant vars
df <- df_children[,.(id,sex,birth_year,native,ethnicity, id_firm,year = year_first_job,
                            education,graduation_year, X, Y,
                            setl_name_ltn,district,subdistrict,city,neighborhood)]

# save the file
filename <- paste0(data, "children_sample1_grad1.Rdata")
save(df, file = filename)
rm(df,df_children)

