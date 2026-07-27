connections_file = "connections_type_multiple2_firm_size.Rdata"
filename <- paste0(data,connections_file )
load(filename)



count = 0 
for (k in 1:8){
  
  hist = df[con_type == k,hist(log_past_firm_size )]
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
filename <- paste0(output, "table_hist_con_past_firmsize_multiple2.csv")
write.csv(table,filename)



count = 0 
for (k in 1:8){
  
  hist = df[con_type == k,hist(log_current_firm_size )]
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
filename <- paste0(output, "table_hist_con_current_firmsize_multiple2.csv")
write.csv(table,filename)
