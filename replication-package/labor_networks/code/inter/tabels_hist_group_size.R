# load the children sample
filename <- paste0(data, "children_sample.Rdata")
load(filename)
df_children <- df
rm(df)
# create group variables
df_children[,group := interaction(factor(graduation_year ),factor(ethnicity),sep = ":")]
df_children[,group := interaction(group,factor(year),sep = ":")]
df_children[,group := interaction(group,factor(sex),sep = ":")]
df_children[,group := interaction(group,factor(education),sep = ":")]
df_children[,group := interaction(group,factor(district),sep = ":")]
table = df_children[,.(group_size = .N), by = "group"]
table[,log_group_size := log(group_size)]
hist  = weighted.hist(table[,(log_group_size)], plot = FALSE)
hist1 = weighted.hist(table[,(log_group_size)],table[,(group_size)], plot = FALSE)
breaks = data.table(hist[["breaks"]])
breaks = breaks[1:(.N-1)]
hist =data.table(cbind( groups = hist[["counts"]],mids = hist[["mids"]], breaks))
hist =data.table(hist,cbind( obs = hist1[["counts"]]))
# the mids column may be named "mids" or "mids.V1" depending on data.table version;
# the breaks column may be "V1"; rename both tolerantly
setnames(hist,"mids.V1","mids", skip_absent = TRUE)
setnames(hist,"V1","mins", skip_absent = TRUE)
hist = hist[obs>=10]
filename <- paste0(output, "table_hist_group_size.csv")
write.csv(hist,filename)
rm(hist,df_children,breaks,table)