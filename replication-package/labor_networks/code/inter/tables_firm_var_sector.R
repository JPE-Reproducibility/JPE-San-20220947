filename <- paste0(data, "connections_type.Rdata")
load(filename)
df_connections = df[con_type != 3,.(id,id_firm)]
rm(df)

filename <- paste0(data, "children_sample.Rdata")
load(filename)
df_children = df[,.(id,year)]
rm(df)

filename <- paste0(data, "firm_industry_sector.Rdata")
load(filename)
df_sector = df
rm(df)


filename <- paste0(data, "firms_duration_bins.Rdata")
load(filename)
df_duration = df
rm(df)


filename <- paste0(data, "firms_akm_res_bins.Rdata")
load(filename)
df_akm_res = df
rm(df)

filename <- paste0(data, "akm_firm.Rdata")
load(filename)
df_akm_firm = df
rm(df)

filename <- paste0(data, "akm_person_children_only.Rdata")
load(filename)
df_akm_person = df
rm(df)

df_connections = merge(df_connections,df_children,by = "id", all.x = T)
df_connections = merge(df_connections,df_sector[,.(id_firm,main_sector)],by = "id_firm", all.x = T)
df_connections = merge(df_connections,df_duration[,.(id_firm,duration_mean,duration_sd)],by = "id_firm", all.x = T)
df_connections = merge(df_connections,df_akm_res[,.(id_firm,akm_res)],by = "id_firm", all.x = T)
df_connections = merge(df_connections,df_akm_firm[,.(id_firm,firm_rank,year)],by = c("id_firm","year"), all.x = T)
df_connections = merge(df_connections,df_akm_person[,.(id,person_rank,year)],by = c("id","year"), all.x = T)

df_connections[,gap:=firm_rank - person_rank]

table_sector = df_connections[!is.na(main_sector),.(obs = .N,
                                                    duration_mean=  mean(duration_mean,na.rm =  T),
                                                    duration_sd =  mean(duration_sd,na.rm =  T),
                                                    duration_akm_res=  mean(akm_res,na.rm =  T),
                                                    gap=  mean(gap,na.rm =  T)
                                                    ), 
                              by = .(main_sector)]

setorder(table_sector,main_sector)


# export the table								
filename <- paste0(output, "table_firm_var_sector.csv")								
fwrite(table_sector,filename)		
rm(table_sector)



