# load the employment_history file
filename <- paste0(data, "employment_history.Rdata")
load(filename)
employment_history <- df[,.(id,id_firm,year)]
rm(df,filename)

employment_history <- employment_history[,firm_size := .N , by= .(id_firm,year) ]



# load the children sample
filename <- paste0(data, "children_sample.Rdata")
load(filename)
df_children_sample <- df[.(id,birth_year,year)]
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

# get children-past parent firms link (10 years before the child is 21)
df_connections <- merge(df_connections, 
                        employment_history[,.(id,id_firm,year,firm_size)], by.x = "id2",
                        by.y = "id", allow.cartesian=TRUE)[year-birth_year <= 21
                                                           & year-birth_year >= 12]

df_connections <- df_connections[,.(duration = .N,
                                    log_past_firm_size = mean(log(firm_size)),
                                    first_year = min(year),
                                    last_year = max(year)),
                                 by = .(id,id_firm)]
# get current firm size

df_connections = merge(df_connections,df_children_sample[,.(id,year)], by = "id")

employment_history = unique(employment_history[,.(id_firm,year,firm_size)])

df_connections = merge(df_connections,employment_history[,.(id_firm,year,firm_size)], by = c("id_firm","year"))
df_connections[,log_current_firm_size:= log(firm_size)]
df_connections[,firm_size := NULL]

rm(employment_history,df_parents,df_children_sample)

# save the file
df <- df_connections
filename <- paste0(data, "parents_firms_firm_size.Rdata")
save(df, file = filename)
rm(df_connections,filename,df)
