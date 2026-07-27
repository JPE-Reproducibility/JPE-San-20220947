
first_year <- 2006
last_year <- 2015

first_birth_year <- 1979
last_birth_year <- 1993


# load the employment_history file
filename <- paste0(data, "employment_history.Rdata")
load(filename)
employment_history <- df[,.(id,id_firm,year)]
rm(df,filename)

# load the children sample
filename <- paste0(data, "children_sample_25.Rdata")
load(filename)
df_children_sample1 <- df
rm(df,filename)

# load children-parents link
filename <- paste0(data, "df_parents.Rdata")
load(filename)
df_parents <- df
rm(df,filename)

filename <- paste0(data, "akm_firm.Rdata")
load(filename)
df_akm <- df[,.(id_firm,year,firm_rank)]
rm(df,filename)


count = 0
for (t in first_year:last_year){
  for (b in first_birth_year:last_birth_year){
    if (t-b == 25){
      
      print(t)
      print(b)
      
      
      df_children_sample <- df_children_sample1[year == t & birth_year == b]
      
      # get children-parent links for children from the sample
      df_connections <- merge(df_children_sample[,.(id)],
                              df_parents, by.x = "id",
                              by.y = "id1")
      
      rm(df_children_sample)
      
      print("merge1")
      
      
      
      
      # get children-past parent firms link (10 years before the the child is 21)
      df_connections <- merge(df_connections, 
                              employment_history, by.x = "id2",
                              by.y = "id", allow.cartesian=TRUE)[year-b <= 21
                                                                 & year-b >= 12]
      print("merge2")
      
      df_connections[,type := NULL]
      
      colnames(df_connections)[colnames(df_connections) == "id"] <- "id_child"
      colnames(df_connections)[colnames(df_connections) == "id2"] <- "id_parent"
      
      
   
      df_connections <- merge(df_connections, 
                              employment_history[year-b <= 21 & year-b >=12,.(id,id_firm,year1 = year)], by = c("id_firm","year1"),
                              allow.cartesian=TRUE)
      
      print("merge3")
      
      colnames(df_connections)[colnames(df_connections) == "id"] <- "id_pco"
      colnames(df_connections)[colnames(df_connections) == "id_firm"] <- "id_firm_past"
      colnames(df_connections)[colnames(df_connections) == "year"] <- "year_parent_past"
      colnames(df_connections)[colnames(df_connections) == "year1"] <- "year_pco_past"
      
      # collapse by id_child,id_pco
      df_connections <- df_connections[, .(con_past = max(1*(year_pco_past == year_parent_past)),
                                           min_lag_past = min(year_pco_past-year_parent_past),
                                           max_lag_past = max(year_pco_past-year_parent_past)),
                                       by = .(id_child,id_pco)]  
      
      df_connections[,year := t]
      
      # get employment status of pco at t
      df_connections <- merge(df_connections, 
                              employment_history, by.x = c("id_pco","year"),
                              by.y = c("id","year"), all.x = T, allow.cartesian=TRUE)
      print("merge4")
      
      colnames(df_connections)[colnames(df_connections) == "id_child"] <- "id"
      
      
      df_connections[,employment := 1 * !is.na(id_firm )]
      
      df_connections = merge(df_connections,df_akm, by = c("id_firm","year"),all.x = T)
      
      
      
      # get employment status of pco at t-5
      df_connections <- merge(df_connections, 
                              employment_history, by.x = c("id_pco","year"),
                              by.y = c("id","year"), all.x = T, allow.cartesian=TRUE)
      print("merge4")
      
      colnames(df_connections)[colnames(df_connections) == "id_child"] <- "id"
      
      
      df_connections[,employment := 1 * !is.na(id_firm )]
      
      df_connections = merge(df_connections,df_akm, by = c("id_firm","year"),all.x = T)
      
      
      
      # collapse by id + con_past
      df <- df_connections[, .(contacts = .N,
                               employment = mean(employment),
                               firm_rank = mean(firm_rank,na.rm=T)),
                           by = .(id,con_past)]     
      
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
filename <- paste0(data, "connections_indirect_25_pahntom_past.Rdata")
save(df, file = filename)
rm(df,df1,filename)

