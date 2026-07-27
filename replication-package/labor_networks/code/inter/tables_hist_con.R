# load the connections data
filename <- paste0(data, "connections_type_multiple2.Rdata")
load(filename)
df_connections <- df
rm(df)

# load the employment_history file
filename <- paste0(data, "employment_history.Rdata")
load(filename)
employment_history <- df
rm(df,filename)

# load the children sample
filename <- paste0(data, "children_sample.Rdata")
load(filename)
df_children <- df
rm(df,filename)

# attach the child's (first-job) year to each connection
df_connections <- merge(df_connections, df_children[,.(id, year)], by = "id")

# load the sector file
filename <- paste0(data, "firm_industry_sector.Rdata")
load(filename)
df_industry <- df
rm(df,filename)
## hist of connections by type and firm 
bins=20
df_firms = df_connections[,.N, by = .(id_firm,con_type,year )]
df_firms[,id_firm_year := id_firm * 10000+year]
employment_history[,id_firm_year := id_firm * 10000+year]
df_firms_all = CJ(id_firm_year = unique(employment_history[year >= 2006,id_firm_year]),
                  con_type = unique(df_firms[,con_type]))
df_firms = merge(df_firms,df_firms_all, by = c("id_firm_year","con_type"), all.y = T)
df_firms[is.na(N),N := 0]
df_firms[,max := quantile(N,.95), by = .(con_type)]
df_firms[, N1 := N]
df_firms[N>max, N1 := max]
df_firms[,bin := ceiling(N1/max*(bins-1))+1 ]
table_firm = df_firms[,.(obs =.N, min_bin = min(N)), by = .(bin,con_type)]
table_firm = table_firm[obs>10]
setorder(table_firm,con_type,bin)
#filename <- paste0(output, "table_hist_con_firm.csv")
#write.csv(table_firm,filename)
rm(table_firm)
## connections in firms by type and sector
df_firms[,id_firm := round(floor(id_firm_year)/10000)]
df_firms[,year := id_firm_year - id_firm*10000 ]
df_firms = merge(df_firms,df_industry, by = "id_firm")
table_firm_sector =df_firms[,.(mean_con = mean(N), obs = .N), by = c("main_sector","con_type")]
setorder(table_firm_sector,con_type,main_sector)
table_firm_sector = table_firm_sector[obs>10]
#filename <- paste0(output, "table_mean_con_firm_sector.csv")
#write.csv(table_firm_sector,filename)
rm(table_firm_sector)
## connections by type and firm size
bins = 20
firm_size = employment_history[year >= 2006,.(firm_size = .N), by = .(id_firm,year)]
firm_size[,bin := ceiling((firm_size)/max(firm_size)*bins) ]
firm_size = merge(df_firms[,.(id_firm,year,con_type,N)],firm_size, by = c("id_firm","year"))
table_con_firm_size = firm_size[,.(mean_con = mean(N),obs = .N,min_firm_size = min(firm_size)),by = .(bin,con_type)]
setorder(table_con_firm_size,con_type,bin)
table_con_firm_size = table_con_firm_size[obs>10]
#filename <- paste0(output, "table_con_firm_size.csv")
#write.csv(table_con_firm_size,filename)
rm(table_con_firm_size,firm_size)
## connections of workers
df_workers = df_connections[,.N, by = .(id,con_type )]
df_workers_all = CJ(id = unique(df_children[,id]),con_type = unique(df_workers[,con_type]))
df_workers = merge(df_workers,df_workers_all, by = c("id","con_type"), all = T)
df_workers[is.na(N),N := 0]
df_workers =merge(df_workers,df_children[,.(id,sex,ethnicity)],by = "id")
df_workers[,max := quantile(N,.95), by = .(con_type)]
df_workers[, N1 := N]
df_workers[N>max, N := max]
count = 0
for (n in 1:5){
  
  df_workers1 = copy(df_workers)
  
  sex1 = -1
  ethnicity1 = -1
  
  if (n==2){
    df_workers1 = df_workers1[sex == 0]
    sex1 = 0
  }
  
  if (n==3){
    df_workers1 = df_workers1[sex == 1]
    sex1 = 1
  }
  
  if (n==4){
    df_workers1 = df_workers1[ethnicity == 0]
    ethnicity1 = 0
  }
  
  if (n==5){
    df_workers1 = df_workers1[ethnicity == 1]
    ethnicity1 = 1
  }
  
  
  for (k in 1:8){
    
    hist=  df_workers1[con_type  == k ,hist(N)]
    breaks = data.table(hist[["breaks"]])
    breaks = breaks[1:(.N-1)]
    hist =data.table(cbind( obs = hist[["counts"]],mids = hist[["mids"]], breaks))
    setnames(hist,"V1","mins")
    hist[,con_type := k]
    hist[,sex := sex1]
    hist[,ethnicity := ethnicity1]
    hist = hist[obs>=10]
    count = count+1
    if (count == 1) {
      table_worker = hist
    }
    else {
      table_worker = rbind(table_worker,hist)
    }
  }
}
filename <- paste0(output, "table_hist_con_worker.csv")
write.csv(table_worker,filename)
rm(table_worker,df_workers,df_workers_all)
## connections of workers by sector
df_connections = merge(df_connections,df_industry, by = "id_firm")
table_worker_sector =df_connections[,.(obs = .N), by = c("main_sector","con_type")]
#filename <- paste0(output, "table_hist_con_worker_sector.csv")
#write.csv(table_worker_sector,filename)
rm(df_connections,employment_history,df_firms,df_industry,table_worker_sector)
## connections by past firm size
# load the connections data
filename <- paste0(data, "connections_type_multiple2.Rdata")
load(filename)
df_connections <- df[,.(id,id_firm,con_type)]
rm(df)
first_year <- 2006
last_year <- 2015
count = 0
for (t in first_year:last_year){
  print(t)
  filename <- paste0(data, "connections_long_",t,".Rdata")
  load(filename)
  df_connections_long = df[,.(id,id_firm ,log_firm_size_past)]
  rm(df)
  df_connections_long <- merge(df_connections_long,df_connections, by = c("id","id_firm"))
  count = count+1
  if (count == 1) {
    df_connections_long1 = df_connections_long
  }
  else {
    df_connections_long1 = rbind(df_connections_long1,df_connections_long)
  }
  rm(df_connections_long)
}
rm(df_connections)
count = 0 
for (k in 1:8){
  
  hist = df_connections_long1[con_type == k,hist(log_firm_size_past )]
  breaks = data.table(hist[["breaks"]])
  breaks = breaks[1:(.N-1)]
  hist =data.table(cbind( obs = hist[["counts"]],mids = hist[["mids"]], breaks))
  setnames(hist,"V1","mins")
  hist[,con_type := k]
  hist = hist[obs>=10]
  count = count+1
  if (count == 1) {
    table = hist
  }
  else {
    table = rbind(table,hist)
  }
  rm(hist,breaks)
}
#filename <- paste0(output, "table_hist_con_firm_size_past.csv")
#write.csv(table,filename)
rm(table,df_connections_long1)
## connections by current firm size
# load the connections data
filename <- paste0(data, "connections_type_multiple2.Rdata")
load(filename)
df_connections <- df[,.(id,id_firm,con_type)]
rm(df)
first_year <- 2006
last_year <- 2015
count = 0
for (t in first_year:last_year){
  print(t)
  filename <- paste0(data, "connections_long_",t,".Rdata")
  load(filename)
  df_connections_long = df[,.(id,id_firm ,log_firm_size_current)]
  rm(df)
  
  df_connections_long <- merge(df_connections_long,df_connections, by = c("id","id_firm"))
  
  count = count+1
  if (count == 1) {
    df_connections_long1 = df_connections_long
  }
  else {
    df_connections_long1 = rbind(df_connections_long1,df_connections_long)
  }
  rm(df_connections_long)
}
rm(df_connections)
count = 0 
for (k in 1:8){
  
  hist = df_connections_long1[con_type == k,hist(log_firm_size_current )]
  breaks = data.table(hist[["breaks"]])
  breaks = breaks[1:(.N-1)]
  hist =data.table(cbind( obs = hist[["counts"]],mids = hist[["mids"]], breaks))
  setnames(hist,"V1","mins")
  hist[,con_type := k]
  hist = hist[obs>=10]
  count = count+1
  if (count == 1) {
    table = hist
  }
  else {
    table = rbind(table,hist)
  }
  rm(hist,breaks)
}
#filename <- paste0(output, "table_hist_con_firm_size_current.csv")
#write.csv(table,filename)
rm(table,df_connections_long1)