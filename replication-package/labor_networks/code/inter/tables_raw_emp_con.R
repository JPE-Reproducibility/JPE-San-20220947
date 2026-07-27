
# load the children sample
filename <- paste0(data, "children_sample.Rdata")
load(filename)
df_children <- df
rm(df)


# load connections by firm 
filename <- paste0(data, "connections_type.Rdata")
load(filename)
df_connections <- df
rm(df)
df_connections <- merge(df_connections,df_children[,.(id,year)], by = "id")

# build employment data
df_employment <- df_children[,.(id,id_firm)]
df_employment[,employment := 1]

df_connections <- merge(df_connections,df_employment, by = c("id", "id_firm"), all.x = TRUE)
df_connections[is.na(employment),employment := 0]

# mean employment by con_type (for 1 and 2) and max_lag
df_connections <- df_connections[con_type == 1 | con_type == 2]
table1 <- df_connections[,.(.N, employment = mean(employment)), by = .(con_type,max_lag)]
setorder(table1, con_type, max_lag)

# export the table
filename <- paste0(output, "figure_raw_emp_con.csv")
write.csv(table1,filename)

