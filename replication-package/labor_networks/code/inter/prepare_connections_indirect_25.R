
first_year <- 2006
last_year <- 2015

first_birth_year <- 1979
last_birth_year <- 1993

filename <- paste0(data, "population.Rdata")
load(filename)
df_population = df[,.(id,birth_year,sex,ethnicity)]
rm(df,filename)

# load the employment_history file
filename <- paste0(data, "employment_history.Rdata")
load(filename)
employment_history <- df
rm(df,filename)

employment_history <- employment_history[,firm_size := .N , by= .(id_firm,year) ]
employment_history[, c("salary_rank","salary","real") := NULL]

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
      
      colnames(df_connections)[colnames(df_connections) == "id"] <- "id_child"
      colnames(df_connections)[colnames(df_connections) == "id2"] <- "id_parent"
      colnames(df_connections)[colnames(df_connections) == "firm_size"] <- "past_firm_size"
      
            # get all parent past coworkers linked to children
      df_connections <- merge(df_connections, 
                              employment_history, by = c("year","id_firm"),
                              allow.cartesian=TRUE)
      
      print("merge3")
      
      colnames(df_connections)[colnames(df_connections) == "id"] <- "id_pco"
      colnames(df_connections)[colnames(df_connections) == "id_firm"] <- "id_firm_past"
      colnames(df_connections)[colnames(df_connections) == "year"] <- "year_past"
      
      df_connections[,firm_size := NULL]
      
      # collapse by id_child,id_pco, id_parent
      df_connections <- df_connections[, .(past_duration = .N,
                                           min_year_past = min(year_past),
                                           max_year_past = max(year_past),
                                           past_firm_size = mean(past_firm_size)),
                                       by = .(id_child,id_pco,id_parent)]  
      
      # collapse by id_child,id_pco
      df_connections <- df_connections[, .(parents = .N,
                                           past_duration = mean(past_duration),
                                           min_year_past = min(min_year_past),
                                           max_year_past = max(max_year_past),
                                           past_firm_size = mean(past_firm_size)),
                                       by = .(id_child,id_pco)]   
      
      # get the connections between children and firms of pco in [t-5,t+5]
      df_connections <- merge(df_connections, 
                              employment_history, by.x = "id_pco",
                              by.y = "id", allow.cartesian=TRUE)
      print("merge4")
      
      colnames(df_connections)[colnames(df_connections) == "firm_size"] <- "current_firm_size"
      colnames(df_connections)[colnames(df_connections) == "id_child"] <- "id"
 
      # keep only connections in [t-5,t+5]
      df_connections[,lag := year - t]
      df_connections <- df_connections[ lag >=-5 & lag <= 5]

      # collapse by id,id_pco,id_firm
      
      df_connections <- df_connections[,
                                       .(parents = mean(parents),
                                         past_duration = mean(past_duration),
                                         min_year_past = min(min_year_past),
                                         max_year_past = max(max_year_past),
                                         past_firm_size = mean(past_firm_size),
                                         con = max(lag == 0),
                                         current_duration = .N,
                                         min_lag = min(lag),
                                         max_lag = max(lag),
                                         current_firm_size = mean(current_firm_size)),
                                       by = .(id,id_pco,id_firm)]      
      
      #  save the data
      
      df <- df_connections
      filename <- paste0(data, "connections_pco_25", t,"_",b, ".Rdata")
      save(df, file = filename)
      rm(df,df_connections,filename)
    }
  }
}
rm(employment_history,df_population,df_parents)

# append all data (by id-id_firm)
count = 0
for (t in first_year:last_year){
  for (b in first_birth_year:last_birth_year){
    if (t - b == 25){
      print(t)
      print(b)
      print(count)
      filename <- paste0(data, "connections_pco_25", t,"_",b, ".Rdata")
load(filename)

# collapse by id,id_firm
df <- df[,
                                 .(contacts = .N,
                                   con = max(con == 1),
                                   current_duration = mean(current_duration),
                                   min_lag = min(min_lag),
                                   max_lag = max(max_lag)),
                                 by = .(id,id_firm)]     
 
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
filename <- paste0(data, "connections_indirect_25.Rdata")
save(df, file = filename)
rm(df,df1,filename)

