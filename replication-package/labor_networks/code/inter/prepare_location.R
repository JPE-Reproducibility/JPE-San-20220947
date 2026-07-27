library(data.table)
library(ggplot2)
library(haven)
library(readxl)


filename <- paste0(excel, "setl_mid_point.xlsx")
setl_mid_point <- read_xlsx(filename)
setl_mid_point <- data.table(setl_mid_point)
setl_mid_point <- setl_mid_point[,.(X,Y,setl_name_ltn,setl_code)]
for (k in 2000:2015){
  filename <- paste0(raw, "ktovat/ktovet_", k, ".dta")
  df <- read_dta(filename)
  df <- data.table(df)
  
  colnames(df)[colnames(df) == "tz"] <- "id"
  temp <- paste0("ktov_machoz_", k)
  colnames(df)[colnames(df)== temp] <- "district"
  temp <- paste0("ktov_nafa_", k)
  colnames(df)[colnames(df)== temp] <- "subdistrict"
  temp <- paste0("ktov_semel_yshuv_", k)
  colnames(df)[colnames(df)== temp] <- "city"
  temp <- paste0("ktov_ezor_stat_", k)
  colnames(df)[colnames(df)== temp] <- "neighborhood"
  
  df <- merge(df,setl_mid_point,by.x = "city", by.y = "setl_code", all.x = TRUE)
  
  filename <- paste0(data, "location_", k, ".Rdata")
  save(df, file = filename)
  
}

