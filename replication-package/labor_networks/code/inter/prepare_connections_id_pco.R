
first_year <- 2006
last_year <- 2015

first_birth_year <- 1979
last_birth_year <- 1993

# append all data (by id-id_firm)
count = 0
for (t in first_year:last_year){
  for (b in first_birth_year:last_birth_year){
    if (t-b >= 22 & t-b <= 27){
      print(t)
      print(b)
      print(count)
      filename <- paste0(data, "connections_pco", t,"_",b, ".Rdata")
      load(filename)
      
      # collapse by id,id_firm
df[,contacts := .N , by = .(id,id_firm)]     
df <- df[contacts == 1]   
df <-df[,.(id,id_firm,id_pco)]
  
  if (count >0) {
        df <- rbind(df,df1)
      } 
      df1 <- df
      count = count + 1
    }
  }
}


#  save the data
df <- df1
filename <- paste0(data, "connections_id_pco.Rdata")
save(df, file = filename)
rm(df,df1,filename)





