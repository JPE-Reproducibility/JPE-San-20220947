
# load the children sample
filename <- paste0(data, "children_sample.Rdata")
load(filename)
df_children <- df
rm(df)

## get the firm and salary of first job of children
filename <- paste0(data, "employment_history.Rdata")
load(filename)
df_employment <- df
rm(df)
df_children = merge(df_children,df_employment[,.(id,year,salary)], by = c("id","year") , all.x = TRUE)
rm(df_employment)

## load firm premium
filename <- paste0(data, "akm_firm.Rdata")
load(filename)
df_akm_firm <- df[,.(id_firm,year,firm_rank)]
rm(df)

## get the firm premium of first-job firm
df_children = merge(df_children,df_akm_firm, by = c("id_firm","year") , all.x = TRUE)


## load firm premium of connected firms
filename <- paste0(data, "connections_firm_rank_multiple2.Rdata")
load(filename)
df_connections <- df
rm(df)

## merge with the average firm premium for connected firms
df_children = merge(df_children,df_connections, by = c("id") , all.x = TRUE)

## merge with connections type at first firm
filename <- paste0(data, "connections_type_multiple2.Rdata")
load(filename)
df_children = merge(df_children,df[,.(id,id_firm,con_type)], by = c("id","id_firm") , all.x = TRUE)
df_children[is.na(con_type),con_type := 0]
rm(df)

# keep the relevant vars
df_wages <- df_children[,.(id,
                           id_firm,
                           year,
                           sex,
                           age = year - birth_year,
                           education = 1*(education>0),
                           ethnicity,
                           salary,
                           firm_rank,
                           con_type,
                           firm_rank_con1,
                           firm_rank_con2,
                           firm_rank_con3,
                           firm_rank_con4,
                           firm_rank_con5,
                           firm_rank_con6,
                           firm_rank_con7,
                           firm_rank_con8,
                           firm_rank_con123,
                           firm_rank_con456,
                           firms_con1,
                           firms_con2,
                           firms_con3,
                           firms_con4,
                           firms_con5,
                           firms_con6,
                           firms_con7,
                           firms_con8,
                           firms_con123,
                           firms_con456)]
rm(df_children,df_akm_firm,df_connections)


# save the file
df <- df_wages
filename <- paste0(data, "summary_children_multiple2.Rdata")
save(df, file = filename)
rm(df,df_wages)