# load the employment_history file
filename <- paste0(data, "employment_history.Rdata")
load(filename)
employment_history <- df[,.(id,id_firm,year)]
rm(df)
# load the children sample
filename <- paste0(data, "children_sample1.Rdata")
load(filename)
df_children_sample1 <- df
rm(df)
# load children-parents link
filename <- paste0(data, "df_parents.Rdata")
load(filename)
df_parents <- df
rm(df)
count = 0
for (t in first_year:last_year){

  print(t)
  # subset the children whose first job is in year t
  df_children_sample <- df_children_sample1[year == t]

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


  if (count > 0){
    df_connections <- rbind(df_connections1,df_connections)

  }
  df_connections1 <- df_connections
  rm(df_connections)
  count = count + 1
}
rm(employment_history,df_children_sample1,df_parents)
# save the file
df <- df_connections1
filename <- paste0(data, "parents_firms_long.Rdata")
save(df, file = filename)
rm(df_connections1)
# save short file of parents' firms (one observation per id-id_firm)
df <- unique(df[,.(id,id_firm)])
filename <- paste0(data, "parents_firms.Rdata")
save(df, file = filename)
rm(df)
