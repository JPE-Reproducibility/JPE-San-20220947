
filename <- paste0(data, "population.Rdata")
load(filename)
df_parents <- df[,.(id,id_father,id_mother)]

rm(df)

df_fathers  <- df_parents[,.(id1 = id , id2 = id_father )]
df_fathers[, type := 0]
df_mothers  <- df_parents[,.(id1 = id , id2 = id_mother )]
df_mothers[, type := 1]

df_parents <- rbind(df_fathers,df_mothers)
rm(df_fathers,df_mothers)
df_parents <- unique(df_parents)
df_parents <- df_parents[!is.na(id1)]
df_parents <- df_parents[!is.na(id2)]

df <- df_parents
filename <- paste0(data, "df_parents.Rdata")
save(df, file = filename)
rm(df)
df_parents[, type := NULL ]

