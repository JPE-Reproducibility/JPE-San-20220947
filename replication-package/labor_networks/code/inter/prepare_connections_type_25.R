## save a file by con type 
filename <- paste0(data, "connections_indirect_25.Rdata")
load(filename)
connections_indirect <- df[,.(id,id_firm,con_type = con,contacts,max_lag)]
rm(df,filename)

## load parents_firms
filename <- paste0(data, "parents_firms_25.Rdata")
load(filename)
parents_firms <- df[,.(id,id_firm)]
parents_firms[,parents_firms := 1]
rm(df,filename)

## merge the datasets 
# 1) phantom: one contact that didn't work at the firm at time t
# 2) weak:  one contact that worked at the firm at time t
# 3) strong:  parent's past firm or more than one contact that worked at the firm

df_connections<- merge(connections_indirect,parents_firms, by = c("id","id_firm"), all = TRUE )
df_connections[, con_type := con_type + 1]
df_connections[is.na(parents_firms), parents_firms := 0]
df_connections[parents_firms == 1 | contacts > 1 ,con_type := 3]
df_connections <- df_connections[,.(id,id_firm,con_type,max_lag)]

#  save the data

df <- df_connections
filename <- paste0(data, "connections_type_25.Rdata")
save(df, file = filename)
rm(df,df_connections,parents_firms,connections_indirect)

