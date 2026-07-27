# load the children sample
filename <- paste0(data, "children_sample.Rdata")
load(filename)
df_children <- df
rm(df)

# load connections by firm 
filename <- paste0(data, "connections_type_multiple2.Rdata")
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

df_connections4 <- df_connections[con_type == 4,.(firm_rank_con4 = mean(firm_rank, na.rm = TRUE),
                                                  firms_con4 = .N), by = "id"]

df_connections5 <- df_connections[con_type == 5,.(firm_rank_con5 = mean(firm_rank, na.rm = TRUE),
                                                  firms_con5 = .N), by = "id"]

df_connections6 <- df_connections[con_type == 6,.(firm_rank_con6 = mean(firm_rank, na.rm = TRUE),
                                                  firms_con6 = .N), by = "id"]

df_connections7 <- df_connections[con_type == 7,.(firm_rank_con7 = mean(firm_rank, na.rm = TRUE),
                                                  firms_con7 = .N), by = "id"]

df_connections8 <- df_connections[con_type == 8,.(firm_rank_con8 = mean(firm_rank, na.rm = TRUE),
                                                  firms_con8 = .N), by = "id"]

df_connections123 <- df_connections[con_type == 1 | con_type == 2 | con_type == 3,.(firm_rank_con123 = mean(firm_rank, na.rm = TRUE),
                                                  firms_con123 = .N), by = "id"]

df_connections456 <- df_connections[con_type == 4 | con_type == 5 | con_type == 6,.(firm_rank_con456 = mean(firm_rank, na.rm = TRUE),
                                                  firms_con456 = .N), by = "id"]


df_connections_firm_rank = merge(df_connections1,df_connections2,by = "id", all = TRUE)
df_connections_firm_rank = merge(df_connections_firm_rank,df_connections3,by = "id", all = TRUE)
df_connections_firm_rank = merge(df_connections_firm_rank,df_connections4,by = "id", all = TRUE)
df_connections_firm_rank = merge(df_connections_firm_rank,df_connections5,by = "id", all = TRUE)
df_connections_firm_rank = merge(df_connections_firm_rank,df_connections6,by = "id", all = TRUE)
df_connections_firm_rank = merge(df_connections_firm_rank,df_connections7,by = "id", all = TRUE)
df_connections_firm_rank = merge(df_connections_firm_rank,df_connections8,by = "id", all = TRUE)
df_connections_firm_rank = merge(df_connections_firm_rank,df_connections123,by = "id", all = TRUE)
df_connections_firm_rank = merge(df_connections_firm_rank,df_connections456,by = "id", all = TRUE)

df_connections_firm_rank[is.na(firms_con1), firms_con1 := 0 ]
df_connections_firm_rank[is.na(firms_con2), firms_con2 := 0 ]
df_connections_firm_rank[is.na(firms_con3), firms_con3 := 0 ]
df_connections_firm_rank[is.na(firms_con4), firms_con4 := 0 ]
df_connections_firm_rank[is.na(firms_con5), firms_con5 := 0 ]
df_connections_firm_rank[is.na(firms_con6), firms_con6 := 0 ]
df_connections_firm_rank[is.na(firms_con7), firms_con7 := 0 ]
df_connections_firm_rank[is.na(firms_con8), firms_con8 := 0 ]
df_connections_firm_rank[is.na(firms_con123), firms_con123 := 0 ]
df_connections_firm_rank[is.na(firms_con456), firms_con456 := 0 ]

df_connections_firm_rank[is.nan(firm_rank_con1), firm_rank_con1 := NA ]
df_connections_firm_rank[is.nan(firm_rank_con2), firm_rank_con2 := NA ]
df_connections_firm_rank[is.nan(firm_rank_con3), firm_rank_con3 := NA ]
df_connections_firm_rank[is.nan(firm_rank_con4), firm_rank_con4 := NA ]
df_connections_firm_rank[is.nan(firm_rank_con5), firm_rank_con5 := NA ]
df_connections_firm_rank[is.nan(firm_rank_con6), firm_rank_con6 := NA ]
df_connections_firm_rank[is.nan(firm_rank_con7), firm_rank_con7 := NA ]
df_connections_firm_rank[is.nan(firm_rank_con8), firm_rank_con8 := NA ]
df_connections_firm_rank[is.nan(firm_rank_con123), firm_rank_con123 := NA ]
df_connections_firm_rank[is.nan(firm_rank_con456), firm_rank_con456 := NA ]

rm(df_connections1,df_connections2,df_connections3,df_connections4,df_connections5,df_connections6,
   df_connections7,df_connections8,df_connections123,df_connections456)

#  save the data
df <- df_connections_firm_rank
filename <- paste0(data, "connections_firm_rank_multiple2.Rdata")
save(df, file = filename)
rm(df,df_connections,df_children,df_connections_firm_rank)


