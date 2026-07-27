
# load the employment_history file
filename <- paste0(data, "employment_history.Rdata")
load(filename)
employment_history <- df[,.(id,id_firm,year)]
rm(df,filename)

# load the temporary children sample
filename <- paste0(data, "children_sample1_25.Rdata")
load(filename)
df_children_sample <- df
rm(df,filename)

# load children-parents link
filename <- paste0(data, "df_parents.Rdata")
load(filename)
df_parents <- df
rm(df,filename)



  # get children-parent links for children from the sample
  df_connections <- merge(df_children_sample[,.(id,birth_year)],
                          df_parents, by.x = "id",
                          by.y = "id1")
  rm(df_children_sample)
  
  # get children-past parent firms link (10 years before the child is 21)
  df_connections <- merge(df_connections, 
                          employment_history[,.(id,id_firm,year)], by.x = "id2",
                          by.y = "id", allow.cartesian=TRUE)[year-birth_year <= 21
                                                             & year-birth_year >= 12]
  
  df_connections <- df_connections[,.(duration = .N,
                                                  first_year = min(year),
                                                  last_year = max(year)),
                                   by = .(id,id_firm,type)]
  


rm(employment_history,df_parents)

# save the file
df <- df_connections
filename <- paste0(data, "parents_firms_long_25.Rdata")
save(df, file = filename)
rm(df_connections,filename)

# save short file of parents' firms (one observation per id-id_firm)
df <- unique(df[,.(id,id_firm)])

filename <- paste0(data, "parents_firms_25.Rdata")
save(df, file = filename)
rm(df,filename)


