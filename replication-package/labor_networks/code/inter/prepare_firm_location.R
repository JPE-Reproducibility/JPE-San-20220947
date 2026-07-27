library(data.table)
library(ggplot2)
library(haven)

# load the employment_history file
filename <- paste0(data, "employment_history.Rdata")
load(filename)
employment_history <- df[year >= 2006]
rm(df)

df_firms_all <- unique(employment_history[,.(id_firm)])

# load the children sample 
filename <- paste0(data, "children_sample.Rdata")
load(filename)
df_children <- df[,.(id,year,id_firm)]
df_children[,child := 1]
rm(df)

# keep only observations that not in the children sample (so the location of children will not impact the location of firms)
employment_history <- merge(employment_history,df_children[,.(id,year,child)],by = c("id","year"),all.x = TRUE)
employment_history <- employment_history[is.na(child)]
employment_history[,child := NULL]
df_children[,child := NULL]

# merge with location in each year (information for 2000-2015)

for (t in 2006:2015){
  print(t)
filename <- paste0(data, "location_",t,".Rdata")
load(filename)
df_location <- df[,.(id,X,Y)]
rm(df)
df_location[,year := t]

employment_history <- merge(employment_history,df_location,by = c("id","year"), all.x = TRUE)
employment_history[year == t, X_temp := X]
employment_history[year == t, Y_temp := Y]
employment_history[,c("X","Y") := NULL]
rm(df_location)
}
colnames(employment_history)[colnames(employment_history) == "X_temp"] <- "X"
colnames(employment_history)[colnames(employment_history) == "Y_temp"] <- "Y"


# get the size and the median location of the people work in each year
df_firms <- employment_history[,.(firm_X = median(X, na.rm = TRUE),
                                  firm_Y = median(Y, na.rm = TRUE)),
                               by = .(id_firm,year)]


# for each firm, keep the location based on the latest year
df_firms <- df_firms[df_firms[, .I[which.max(year)],
                                      by = id_firm]$V1]
df_firms[,year := NULL]

df_firms_all <- merge(df_firms_all,df_firms,by = "id_firm", all.x = TRUE)


# save
df <- df_firms_all
filename <- paste0(data, "firm_location.Rdata")
save(df, file = filename)
rm(df,df_firms,df_firms_all,df_children,employment_history)
