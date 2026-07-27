# load the parents firms file
filename <- paste0(data, "parents_firms_employment.Rdata")
load(filename)
df_parents <- unique(df[,.(id)])
df_parents[,ind_parent_firm := 1]
rm(df,filename)

# load the temporary children sample
filename <- paste0(data, "children_sample1_employment.Rdata")
load(filename)
df_children <- df
rm(df,filename)

# keep only children with at least one parent firm
df_children <- merge(df_children,df_parents, by = "id")

# save the file
df <- df_children
filename <- paste0(data, "children_sample_employment.Rdata")
save(df, file = filename)
rm(df,df_children,df_parents)