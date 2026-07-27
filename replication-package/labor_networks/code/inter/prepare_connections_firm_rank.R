# load the children sample
filename <- paste0(data, "children_sample.Rdata")
load(filename)
df_children <- df
rm(df)

# load connections by firm 
filename <- paste0(data, "connections_type.Rdata")
load(filename)
df_connections <- df[,.(id,id_firm,con_type)]
rm(df)
df_connections <- merge(df_children[,.(id,year)],df_connections, by = "id", all.x = T)


## load firm premium
filename <- paste0(data, "akm_firm.Rdata")
load(filename)
df_akm_firm <- df[,.(id_firm,year,firm_rank)]
rm(df)

# get the firm rank of each connection
df_connections <- merge(df_connections,df_akm_firm, by = c("id_firm","year"), all.x = TRUE)
rm(df_akm_firm)
# calculate the average firm premium and number of connections by con type


df_connections1 <- df_connections[con_type == 1,.(firm_rank_con1 = mean(firm_rank, na.rm = TRUE),
                                                  firms_con1 = .N), by = "id"]

df_connections2 <- df_connections[con_type == 2,.(firm_rank_con2 = mean(firm_rank, na.rm = TRUE),
                                                  firms_con2 = .N), by = "id"]

df_connections3 <- df_connections[con_type == 3,.(firm_rank_con3 = mean(firm_rank, na.rm = TRUE),
                                                  firms_con3 = .N), by = "id"]

df_connections_firm_rank = merge(df_connections1,df_connections2,by = "id", all = TRUE)
df_connections_firm_rank = merge(df_connections_firm_rank,df_connections3,by = "id", all = TRUE)

df_connections_firm_rank[is.na(firms_con1), firms_con1 := 0 ]
df_connections_firm_rank[is.na(firms_con2), firms_con2 := 0 ]
df_connections_firm_rank[is.na(firms_con3), firms_con3 := 0 ]

df_connections_firm_rank[is.nan(firm_rank_con1), firm_rank_con1 := NA ]
df_connections_firm_rank[is.nan(firm_rank_con2), firm_rank_con2 := NA ]
df_connections_firm_rank[is.nan(firm_rank_con3), firm_rank_con3 := NA ]

rm(df_connections1,df_connections2,df_connections3)

#  save the data
df <- df_connections_firm_rank
filename <- paste0(data, "connections_firm_rank.Rdata")
save(df, file = filename)
rm(df,df_connections,df_children,df_connections_firm_rank)


