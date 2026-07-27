# load the children sample 
filename <- paste0(data, "children_sample.Rdata")
load(filename)
df_children <- df[,.(id)]
df_children[,child := 1]
rm(df)


# load the employment history file
# keep only observations that are not in the children sample
filename <- paste0(data, "employment_history.Rdata")
load(filename)
df_wages <- merge(df,df_children,by = "id", all.x = T)

df_wages <- df_wages[is.na(child)]
df_wages[,child := NULL]

# get the size and av. salary of firms each year
df_firms <- df_wages[,.(firm_size = .N,
                        firm_salary = mean(salary)),
                     by = c("id_firm","year")]

# get akm firm premium

filename <- paste0(data, "akm_firm.Rdata")
load(filename)
df_firms <- merge(df_firms, df[,.(id_firm,year,firm_rank)],
                               by = c("id_firm","year"), all.x = T)

# save the file
df <- df_firms
filename <- paste0(data, "firm_year.Rdata")
save(df, file = filename)
rm(df,df_firms,df_wages,df_children)
