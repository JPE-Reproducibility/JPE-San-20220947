## load indirect connections
filename <- paste0(data, "connections_indirect_multiple_firm_size.Rdata")
load(filename)
df_connections <- df[,.(id,id_firm,con_max,con_min,contacts,max_lag,log_past_firm_size,log_current_firm_size)]
rm(df,filename)

## load parents_firms
filename <- paste0(data, "parents_firms_firm_size.Rdata")
load(filename)
parents_firms <- df[,.(id,id_firm,log_past_firm_size,log_current_firm_size)]
parents_firms[,parents_firms := 1]
rm(df,filename)

## merge the datasets 
# 1) phantom1: one contact that didn't work at the firm at time t
# 2) phantom2: 2 contacts that didn't work at the firm at time t
# 3) phantom3: 3+ contacts that didn't work at the firm at time t
# 4) weak1:  one contact that worked at the firm at time t
# 5) weak2:  2 contacts that worked at the firm at time t
# 6) weak3:  3+ contacts that worked at the firm at time t
# 7) mix:  at least one phantom and one weak
# 8) strong:  parent's past firm 

df_connections<- merge(df_connections,parents_firms[,.(id,id_firm,parents_firms)], by = c("id","id_firm"), all.x = TRUE )
df_connections[is.na(parents_firms), parents_firms := 0]
df_connections = df_connections[parents_firms != 1]
df_connections = rbind(df_connections,parents_firms,fill = T)

rm(parents_firms)

df_connections[parents_firms == 0 & contacts == 1 & con_max == 0 ,con_type := 1]
df_connections[parents_firms == 0 & contacts == 2 & con_max == 0  & con_min == 0 ,con_type := 2]
df_connections[parents_firms == 0 & contacts >= 3 & con_max == 0  & con_min == 0 ,con_type := 3]
df_connections[parents_firms == 0 & contacts == 1 & con_max == 1 ,con_type := 4]
df_connections[parents_firms == 0 & contacts == 2 & con_max == 1 & con_min == 1 ,con_type := 5]
df_connections[parents_firms == 0 & contacts >= 3 & con_max == 1 & con_min == 1 ,con_type := 6]
df_connections[parents_firms == 0 & con_max == 1 & con_min == 0 ,con_type := 7]
df_connections[parents_firms == 1  ,con_type := 8]

df_connections <- df_connections[,.(id,id_firm,con_type,max_lag,log_past_firm_size,log_current_firm_size)]

#  save the data

df <- df_connections
filename <- paste0(data, "connections_type_multiple2_firm_size.Rdata")
save(df, file = filename)
rm(df_connections,df)
