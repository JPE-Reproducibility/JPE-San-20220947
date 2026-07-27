## load indirect connections
filename <- paste0(data, "connections_indirect.Rdata")
load(filename)
connections_indirect <- df[,.(id,id_firm,con_type = con,contacts,max_lag)]
rm(df,filename)

## load parents_firms
filename <- paste0(data, "parents_firms.Rdata")
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
filename <- paste0(data, "connections_type.Rdata")
save(df, file = filename)


## robustness check 1: create seperate category for more than one connections 
# 1) phantom: one cntact that didn't work at the firm at time t
# 2) weak:  one cntact that worked at the firm at time t
# 3) strong1:  parent's past firm 
# 4) strong2:  more than one cntact that worked at the firm

df_connections<- merge(connections_indirect,parents_firms, by = c("id","id_firm"), all = TRUE )
df_connections[, con_type := con_type + 1]
df_connections[is.na(parents_firms), parents_firms := 0]
df_connections[parents_firms == 1  ,con_type := 3]
df_connections[ contacts > 1 & parents_firms == 0 ,con_type := 4]
df_connections <- df_connections[,.(id,id_firm,con_type,max_lag)]

#  save the data

df <- df_connections
filename <- paste0(data, "connections_type_rob1.Rdata")
save(df, file = filename)

## robustness check 2: do not use number of contacts in this definition 
# 1) phantom: one cntact that didn't work at the firm at time t
# 2) weak:  one cntact that worked at the firm at time t
# 3) strong:  parent's past firm 

df_connections<- merge(connections_indirect,parents_firms, by = c("id","id_firm"), all = TRUE )
df_connections[, con_type := con_type + 1]
df_connections[is.na(parents_firms), parents_firms := 0]
df_connections[parents_firms == 1 ,con_type := 3]
df_connections <- df_connections[,.(id,id_firm,con_type,max_lag)]

#  save the data

df <- df_connections
filename <- paste0(data, "connections_type_rob2.Rdata")
save(df, file = filename)
rm(df,df_connections,filename,connections_indirect,parents_firms)