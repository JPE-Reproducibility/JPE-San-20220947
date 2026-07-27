###########################
###########################
###########################

get.reg.emp.con.data <- function(df_children,
                       connections_file = "connections_type.Rdata") {
  
# load connections by firm 
filename <- paste0(data,connections_file )
load(filename)
df_connections <- df
rm(df)
df_connections <- merge(df_connections,df_children[,.(id,year)], by = "id")


# gen groups of children
df_children[,education := 1* (education > 0)]
df_groups <- df_children[,.(n = .N), by = c("year","birth_year","ethnicity","sex","education","district")]
df_groups <- df_groups[n>1]
df_groups[,group := 1:.N]
df_children = merge(df_children,df_groups, by = c("year","birth_year","ethnicity","sex","education","district"))


# get the group of each child in the connections data
df_connections <- merge(df_children[,.(id,group)], df_connections, by = "id")


# build employment data
df_employment <- df_children[,.(id,id_firm)]
df_employment[,employment := 1]


# get the sum of employment in connected and non-connected group-firm pairs

df_employment_group <- merge(df_connections[,.(id,id_firm,con = 1)],df_employment, by = c("id","id_firm"),all = TRUE)
df_employment_group[is.na(employment), employment := 0]
df_employment_group[is.na(con), con := 0]
df_employment_group <- merge(df_employment_group,df_children[,.(id,group)], by = "id")

df_employment_group <- df_employment_group[,.(employment_1 = sum(employment*con),
                                              employment_0 = sum(employment*(1-con)),
                                              n_1 = sum(con)),
                                           by = .(group,id_firm)]

# get the number of children in each group
df_employment_group <- merge(df_employment_group,df_groups[,.(group,n)],by = "group")

# keep only group-firm pairs with variation in con
df_employment_group <- df_employment_group[n_1 > 0 & n_1 < n]

# get the average employment for connected and nonconnected pairs
df_employment_group[,n_0 := n - n_1]
df_employment_group <- df_employment_group[,.(group,id_firm,n_0,
                       employment_1 = employment_1/n_1 ,
                       employment_0 = employment_0/n_0) ]

# get the difference between them and multiply by 100
df_employment_group[,employment_1 := employment_1 * 100]
df_employment_group [,employment_0 := employment_0 * 100]

df_employment_group[,employment := employment_1 - employment_0]
df_employment_group[,employment_1 := NULL]

# get the average of connections measure by group-firm
df_connections_groups <- df_connections[,
                                         .(con1 = mean(1 * (con_type == 1)),
                                           con2 = mean(1 * (con_type == 2)),
                                           con3 = mean(1 * (con_type == 3)),
                                           con1m = mean(1 * (con_type == 1 & max_lag < 0 )),
                                           con1p = mean(1 * (con_type == 1 & max_lag > 0 )),
                                           con1m5 = mean(1 * (con_type == 1 & max_lag == -5)),
                                           con1m4 = mean(1 * (con_type == 1 & max_lag == -4)),
                                           con1m3 = mean(1 * (con_type == 1 & max_lag == -3)),
                                           con1m2 = mean(1 * (con_type == 1 & max_lag == -2)),
                                           con1m1 = mean(1 * (con_type == 1 & max_lag == -1)),
                                           con1p1 = mean(1 * (con_type == 1 & max_lag == 1)),
                                           con1p2 = mean(1 * (con_type == 1 & max_lag == 2)),
                                           con1p3 = mean(1 * (con_type == 1 & max_lag == 3)),
                                           con1p4 = mean(1 * (con_type == 1 & max_lag == 4)),
                                           con1p5 = mean(1 * (con_type == 1 & max_lag == 5)),   
                                           con2p0 = mean(1 * (con_type == 2 & max_lag == 0)),
                                           con2p1 = mean(1 * (con_type == 2 & max_lag == 1)),
                                           con2p2 = mean(1 * (con_type == 2 & max_lag == 2)),
                                           con2p3 = mean(1 * (con_type == 2 & max_lag == 3)),
                                           con2p4 = mean(1 * (con_type == 2 & max_lag == 4)),
                                           con2p5 = mean(1 * (con_type == 2 & max_lag == 5))),
                                        by = .(group,id_firm)]

rm(df_connections)
df_reg <- merge(df_employment_group,df_connections_groups, by = c("group", "id_firm"))
rm(df_employment_group,df_connections_groups)

# get group vars
df_reg <- merge(df_reg,df_groups[,.(group,ethnicity,sex,education)], by = "group")

return(df_reg)
}
###########################
###########################
###########################

get.reg.emp.con.data.multiple2 <- function(df_children,
                                 connections_file = "connections_type_multiple2.Rdata") {
  
    # load connections by firm 
    filename <- paste0(data,connections_file )
    load(filename)
    df_connections <- df
    rm(df)
    df_connections <- merge(df_connections,df_children[,.(id,year)], by = "id")
    
    
    # gen groups of children
    df_children[,education := 1* (education > 0)]
    df_groups <- df_children[,.(n = .N), by = c("year","birth_year","ethnicity","sex","education","district")]
    df_groups <- df_groups[n>1]
    df_groups[,group := 1:.N]
    df_children = merge(df_children,df_groups, by = c("year","birth_year","ethnicity","sex","education","district"))
    
    
    # get the group of each child in the connections data
    df_connections <- merge(df_children[,.(id,group)], df_connections, by = "id")
    
    
    # build employment data
    df_employment <- df_children[,.(id,id_firm)]
    df_employment[,employment := 1]
    
    
    # get the sum of employment in connected and non-connected group-firm pairs
    
    df_employment_group <- merge(df_connections[,.(id,id_firm,con = 1)],df_employment, by = c("id","id_firm"),all = TRUE)
    df_employment_group[is.na(employment), employment := 0]
    df_employment_group[is.na(con), con := 0]
    df_employment_group <- merge(df_employment_group,df_children[,.(id,group)], by = "id")
    
    df_employment_group <- df_employment_group[,.(employment_1 = sum(employment*con),
                                                  employment_0 = sum(employment*(1-con)),
                                                  n_1 = sum(con)),
                                               by = .(group,id_firm)]
    
    # get the number of children in each group
    df_employment_group <- merge(df_employment_group,df_groups[,.(group,n)],by = "group")
    
    # keep only group-firm pairs with variation in con
    df_employment_group <- df_employment_group[n_1 > 0 & n_1 < n]
    
    # get the average employment for connected and nonconnected pairs
    df_employment_group[,n_0 := n - n_1]
    df_employment_group <- df_employment_group[,.(group,id_firm,n_0,
                                                  employment_1 = employment_1/n_1 ,
                                                  employment_0 = employment_0/n_0) ]
    
    # get the difference between them and multiply by 100
    df_employment_group[,employment_1 := employment_1 * 100]
    df_employment_group [,employment_0 := employment_0 * 100]
    
    df_employment_group[,employment := employment_1 - employment_0]
    df_employment_group[,employment_1 := NULL]
    
    # get the average of connections measure by group-firm
    df_connections_groups <- df_connections[,
                                            .(con1 = mean(1 * (con_type == 1)),
                                              con2 = mean(1 * (con_type == 2)),
                                              con3 = mean(1 * (con_type == 3)),
                                              con4 = mean(1 * (con_type == 4)),
                                              con5 = mean(1 * (con_type == 5)),
                                              con6 = mean(1 * (con_type == 6)),
                                              con7 = mean(1 * (con_type == 7)),
                                              con8 = mean(1 * (con_type == 8))
                                              ),
                                            by = .(group,id_firm)]
    
    rm(df_connections)
    df_reg <- merge(df_employment_group,df_connections_groups, by = c("group", "id_firm"))
    rm(df_employment_group,df_connections_groups)
    
    # get group vars
    df_reg <- merge(df_reg,df_groups[,.(group,ethnicity,sex,education)], by = "group")
    
    return(df_reg)
  }

###########################
###########################
###########################

get.reg.emp.con.data.multiple2.firm.size <- function(df_children,min_size,max_size,type) {
  
  
  connections_file = "connections_type_multiple2_firm_size.Rdata"
  
  # load connections by firm 
  filename <- paste0(data,connections_file )
  load(filename)
  df_connections <- df
  rm(df)
  df_connections <- merge(df_connections,df_children[,.(id,year)], by = "id")
  
  # keep relevant size only
  if (type == "past") {
    df_connections = df_connections[log_past_firm_size >= min_size & log_past_firm_size < max_size]
    
  } 
  
  if (type == "current") {
    df_connections = df_connections[log_current_firm_size >= min_size & log_current_firm_size < max_size]
    
  } 
  
  df_connections = df_connections[,.(id,id_firm,con_type,max_lag )]
  # gen groups of children
  df_children[,education := 1* (education > 0)]
  df_groups <- df_children[,.(n = .N), by = c("year","birth_year","ethnicity","sex","education","district")]
  df_groups <- df_groups[n>1]
  df_groups[,group := 1:.N]
  df_children = merge(df_children,df_groups, by = c("year","birth_year","ethnicity","sex","education","district"))
  
  
  # get the group of each child in the connections data
  df_connections <- merge(df_children[,.(id,group)], df_connections, by = "id")
  
  
  # build employment data
  df_employment <- df_children[,.(id,id_firm)]
  df_employment[,employment := 1]
  
  
  # get the sum of employment in connected and non-connected group-firm pairs
  
  df_employment_group <- merge(df_connections[,.(id,id_firm,con = 1)],df_employment, by = c("id","id_firm"),all = TRUE)
  df_employment_group[is.na(employment), employment := 0]
  df_employment_group[is.na(con), con := 0]
  df_employment_group <- merge(df_employment_group,df_children[,.(id,group)], by = "id")
  
  df_employment_group <- df_employment_group[,.(employment_1 = sum(employment*con),
                                                employment_0 = sum(employment*(1-con)),
                                                n_1 = sum(con)),
                                             by = .(group,id_firm)]
  
  # get the number of children in each group
  df_employment_group <- merge(df_employment_group,df_groups[,.(group,n)],by = "group")
  
  # keep only group-firm pairs with variation in con
  df_employment_group <- df_employment_group[n_1 > 0 & n_1 < n]
  
  # get the average employment for connected and nonconnected pairs
  df_employment_group[,n_0 := n - n_1]
  df_employment_group <- df_employment_group[,.(group,id_firm,n_0,
                                                employment_1 = employment_1/n_1 ,
                                                employment_0 = employment_0/n_0) ]
  
  # get the difference between them and multiply by 100
  df_employment_group[,employment_1 := employment_1 * 100]
  df_employment_group [,employment_0 := employment_0 * 100]
  
  df_employment_group[,employment := employment_1 - employment_0]
  df_employment_group[,employment_1 := NULL]
  
  # get the average of connections measure by group-firm
  df_connections_groups <- df_connections[,
                                          .(con1 = mean(1 * (con_type == 1)),
                                            con2 = mean(1 * (con_type == 2)),
                                            con3 = mean(1 * (con_type == 3)),
                                            con4 = mean(1 * (con_type == 4)),
                                            con5 = mean(1 * (con_type == 5)),
                                            con6 = mean(1 * (con_type == 6)),
                                            con7 = mean(1 * (con_type == 7)),
                                            con8 = mean(1 * (con_type == 8))
                                          ),
                                          by = .(group,id_firm)]
  
  rm(df_connections)
  df_reg <- merge(df_employment_group,df_connections_groups, by = c("group", "id_firm"))
  rm(df_employment_group,df_connections_groups)
  
  # get group vars
  df_reg <- merge(df_reg,df_groups[,.(group,ethnicity,sex,education)], by = "group")
  
  return(df_reg)
}

###########################
###########################
###########################

get.reg.emp.con.data.multiple <- function(df_children,
                                          connections_file = "connections_type_multiple.Rdata") {
  
  # load connections by firm 
  filename <- paste0(data,connections_file )
  load(filename)
  df_connections <- df
  rm(df)
  df_connections <- merge(df_connections,df_children[,.(id,year)], by = "id")
  
  
  # gen groups of children
  df_children[,education := 1* (education > 0)]
  df_groups <- df_children[,.(n = .N), by = c("year","birth_year","ethnicity","sex","education","district")]
  df_groups <- df_groups[n>1]
  df_groups[,group := 1:.N]
  df_children = merge(df_children,df_groups, by = c("year","birth_year","ethnicity","sex","education","district"))
  
  
  # get the group of each child in the connections data
  df_connections <- merge(df_children[,.(id,group)], df_connections, by = "id")
  
  
  # build employment data
  df_employment <- df_children[,.(id,id_firm)]
  df_employment[,employment := 1]
  
  
  # get the sum of employment in connected and non-connected group-firm pairs
  
  df_employment_group <- merge(df_connections[,.(id,id_firm,con = 1)],df_employment, by = c("id","id_firm"),all = TRUE)
  df_employment_group[is.na(employment), employment := 0]
  df_employment_group[is.na(con), con := 0]
  df_employment_group <- merge(df_employment_group,df_children[,.(id,group)], by = "id")
  
  df_employment_group <- df_employment_group[,.(employment_1 = sum(employment*con),
                                                employment_0 = sum(employment*(1-con)),
                                                n_1 = sum(con)),
                                             by = .(group,id_firm)]
  
  # get the number of children in each group
  df_employment_group <- merge(df_employment_group,df_groups[,.(group,n)],by = "group")
  
  # keep only group-firm pairs with variation in con
  df_employment_group <- df_employment_group[n_1 > 0 & n_1 < n]
  
  # get the average employment for connected and nonconnected pairs
  df_employment_group[,n_0 := n - n_1]
  df_employment_group <- df_employment_group[,.(group,id_firm,n_0,
                                                employment_1 = employment_1/n_1 ,
                                                employment_0 = employment_0/n_0) ]
  
  # get the difference between them and multiply by 100
  df_employment_group[,employment_1 := employment_1 * 100]
  df_employment_group [,employment_0 := employment_0 * 100]
  
  df_employment_group[,employment := employment_1 - employment_0]
  df_employment_group[,employment_1 := NULL]
  
  # get the average of connections measure by group-firm
  df_connections_groups <- df_connections[,
                                          .(con1 = mean(1 * (con_type == 1)),
                                            con2 = mean(1 * (con_type == 2)),
                                            con3 = mean(1 * (con_type == 3)),
                                            con4 = mean(1 * (con_type == 4)),
                                            con5 = mean(1 * (con_type == 5))),
                                          by = .(group,id_firm)]
  
  rm(df_connections)
  df_reg <- merge(df_employment_group,df_connections_groups, by = c("group", "id_firm"))
  rm(df_employment_group,df_connections_groups)
  
  # get group vars
  df_reg <- merge(df_reg,df_groups[,.(group,ethnicity,sex,education)], by = "group")
  
  return(df_reg)
}




###########################
###########################
###########################

get.reg.emp.con.data.exit <- function(df_children) {
  
  # load connections by firm 
  filename <- paste0(data, "connections_type.Rdata")
  load(filename)
  df_connections <- df
  rm(df)
  df_connections <- merge(df_connections,df_children[,.(id,year)], by = "id")
  
  
  # gen groups of children
  df_children[,education := 1* (education > 0)]
  df_groups <- df_children[,.(n = .N), by = c("year","birth_year","ethnicity","sex","education","district")]
  df_groups <- df_groups[n>1]
  df_groups[,group := 1:.N]
  df_children = merge(df_children,df_groups, by = c("year","birth_year","ethnicity","sex","education","district"))
  
  
  # get the group of each child in the connections data
  df_connections <- merge(df_children[,.(id,group)], df_connections, by = "id")
  
  
  # build employment data
  df_employment <- df_children[,.(id,id_firm)]
  df_employment[,employment := 1]
  
  
  # get the sum of employment in connected and non-connected group-firm pairs
  
  df_employment_group <- merge(df_connections[,.(id,id_firm,con = 1)],df_employment, by = c("id","id_firm"),all = TRUE)
  df_employment_group[is.na(employment), employment := 0]
  df_employment_group[is.na(con), con := 0]
  df_employment_group <- merge(df_employment_group,df_children[,.(id,group)], by = "id")
  
  df_employment_group <- df_employment_group[,.(employment_1 = sum(employment*con),
                                                employment_0 = sum(employment*(1-con)),
                                                n_1 = sum(con)),
                                             by = .(group,id_firm)]
  
  # get the number of children in each group
  df_employment_group <- merge(df_employment_group,df_groups[,.(group,n)],by = "group")
  
  # keep only group-firm pairs with variation in con
  df_employment_group <- df_employment_group[n_1 > 0 & n_1 < n]
  
  # get the average employment for connected and nonconnected pairs
  df_employment_group[,n_0 := n - n_1]
  df_employment_group <- df_employment_group[,.(group,id_firm,n_0,
                                                employment_1 = employment_1/n_1 ,
                                                employment_0 = employment_0/n_0) ]
  
  # get the difference between them and multiply by 100
  df_employment_group[,employment_1 := employment_1 * 100]
  df_employment_group [,employment_0 := employment_0 * 100]
  
  df_employment_group[,employment := employment_1 - employment_0]
  df_employment_group[,employment_1 := NULL]
  
  # get the number of workers in each group
  df_employment_group <- merge(df_employment_group,df_groups[,.(group,n)], by = "group")
  rm(df_children,df_employment)
  
  # load the id of the pco
  filename <- paste0(data, "connections_id_pco.Rdata")
  load(filename)
  df_connections <- merge(df_connections,df, by = c("id","id_firm"), all.x = TRUE)
  
  
  # load the population data
  filename <- paste0(data, "population.Rdata")
  load(filename)
  df_population <- df[,.(id,birth_year,sex,death_year)]
  rm(df)
  
  # get the age, sex, and death year of the coworkers
  df_connections <- merge(df_connections,df_population, by.x = "id_pco", by.y = "id", all.x = TRUE)
  rm(df_population)
  
  
  # define connections that the last year the coworker worked at the firm was the year of her death or a year before
  df_connections[,death := 1 * ( (year + max_lag == death_year) | (year + max_lag == death_year - 1) )]
  df_connections[is.na(death), death := 0]
  
  
  # define connections that the co-worker left the firm exactly at the age of retirement (67 for males and 62 for females)
  df_connections[,retirement := 1 * ( ((sex == 0 )& (year + max_lag  - birth_year == 67)) | ((sex == 1) & (year + max_lag - birth_year  == 62)) )]
  df_connections[is.na(retirement), retirement := 0]
  
  # get the average of connections measure by group-firm
  df_connections_groups <- df_connections[,
                                          .(con3 = mean(1 * (con_type == 3)),
                                            con1d0 = mean(1 * (con_type == 1 & death == 0 )),
                                            con1d1 = mean(1 * (con_type == 1 & death == 1 )),
                                            con2d0 = mean(1 * (con_type == 2 & death == 0 )),
                                            con2d1 = mean(1 * (con_type == 2 & death == 1 )),
                                            con1r0 = mean(1 * (con_type == 1 & retirement == 0 )),
                                            con1r1 = mean(1 * (con_type == 1 & retirement == 1 )),
                                            con2r0 = mean(1 * (con_type == 2 & retirement == 0 )),
                                            con2r1 = mean(1 * (con_type == 2 & retirement == 1 )),
                                            con1dr0 = mean(1 * (con_type == 1 & (death == 0 &  retirement == 0 ) )),
                                            con1dr1 = mean(1 * (con_type == 1 & (death == 1 |  retirement == 1 ) )),
                                            con2dr0 = mean(1 * (con_type == 2 & (death == 0 &  retirement == 0 ) )),
                                            con2dr1 = mean(1 * (con_type == 2 & (death == 1 |  retirement == 1 ) ))),
                                          by = .(group,id_firm)]
  
  rm(df_connections)
  df_reg <- merge(df_employment_group,df_connections_groups, by = c("group", "id_firm"))
  rm(df_employment_group,df_connections_groups)
  
  return(df_reg)
}



###########################
###########################
###########################

get.reg.emp.con.data.placebo <- function(df_children) {
  
  
  # load connections by firm 
  filename <- paste0(data, "connections_type.Rdata")
  load(filename)
  df_connections <- df
  rm(df)
  df_connections <- merge(df_connections,df_children[,.(id,year)], by = "id")
  
  
  # gen groups of children
  df_children[,education := 1* (education > 0)]
  df_groups <- df_children[,.(n = .N), by = c("year","birth_year","ethnicity","sex","education","district")]
  df_groups <- df_groups[n>1]
  df_groups[,group := 1:.N]
  df_children = merge(df_children,df_groups, by = c("year","birth_year","ethnicity","sex","education","district"))
  
  # for each child, find another random child at the same group
  df_children[,id_placebo := sample(id), by = "group"]
  
  
  # get the group and the if of the placebo worker of each child in the connections data (keep only id from groups with more than 2 children)
  df_connections <- merge(df_children[,.(id,id_placebo,group)], df_connections, by = "id")
  
  
  # build employment data
  df_employment <- df_children[,.(id,id_firm)]
  df_employment[,employment := 1]
  
  
  # get the sum of employment in connected and non-connected group-firm pairs (assuming the connections of id is the connections of id_placebo)
  
  df_employment_group <- merge(df_connections[,.(id = id_placebo,id_firm,con = 1)],df_employment, by = c("id","id_firm"),all = TRUE)
  df_employment_group[is.na(employment), employment := 0]
  df_employment_group[is.na(con), con := 0]
  df_employment_group <- merge(df_employment_group,df_children[,.(id,group)], by = "id")
  
  df_employment_group <- df_employment_group[,.(employment_1 = sum(employment*con),
                                                employment_0 = sum(employment*(1-con)),
                                                n_1 = sum(con)),
                                             by = .(group,id_firm)]
  
  # get the number of children in each group
  df_employment_group <- merge(df_employment_group,df_groups[,.(group,n)],by = "group")
  
  # keep only group-firm pairs with variation in con
  df_employment_group <- df_employment_group[n_1 > 0 & n_1 < n]
  
  # get the average employment for connected and nonconnected pairs
  df_employment_group[,n_0 := n - n_1]
  df_employment_group <- df_employment_group[,.(group,id_firm,n_0,
                                                employment_1 = employment_1/n_1 ,
                                                employment_0 = employment_0/n_0) ]
  
  # get the difference between them and multiply by 100
  df_employment_group[,employment_1 := employment_1 * 100]
  df_employment_group [,employment_0 := employment_0 * 100]
  
  df_employment_group[,employment := employment_1 - employment_0]
  df_employment_group[,employment_1 := NULL]
  
  # get the number of workers in each group
  df_employment_group <- merge(df_employment_group,df_groups[,.(group,n)], by = "group")
  rm(df_children,df_employment)
  
  # get the average of connections measure by group-firm
  df_connections_groups <- df_connections[,
                                          .(con1 = mean(1 * (con_type == 1)),
                                            con2 = mean(1 * (con_type == 2)),
                                            con3 = mean(1 * (con_type == 3)),
                                            con1m = mean(1 * (con_type == 1 & max_lag < 0 )),
                                            con1p = mean(1 * (con_type == 1 & max_lag > 0 )),
                                            con1m5 = mean(1 * (con_type == 1 & max_lag == -5)),
                                            con1m4 = mean(1 * (con_type == 1 & max_lag == -4)),
                                            con1m3 = mean(1 * (con_type == 1 & max_lag == -3)),
                                            con1m2 = mean(1 * (con_type == 1 & max_lag == -2)),
                                            con1m1 = mean(1 * (con_type == 1 & max_lag == -1)),
                                            con1p1 = mean(1 * (con_type == 1 & max_lag == 1)),
                                            con1p2 = mean(1 * (con_type == 1 & max_lag == 2)),
                                            con1p3 = mean(1 * (con_type == 1 & max_lag == 3)),
                                            con1p4 = mean(1 * (con_type == 1 & max_lag == 4)),
                                            con1p5 = mean(1 * (con_type == 1 & max_lag == 5)),
                                            con2p0 = mean(1 * (con_type == 2 & max_lag == 0)),
                                            con2p1 = mean(1 * (con_type == 2 & max_lag == 1)),
                                            con2p2 = mean(1 * (con_type == 2 & max_lag == 2)),
                                            con2p3 = mean(1 * (con_type == 2 & max_lag == 3)),
                                            con2p4 = mean(1 * (con_type == 2 & max_lag == 4)),
                                            con2p5 = mean(1 * (con_type == 2 & max_lag == 5))),
                                          by = .(group,id_firm)]
  
  rm(df_connections)
  df_reg <- merge(df_employment_group,df_connections_groups, by = c("group", "id_firm"))
  rm(df_employment_group,df_connections_groups)
  
  # get group vars
  df_reg <- merge(df_reg,df_groups[,.(group,ethnicity,sex,education)], by = "group")
  
  
  return(df_reg)
}

###########################
###########################
###########################

get.reg.balancing.data <- function(df_children) {
  
  # load the firm locations of firms in the 5-500 dataset
  filename <- paste0(data, "firm_location.Rdata")
  load(filename)
  df_firms <- df
  rm(df)
  
  # get the industry of each firm
  filename <- paste0(data, "firm_industry.Rdata")
  load(filename)
  df_industry <- df
  rm(df)
  

  # merge the files (keep all firms in the 5-500 dataset)
  df_firms <- merge(df_firms,df_industry[,.(id_firm,firm_industry = industry)], by = "id_firm", all.x = TRUE)
  
  
  # load parent's firms
  filename <- paste0(data, "parents_firms.Rdata")
  load(filename)
  df <- df[,parent_firm := 1]
  parent_firms <- df
  rm(df)
  
  # build a dataset with parents industries
  parents_industries <- unique(merge(parent_firms,df_industry, by = "id_firm")[,.(id, parent_industry = industry)])
  rm(parent_firms,df_industry)

  # load connections by firm 
  filename <- paste0(data, "connections_type.Rdata")
  load(filename)
  df_connections <- df
  rm(df)
  df_connections <- merge(df_connections,df_children[,.(id,year)], by = "id")
  
  
  # gen groups of children
  df_children[,education := 1* (education > 0)]
  df_groups <- df_children[,.(n = .N), by = c("year","birth_year","ethnicity","sex","education","district")]
  df_groups <- df_groups[n>1]
  df_groups[,group := 1:.N]
  df_children = merge(df_children,df_groups, by = c("year","birth_year","ethnicity","sex","education","district"))
  
  
  # get the group of each child in the connections data
  df_connections <- merge(df_children[,.(id,group)], df_connections, by = "id")
  df_connections[,con := 1]
  
  # get the averages of worker-firm variables (distance, same_industry) by group-firm
  
  count <- 0
  for (g in 1:length(df_groups[,group])){
    
    print(g)
    # build a dataset of id-id_firm for each firm in the group
    df_connections3 <- df_connections[group == g]
    df_connections1 <- df_connections3[,.(id,id_firm,group)]
    df_connections1 <- merge(unique(df_connections1[,.(id,group)]),
                             unique(df_connections1[!is.na(id_firm),
                                                    .(id_firm,group)]),
                             by = "group", allow.cartesian = TRUE)
    
    # get connections and employment information
    df_connections1 = merge(df_connections1,df_connections3[,.(id,id_firm,con)],
                            by = c("id","id_firm"), all.x = TRUE)
    
    df_connections1[is.na(con), con := 0]
    
    # get children information
    df_connections1 = merge(df_connections1,df_children[,.(id,X,Y)],
                            by = c("id"), all.x = TRUE)
    # get firms information
    df_connections1 = merge(df_connections1,df_firms[,.(id_firm,firm_X,firm_Y,firm_industry)],
                            by = c("id_firm"),
                            all.x = TRUE)
    
    # calculate the distance between the firm and the child locations
    df_connections1[,distance := ((X - firm_X)^2 + (Y - firm_Y)^2)^.5]
    df_connections1[,log_distance := log(distance+1)]
    
    # load information on parents industries
    df_connections1 <- merge(df_connections1,parents_industries, by = "id", all.x = TRUE,allow.cartesian=TRUE)
    df_connections1[, same_industry := 1 * ( floor(firm_industry/10) == floor(parent_industry/10))]
    
   
     # collapse by id-id_firm (same industry = 1 if one of past parent's industry = current industry)
    df_connections1 <- df_connections1[,.(same_industry = max(same_industry),
                                          log_distance = mean(log_distance),
                                          group = mean(group),
                                          con = mean(con)),
                                       by = c("id", "id_firm")]
    
    
    df_connections1 <- df_connections1[,.( log_distance = mean(log_distance,na.rm = TRUE),
                                           same_industry = mean(same_industry,na.rm = TRUE)),
                                       by = c("group", "id_firm","con")]
    
    df_connections1 <- dcast(df_connections1, group + id_firm ~ con,
                             value.var = c("log_distance","same_industry"))
    
    if (count >0 ) {
      df_connections1 <- rbind(df_outcomes,df_connections1,fill=TRUE)
    }
    df_outcomes <- df_connections1
    
    rm(df_connections1,df_connections3)
    count = count + 1
  }
  
  rm(parents_industries,df_firms)
  df_outcomes[,log_distance := log_distance_1 - log_distance_0]
  df_outcomes[,same_industry := same_industry_1 - same_industry_0]

  df_outcomes[,log_distance_1 := NULL]
  df_outcomes[,same_industry_1 := NULL]

  # build employment data
  df_employment <- df_children[,.(id,id_firm)]
  df_employment[,employment := 1]
  
  
  # get the sum of employment in connected and non-connected group-firm pairs
  
  df_employment_group <- merge(df_connections[,.(id,id_firm,con = 1)],df_employment, by = c("id","id_firm"),all = TRUE)
  df_employment_group[is.na(employment), employment := 0]
  df_employment_group[is.na(con), con := 0]
  df_employment_group <- merge(df_employment_group,df_children[,.(id,group)], by = "id")
  
  df_employment_group <- df_employment_group[,.(employment_1 = sum(employment*con),
                                                employment_0 = sum(employment*(1-con)),
                                                n_1 = sum(con)),
                                             by = .(group,id_firm)]
  
  # get the number of children in each group
  df_employment_group <- merge(df_employment_group,df_groups[,.(group,n)],by = "group")
  
  # keep only group-firm pairs with variation in con
  df_employment_group <- df_employment_group[n_1 > 0 & n_1 < n]
  
  # get the average employment for connected and nonconnected pairs
  df_employment_group[,n_0 := n - n_1]
  df_employment_group <- df_employment_group[,.(group,id_firm,n_0,
                                                employment_1 = employment_1/n_1 ,
                                                employment_0 = employment_0/n_0) ]
  
  # get the difference between them and multiply by 100
  df_employment_group[,employment_1 := employment_1 * 100]
  df_employment_group [,employment_0 := employment_0 * 100]
  
  df_employment_group[,employment := employment_1 - employment_0]
  df_employment_group[,employment_1 := NULL]
  
  # get the number of workers in each group
  df_employment_group <- merge(df_employment_group,df_groups[,.(group,n)], by = "group")
  rm(df_children,df_employment,df_groups)
  
  # get the average of connections measure by group-firm
  df_connections_groups <- df_connections[,
                                          .(con1 = mean(1 * (con_type == 1)),
                                            con2 = mean(1 * (con_type == 2)),
                                            con3 = mean(1 * (con_type == 3))),
                                          by = .(group,id_firm)]
  
  rm(df_connections)
  df_reg <- merge(df_employment_group,df_connections_groups, by = c("group", "id_firm"))
  rm(df_employment_group,df_connections_groups)
  df_reg <- merge(df_reg,df_outcomes, by = c("group", "id_firm"), all.x = TRUE)
  rm(df_outcomes)
  
  return(df_reg)
}


###########################
###########################
###########################

get.reg.emp.con.data.rob1 <- function(df_children) {
  
  # load connections by firm 
  filename <- paste0(data, "connections_type_rob1.Rdata")
  load(filename)
  df_connections <- df
  rm(df)
  df_connections <- merge(df_connections,df_children[,.(id,year)], by = "id")
  
  
  # gen groups of children
  df_children[,education := 1* (education > 0)]
  df_groups <- df_children[,.(n = .N), by = c("year","birth_year","ethnicity","sex","education","district")]
  df_groups <- df_groups[n>1]
  df_groups[,group := 1:.N]
  df_children = merge(df_children,df_groups, by = c("year","birth_year","ethnicity","sex","education","district"))
  
  
  # get the group of each child in the connections data
  df_connections <- merge(df_children[,.(id,group)], df_connections, by = "id")
  
  
  # build employment data
  df_employment <- df_children[,.(id,id_firm)]
  df_employment[,employment := 1]
  
  
  # get the sum of employment in connected and non-connected group-firm pairs
  
  df_employment_group <- merge(df_connections[,.(id,id_firm,con = 1)],df_employment, by = c("id","id_firm"),all = TRUE)
  df_employment_group[is.na(employment), employment := 0]
  df_employment_group[is.na(con), con := 0]
  df_employment_group <- merge(df_employment_group,df_children[,.(id,group)], by = "id")
  
  df_employment_group <- df_employment_group[,.(employment_1 = sum(employment*con),
                                                employment_0 = sum(employment*(1-con)),
                                                n_1 = sum(con)),
                                             by = .(group,id_firm)]
  
  # get the number of children in each group
  df_employment_group <- merge(df_employment_group,df_groups[,.(group,n)],by = "group")
  
  # keep only group-firm pairs with variation in con
  df_employment_group <- df_employment_group[n_1 > 0 & n_1 < n]
  
  # get the average employment for connected and nonconnected pairs
  df_employment_group[,n_0 := n - n_1]
  df_employment_group <- df_employment_group[,.(group,id_firm,n_0,
                                                employment_1 = employment_1/n_1 ,
                                                employment_0 = employment_0/n_0) ]
  
  # get the difference between them and multiply by 100
  df_employment_group[,employment_1 := employment_1 * 100]
  df_employment_group [,employment_0 := employment_0 * 100]
  
  df_employment_group[,employment := employment_1 - employment_0]
  df_employment_group[,employment_1 := NULL]
  
  # get the average of connections measure by group-firm
  df_connections_groups <- df_connections[,
                                          .(con1 = mean(1 * (con_type == 1)),
                                            con2 = mean(1 * (con_type == 2)),
                                            con3 = mean(1 * (con_type == 3)),
                                            con4 = mean(1 * (con_type == 4))),
                                          by = .(group,id_firm)]
  
  rm(df_connections)
  df_reg <- merge(df_employment_group,df_connections_groups, by = c("group", "id_firm"))
  rm(df_employment_group,df_connections_groups)
  
  # get group vars
  df_reg <- merge(df_reg,df_groups[,.(group,ethnicity,sex,education)], by = "group")
  
  return(df_reg)
}



###########################
###########################
###########################

get.reg.emp.con.data.rob2 <- function(df_children) {
  
  # load connections by firm 
  filename <- paste0(data, "connections_type_rob2.Rdata")
  load(filename)
  df_connections <- df
  rm(df)
  df_connections <- merge(df_connections,df_children[,.(id,year)], by = "id")
  
  
  # gen groups of children
  df_children[,education := 1* (education > 0)]
  df_groups <- df_children[,.(n = .N), by = c("year","birth_year","ethnicity","sex","education","district")]
  df_groups <- df_groups[n>1]
  df_groups[,group := 1:.N]
  df_children = merge(df_children,df_groups, by = c("year","birth_year","ethnicity","sex","education","district"))
  
  
  # get the group of each child in the connections data
  df_connections <- merge(df_children[,.(id,group)], df_connections, by = "id")
  
  
  # build employment data
  df_employment <- df_children[,.(id,id_firm)]
  df_employment[,employment := 1]
  
  
  # get the sum of employment in connected and non-connected group-firm pairs
  
  df_employment_group <- merge(df_connections[,.(id,id_firm,con = 1)],df_employment, by = c("id","id_firm"),all = TRUE)
  df_employment_group[is.na(employment), employment := 0]
  df_employment_group[is.na(con), con := 0]
  df_employment_group <- merge(df_employment_group,df_children[,.(id,group)], by = "id")
  
  df_employment_group <- df_employment_group[,.(employment_1 = sum(employment*con),
                                                employment_0 = sum(employment*(1-con)),
                                                n_1 = sum(con)),
                                             by = .(group,id_firm)]
  
  # get the number of children in each group
  df_employment_group <- merge(df_employment_group,df_groups[,.(group,n)],by = "group")
  
  # keep only group-firm pairs with variation in con
  df_employment_group <- df_employment_group[n_1 > 0 & n_1 < n]
  
  # get the average employment for connected and nonconnected pairs
  df_employment_group[,n_0 := n - n_1]
  df_employment_group <- df_employment_group[,.(group,id_firm,n_0,
                                                employment_1 = employment_1/n_1 ,
                                                employment_0 = employment_0/n_0) ]
  
  # get the difference between them and multiply by 100
  df_employment_group[,employment_1 := employment_1 * 100]
  df_employment_group [,employment_0 := employment_0 * 100]
  
  df_employment_group[,employment := employment_1 - employment_0]
  df_employment_group[,employment_1 := NULL]
  
  # get the average of connections measure by group-firm
  df_connections_groups <- df_connections[,
                                          .(con1 = mean(1 * (con_type == 1)),
                                            con2 = mean(1 * (con_type == 2)),
                                            con3 = mean(1 * (con_type == 3))),
                                          by = .(group,id_firm)]
  
  rm(df_connections)
  df_reg <- merge(df_employment_group,df_connections_groups, by = c("group", "id_firm"))
  rm(df_employment_group,df_connections_groups)
  
  # get group vars
  df_reg <- merge(df_reg,df_groups[,.(group,ethnicity,sex,education)], by = "group")
  
  return(df_reg)
}



###########################
###########################
###########################

run.reg.emp.con <- function(df_reg,name_dep_var = 'employment') {
  
  df_reg[,dep_var := get(name_dep_var)]
  
  df_reg[,dep_var_0 := get(paste0(name_dep_var,"_0"))]
  
  est1 <- lm(dep_var  ~ -1 + con1 + con2 + con3 ,
               df_reg)
  
  est0 <- df_reg[!is.na(dep_var),sum(dep_var_0 * n_0)/sum(n_0)]
  
  table_temp <- data.table(c(est1[["coefficients"]],est0))
  table_temp <- transpose(table_temp)
  
  return(table_temp)
}

###########################
###########################
###########################

run.reg.emp.con.multiple <- function(df_reg,name_dep_var = 'employment') {
  
  df_reg[,dep_var := get(name_dep_var)]
  
  df_reg[,dep_var_0 := get(paste0(name_dep_var,"_0"))]
  
  est1 <- lm(dep_var  ~ -1 + con1 + con2 + con3  + con4  + con5 ,
             df_reg)
  
  est0 <- df_reg[!is.na(dep_var),sum(dep_var_0 * n_0)/sum(n_0)]
  
  table_temp <- data.table(c(est1[["coefficients"]],est0))
  table_temp <- transpose(table_temp)
  
  return(table_temp)
}


###########################
###########################
###########################

run.reg.emp.con.multiple2 <- function(df_reg,name_dep_var = 'employment') {
  
  df_reg[,dep_var := get(name_dep_var)]
  
  df_reg[,dep_var_0 := get(paste0(name_dep_var,"_0"))]
  
  est1 <- lm(dep_var  ~ -1 + con1 + con2 + con3  + con4  + con5  + con6  + con7  + con8 ,
             df_reg)
  
  est0 <- df_reg[!is.na(dep_var),sum(dep_var_0 * n_0)/sum(n_0)]
  
  table_temp <- data.table(c(est1[["coefficients"]],est0))
  table_temp <- transpose(table_temp)
  
  return(table_temp)
}


###########################
###########################
###########################


run.reg.emp.con.event <- function(df_reg,name_dep_var = 'employment') {
  
  df_reg[,dep_var := get(name_dep_var)]
  
  df_reg[,dep_var_0 := get(paste0(name_dep_var,"_0"))] # to make sure this line is ok (I think it was missing and worked only because it always run after the base regression)
  
  est1 <- lm(dep_var  ~ -1  + con3  +  con1m5 + con1m4  + con1m3 + con1m2 + con1m1 +
                 con1p1 + con1p2  + con1p3 + con1p4 + con1p5 + 
                 con2p0 + con2p1  + con2p2 + con2p3 + con2p4 + con2p5 ,
               df_reg)
  
  est0 <- df_reg[!is.na(dep_var),sum(dep_var_0 * n_0)/sum(n_0)]
  
  table_temp <- data.table(c(est1[["coefficients"]],est0))
  table_temp <- transpose(table_temp)
  
  return(table_temp)
}




###########################
###########################
###########################

# I couldn't run it due to memory shortage
run.reg.emp.con.event.multiple2 <- function(df_reg,name_dep_var = 'employment') {
  
  df_reg[,dep_var := get(name_dep_var)]
  
  df_reg[,dep_var_0 := get(paste0(name_dep_var,"_0"))] # to make sure this line is ok (I think it was missing and worked only because it always run after the base regression)
  
  est1 <- lm(dep_var  ~ -1  + con7 + con8  +  
               con1m5 + con1m4  + con1m3 + con1m2 + con1m1 +
               con1p1 + con1p2  + con1p3 + con1p4 + con1p5 + 
               con2m5 + con2m4  + con2m3 + con2m2 + con2m1 +
               con2p1 + con2p2  + con2p3 + con2p4 + con2p5 +
               con3m5 + con3m4  + con3m3 + con3m2 + con3m1 +
               con3p1 + con3p2  + con3p3 + con3p4 + con3p5 +
               con4p0 + con4p1  + con4p2 + con4p3 + con4p4 + con4p5 +
             con5p0 + con5p1  + con5p2 + con5p3 + con5p4 + con5p5 +
             con6p0 + con6p1  + con6p2 + con6p3 + con6p4 + con6p5 ,
             df_reg)
  
  est0 <- df_reg[!is.na(dep_var),sum(dep_var_0 * n_0)/sum(n_0)]
  
  table_temp <- data.table(c(est1[["coefficients"]],est0))
  table_temp <- transpose(table_temp)
  
  return(table_temp)
}

###########################
###########################
###########################

run.reg.emp.con.exit <- function(df_reg,name_ind_var ) {
  
  df_reg[,ind_var10 := get(paste0("con1",name_ind_var,"0"))]
  df_reg[,ind_var11 := get(paste0("con1",name_ind_var,"1"))]
  df_reg[,ind_var20 := get(paste0("con2",name_ind_var,"0"))]
  df_reg[,ind_var21 := get(paste0("con2",name_ind_var,"1"))]
  
  est1 <- lm(employment  ~ -1 + con3 +  ind_var10 + ind_var11 + ind_var20 + ind_var21,
               df_reg)
  
  
  est0 <- df_reg[!is.na(employment),sum(employment_0 * n_0)/sum(n_0)]
  
  
  table_temp <- data.table(c(est1[["coefficients"]],est0))
  table_temp <- transpose(table_temp)
  
  return(table_temp)
}



###########################
###########################
###########################

run.reg.emp.con.rob1 <- function(df_reg,name_dep_var = 'employment') {
  
  df_reg[,dep_var := get(name_dep_var)]
  
  df_reg[,dep_var_0 := get(paste0(name_dep_var,"_0"))]
  
  est1 <- lm(dep_var  ~ -1 + con1 + con2 + con3 + con4 ,
               df_reg)
  
  est0 <- df_reg[!is.na(dep_var),sum(dep_var_0 * n_0)/sum(n_0)]
  
  table_temp <- data.table(c(est1[["coefficients"]],est0))
  table_temp <- transpose(table_temp)
  
  return(table_temp)
}


###########################
###########################
###########################

get.statistics <- function(df_children,
                           connections_file = "connections_type.Rdata") {
  df_children1 <- df_children
  rm(df_children)
  # gen groups
  df_children1[,education := 1* (education > 0)]
  df_groups <- df_children1[,.(n = .N), by = c("year","birth_year","ethnicity","sex","education","district")]
  df_groups <- df_groups[n>1]
  df_groups[,group := 1:.N]
  
  # gen classes of groups for randomization
  df_groups <- cbind(df_groups,data.table( ceiling(5*runif(dim(df_groups)[1]))))
  df_children1 <- merge(df_children1,df_groups, by = c("year","birth_year","ethnicity","sex","education","district"))
  
  # load connections by firm 
  filename <- paste0(data, connections_file)
  load(filename)
  df_connections1 <- df
  rm(df)
  
  
  for (cc in 1:5) {
    df_children <- df_children1[V1 == cc]
    
    df_connections <- merge(df_connections1,df_children[,.(id,year)], by = "id")
    
    
    # get the group of each child in the connections data
    df_connections <- merge(df_children[,.(id,group)], df_connections, by = "id")
    
    # get con by group-firm
    df_connections <- df_connections[,.(id,id_firm,con = 1,group)]
    df_connections_group <- df_connections[,.(n_1 = sum(con)),
                                               by = .(group,id_firm)]
    
    # get the number of children in each group
    df_connections_group <- merge(df_connections_group,df_groups[,.(group,n)],by = "group")
    
    # keep only group-firm pairs with variation in con
    df_connections_group <- df_connections_group[n_1 > 0 & n_1 < n]
    
    
    x <- unique(df_connections_group[,.(group,n)])
    
    firms1 <- unique(df_connections_group[,.(id_firm)])
    obs1 <- df_connections_group[,.N]
    connections1 <- df_connections_group[,sum(n_1)]
    
    if (cc==1){
      firms <- firms1
      obs <-  obs1
      connections <- connections1
    }
    else {
      firms <- unique(rbind(firms,firms1))
      obs <- obs + obs1
      connections <- connections + connections1
    }
  }
  
  firms <- firms[,.N]  
  groups <- df_groups[,.N]
  workers <- df_children1[,.N]
  
  statistics <- data.table(obs,firms,groups,workers,connections)
  
  return(statistics)
}



###########################
###########################
###########################

get.statistics.size <- function(df_children,
                                min_size,max_size,type) {
  

    connections_file = "connections_type_multiple2_firm_size.Rdata"
    
    # load connections by firm 
    filename <- paste0(data,connections_file )
    load(filename)
    df_connections <- df
    rm(df)
    df_connections <- merge(df_connections,df_children[,.(id,year)], by = "id")
    
    # keep relevant size only
    if (type == "past") {
      df_connections = df_connections[log_past_firm_size >= min_size & log_past_firm_size < max_size]
      
    } 
    
    if (type == "current") {
      df_connections = df_connections[log_current_firm_size >= min_size & log_current_firm_size < max_size]
      
    } 
    
    df_connections1 = df_connections[,.(id,id_firm,con_type,max_lag )]
    rm(df_connections)
    
  df_children1 <- df_children
  rm(df_children)
  # gen groups
  df_children1[,education := 1* (education > 0)]
  df_groups <- df_children1[,.(n = .N), by = c("year","birth_year","ethnicity","sex","education","district")]
  df_groups <- df_groups[n>1]
  df_groups[,group := 1:.N]
  
  # gen classes of groups for randomization
  df_groups <- cbind(df_groups,data.table( ceiling(5*runif(dim(df_groups)[1]))))
  df_children1 <- merge(df_children1,df_groups, by = c("year","birth_year","ethnicity","sex","education","district"))
  
  
  
  for (cc in 1:5) {
    df_children <- df_children1[V1 == cc]
    
    df_connections <- merge(df_connections1,df_children[,.(id,year)], by = "id")
    
    
    # get the group of each child in the connections data
    df_connections <- merge(df_children[,.(id,group)], df_connections, by = "id")
    
    # get con by group-firm
    df_connections <- df_connections[,.(id,id_firm,con = 1,group)]
    df_connections_group <- df_connections[,.(n_1 = sum(con)),
                                           by = .(group,id_firm)]
    
    # get the number of children in each group
    df_connections_group <- merge(df_connections_group,df_groups[,.(group,n)],by = "group")
    
    # keep only group-firm pairs with variation in con
    df_connections_group <- df_connections_group[n_1 > 0 & n_1 < n]
    
    
    x <- unique(df_connections_group[,.(group,n)])
    
    firms1 <- unique(df_connections_group[,.(id_firm)])
    obs1 <- df_connections_group[,.N]
    connections1 <- df_connections_group[,sum(n_1)]
    
    if (cc==1){
      firms <- firms1
      obs <-  obs1
      connections <- connections1
    }
    else {
      firms <- unique(rbind(firms,firms1))
      obs <- obs + obs1
      connections <- connections + connections1
    }
  }
  
  firms <- firms[,.N]  
  groups <- df_groups[,.N]
  workers <- df_children1[,.N]
  
  statistics <- data.table(obs,firms,groups,workers,connections)
  
  return(statistics)
}


###########################
###########################
###########################

get.statistics.exit <- function(df_children) {
  
  df_children1 <- df_children
  rm(df_children)
  # gen groups
  df_children1[,education := 1* (education > 0)]
  df_groups <- df_children1[,.(n = .N), by = c("year","birth_year","ethnicity","sex","education","district")]
  df_groups <- df_groups[n>1]
  df_groups[,group := 1:.N]
  
  # gen classes of groups for randomization
  df_groups <- cbind(df_groups,data.table( ceiling(5*runif(dim(df_groups)[1]))))
  df_children1 <- merge(df_children1,df_groups, by = c("year","birth_year","ethnicity","sex","education","district"))
  
  # load connections by firm 
  filename <- paste0(data, "connections_type.Rdata")
  load(filename)
  df_connections1 <- df
  rm(df)
  
  
  # load the population data
  filename <- paste0(data, "population.Rdata")
  load(filename)
  df_population <- df[,.(id,birth_year,sex,death_year)]
  rm(df)
  
  # load the id of the pco
  filename <- paste0(data, "connections_id_pco.Rdata")
  load(filename)
  df_connections_id_pco <- df
  rm(df)
  
  for (cc in 1:5) {
    print(cc)
    df_children <- df_children1[V1 == cc]
    
    df_connections <- merge(df_connections1,df_children[,.(id,year)], by = "id")
    
    
    # get the group of each child in the connections data
    df_connections <- merge(df_children[,.(id,group)], df_connections, by = "id")
    

    # get the id of the pco
    df_connections <- merge(df_connections,df_connections_id_pco, by = c("id","id_firm"), all.x = TRUE)
    
 
    # get the age, sex, and death year of the coworkers
    df_connections <- merge(df_connections,df_population, by.x = "id_pco", by.y = "id", all.x = TRUE)
    
    # define connections that the last year the coworker worked at the firm was the year of her death or a year before
    df_connections[,death := 1 * ( (year + max_lag == death_year) | (year + max_lag == death_year - 1) )]
    df_connections[is.na(death), death := 0]
    
    
    # define connections that the co-worker left the firm exactly at the age of retirement (67 for males and 62 for females)
    df_connections[,retirement := 1 * ( ((sex == 0 )& (year + max_lag  - birth_year == 67)) | ((sex == 1) & (year + max_lag - birth_year  == 62)) )]
    df_connections[is.na(retirement), retirement := 0]
    
    
    
    
    
    
    df_connections_group <- df_connections[,.(n_con = .N,
                                           n_1d0 = sum(con_type == 1 & death == 0),
                                           n_1d1 = sum(con_type == 1 & death == 1),
                                           n_2d0 = sum(con_type == 2 & death == 0),
                                           n_2d1 = sum(con_type == 2 & death == 1),
                                           n_1r0 = sum(con_type == 1 & retirement == 0),
                                           n_1r1 = sum(con_type == 1 & retirement == 1),
                                           n_2r0 = sum(con_type == 2 & retirement == 0),
                                           n_2r1 = sum(con_type == 2 & retirement == 1),
                                           n_1dr0 = sum(con_type == 1 & (death == 0 & retirement == 0)),
                                           n_1dr1 = sum(con_type == 1 & (death == 1 | retirement == 1)),
                                           n_2dr0 = sum(con_type == 2 & (death == 0 & retirement == 0)),
                                           n_2dr1 = sum(con_type == 2 & (death == 1 | retirement == 1)),
                                           n_3 = sum(con_type == 3)),
                                           by = .(group,id_firm)]
    
    # get the number of children in each group
    df_connections_group <- merge(df_connections_group,df_groups[,.(group,n)],by = "group")


    # keep only group-firm pairs with variation in con
    df_connections_group <- df_connections_group[n_con > 0 & n_con < n]
    
    
    x <- unique(df_connections_group[,.(group,n)])
    
    firms1 <- unique(df_connections_group[,.(id_firm)])
    obs1 <- df_connections_group[,.N]
    connections_1 <- df_connections_group[,sum(n_con)]
    connections_3_1 <- df_connections_group[,sum(n_3)]
    connections_1d0_1 <- df_connections_group[,sum(n_1d0)]
    connections_1d1_1 <- df_connections_group[,sum(n_1d1)]
    connections_2d0_1 <- df_connections_group[,sum(n_2d0)]
    connections_2d1_1 <- df_connections_group[,sum(n_2d1)]
    connections_1r0_1 <- df_connections_group[,sum(n_1r0)]
    connections_1r1_1 <- df_connections_group[,sum(n_1r1)]
    connections_2r0_1 <- df_connections_group[,sum(n_2r0)]
    connections_2r1_1 <- df_connections_group[,sum(n_2r1)]
    connections_1dr0_1 <- df_connections_group[,sum(n_1dr0)]
    connections_1dr1_1 <- df_connections_group[,sum(n_1dr1)]
    connections_2dr0_1 <- df_connections_group[,sum(n_2dr0)]
    connections_2dr1_1 <- df_connections_group[,sum(n_2dr1)]
    
    if (cc==1){
      firms <- firms1
      obs <-  obs1
      connections <- connections_1
      connections_3 <- connections_3_1
      connections_1d0 <- connections_1d0_1
      connections_1d1 <- connections_1d1_1
      connections_2d0 <- connections_2d0_1
      connections_2d1 <- connections_2d1_1
      connections_1r0 <- connections_1r0_1
      connections_1r1 <- connections_1r1_1
      connections_2r0 <- connections_2r0_1
      connections_2r1 <- connections_2r1_1
      connections_1dr0 <- connections_1dr0_1
      connections_1dr1 <- connections_1dr1_1
      connections_2dr0 <- connections_2dr0_1
      connections_2dr1 <- connections_2dr1_1
    }
    else {
      firms <- unique(rbind(firms,firms1))
      obs <- obs + obs1
      connections <- connections + connections_1
      connections_3 <- connections_3 + connections_3_1
      connections_1d0 <- connections_1d0 + connections_1d0_1
      connections_1d1 <- connections_1d1 + connections_1d1_1
      connections_2d0 <- connections_2d0 + connections_2d0_1
      connections_2d1 <- connections_2d1 + connections_2d1_1
      connections_1r0 <- connections_1r0 + connections_1r0_1
      connections_1r1 <- connections_1r1 + connections_1r1_1
      connections_2r0 <- connections_2r0 + connections_2r0_1
      connections_2r1 <- connections_2r1 + connections_2r1_1
      connections_1dr0 <- connections_1dr0 + connections_1dr0_1
      connections_1dr1 <- connections_1dr1 + connections_1dr1_1
      connections_2dr0 <- connections_2dr0 + connections_2dr0_1
      connections_2dr1 <- connections_2dr1 + connections_2dr1_1
    }
  }
  
  firms <- firms[,.N]  
  groups <- df_groups[,.N]
  workers <- df_children1[,.N]
  
  statistics <- data.table(obs,firms,groups,workers,connections,connections_3,
                           connections_1d0,  connections_1d1,  connections_2d0,  connections_2d1,
                            connections_1r0,  connections_1r1, connections_2r0,  connections_2r1,
                           connections_1dr0,  connections_1dr1, connections_2dr0,  connections_2dr1
  )
  
  return(statistics)
}



###########################
###########################
###########################

prepare.reg.emp.con.table <- function(table) {
  
  table[,ratio21 := (V4 + V2)/(V4 + V1)]
  table[,ratio31 := (V4 + V3)/(V4 + V1)]
  
  table[,diff21 := ( V2 - V1)]
  table[,diff31 := ( V3 - V1)]
  
  table <- table[,.(con1 = mean(V1),
                      con2 = mean(V2),
                      con3 = mean(V3),
                      con1_sd = sd(V1),
                      con2_sd = sd(V2),
                      con3_sd = sd(V3),
                      con1_lb =quantile(V1,.025),
                      con2_lb =quantile(V2,.025),
                      con3_lb =quantile(V3,.025),
                      con1_ub =quantile(V1,.975),
                      con2_ub =quantile(V2,.975),
                      con3_ub =quantile(V3,.975),
                      ratio21 = mean(ratio21),
                      ratio21_sd = sd(ratio21),
                      ratio21_lb = quantile(ratio21,.025),
                      ratio21_ub = quantile(ratio21,.975),
                      ratio31 = mean(ratio31),
                      ratio31_sd = sd(ratio31),
                      ratio31_lb = quantile(ratio31,.025),
                      ratio31_ub = quantile(ratio31,.975),
                      diff21 = mean(diff21),
                      diff21_sd = sd(diff21),
                      diff21_lb = quantile(diff21,.025),
                      diff21_ub = quantile(diff21,.975),
                      diff31 = mean(diff31),
                      diff31_sd = sd(diff31),
                      diff31_lb = quantile(diff31,.025),
                      diff31_ub = quantile(diff31,.975),
                      est0 = mean(V4),
                      est0_sd = sd(V4),
                      est0_lb = quantile(V4,.025),
                      est0_ub = quantile(V4,.975),
                      B = .N)]
  
}




###########################
###########################
###########################

prepare.reg.emp.con.table.multiple <- function(table) {
  
  table[,ratio31 := (V6 + V3)/(V6 + V1)]
  table[,ratio42 := (V6 + V4)/(V6 + V2)]
  
  table[,diff31 := ( V3 - V1)]
  table[,diff42 := ( V4 - V2)]
  
  table <- table[,.(con1 = mean(V1),
                    con2 = mean(V2),
                    con3 = mean(V3),
                    con4 = mean(V4),
                    con5 = mean(V5),
                    con1_sd = sd(V1),
                    con2_sd = sd(V2),
                    con3_sd = sd(V3),
                    con4_sd = sd(V4),
                    con5_sd = sd(V5),
                    con1_lb =quantile(V1,.025),
                    con2_lb =quantile(V2,.025),
                    con3_lb =quantile(V3,.025),
                    con4_lb =quantile(V4,.025),
                    con5_lb =quantile(V5,.025),
                    con1_ub =quantile(V1,.975),
                    con2_ub =quantile(V2,.975),
                    con3_ub =quantile(V3,.975),
                    con4_ub =quantile(V4,.975),
                    con5_ub =quantile(V5,.975),
                    ratio31 = mean(ratio31),
                    ratio31_sd = sd(ratio31),
                    ratio31_lb = quantile(ratio31,.025),
                    ratio31_ub = quantile(ratio31,.975),
                    ratio42 = mean(ratio42),
                    ratio42_sd = sd(ratio42),
                    ratio42_lb = quantile(ratio42,.025),
                    ratio42_ub = quantile(ratio42,.975),
                    diff31 = mean(diff31),
                    diff31_sd = sd(diff31),
                    diff31_lb = quantile(diff31,.025),
                    diff31_ub = quantile(diff31,.975),
                    diff42 = mean(diff42),
                    diff42_sd = sd(diff42),
                    diff42_lb = quantile(diff42,.025),
                    diff42_ub = quantile(diff42,.975),
                    est0 = mean(V6),
                    est0_sd = sd(V6),
                    est0_lb = quantile(V6,.025),
                    est0_ub = quantile(V6,.975),
                    B = .N)]
  
}



###########################
###########################
###########################

prepare.reg.emp.con.table.multiple2 <- function(table) {
  
  table[,ratio41 := (V9 + V4)/(V9 + V1)]
  table[,ratio52 := (V9 + V5)/(V9 + V2)]
  table[,ratio63 := (V9 + V6)/(V9 + V3)]
  
  table[,diff41 := ( V4 - V1)]
  table[,diff52 := ( V5 - V2)]
  table[,diff63 := ( V6 - V3)]
  
  
  
  
  table <- table[,.(con1 = mean(V1),
                    con2 = mean(V2),
                    con3 = mean(V3),
                    con4 = mean(V4),
                    con5 = mean(V5),
                    con6 = mean(V6),
                    con7 = mean(V7),
                    con8 = mean(V8),
                    con1_sd = sd(V1),
                    con2_sd = sd(V2),
                    con3_sd = sd(V3),
                    con4_sd = sd(V4),
                    con5_sd = sd(V5),
                    con6_sd = sd(V6),
                    con7_sd = sd(V7),
                    con8_sd = sd(V8),
                    con1_lb =quantile(V1,.025),
                    con2_lb =quantile(V2,.025),
                    con3_lb =quantile(V3,.025),
                    con4_lb =quantile(V4,.025),
                    con5_lb =quantile(V5,.025),
                    con6_lb =quantile(V6,.025),
                    con7_lb =quantile(V7,.025),
                    con8_lb =quantile(V8,.025),
                    con1_ub =quantile(V1,.975),
                    con2_ub =quantile(V2,.975),
                    con3_ub =quantile(V3,.975),
                    con4_ub =quantile(V4,.975),
                    con5_ub =quantile(V5,.975),
                    con6_ub =quantile(V6,.975),
                    con7_ub =quantile(V7,.975),
                    con8_ub =quantile(V8,.975),
                    ratio41 = mean(ratio41),
                    ratio41_sd = sd(ratio41),
                    ratio41_lb = quantile(ratio41,.025),
                    ratio41_ub = quantile(ratio41,.975),
                    ratio52 = mean(ratio52),
                    ratio52_sd = sd(ratio52),
                    ratio52_lb = quantile(ratio52,.025),
                    ratio52_ub = quantile(ratio52,.975),
                    ratio63 = mean(ratio63),
                    ratio63_sd = sd(ratio63),
                    ratio63_lb = quantile(ratio63,.025),
                    ratio63_ub = quantile(ratio63,.975),
                    diff41 = mean(diff41),
                    diff41_sd = sd(diff41),
                    diff41_lb = quantile(diff41,.025),
                    diff41_ub = quantile(diff41,.975),
                    diff52 = mean(diff52),
                    diff52_sd = sd(diff52),
                    diff52_lb = quantile(diff52,.025),
                    diff52_ub = quantile(diff52,.975),
                    diff63 = mean(diff63),
                    diff63_sd = sd(diff63),
                    diff63_lb = quantile(diff63,.025),
                    diff63_ub = quantile(diff63,.975),
                    est0 = mean(V9),
                    est0_sd = sd(V9),
                    est0_lb = quantile(V9,.025),
                    est0_ub = quantile(V9,.975),
                    B = .N)]
  
}



###########################
###########################
###########################

prepare.reg.emp.con.table.exit <- function(table) {
  
  table[,ratio210 := (V6 + V4)/(V6 + V2)]
  table[,ratio211 := (V6 + V5)/(V6 + V3)]
  
  table[,diff210 := ( V4 - V2)]
  table[,diff211 := ( V5 - V3)]
  
  table[(V6 + V5) <= 0 | (V6 + V3) <= 0,ratio211 := NaN]

  table <- table[,.(con3 = mean(V1),
                    con10 = mean(V2),
                    con11 = mean(V3),
                    con20 = mean(V4),
                    con21 = mean(V5),
                    con3_sd = sd(V1),
                    con10_sd = sd(V2),
                    con11_sd = sd(V3),
                    con20_sd = sd(V4),
                    con21_sd = sd(V5),
                    con3_lb =quantile(V1,.025),
                    con10_lb =quantile(V2,.025),
                    con11_lb =quantile(V3,.025),
                    con20_lb =quantile(V4,.025),
                    con21_lb =quantile(V5,.025),
                    con3_ub =quantile(V1,.975),
                    con10_ub =quantile(V2,.975),
                    con11_ub =quantile(V3,.975),
                    con20_ub =quantile(V4,.975),
                    con21_ub =quantile(V5,.975),
                    con10_lb90 =quantile(V2,.05),
                    con11_lb90 =quantile(V3,.05),
                    con20_lb90 =quantile(V4,.05),
                    con21_lb90 =quantile(V5,.05),
                    con3_ub90 =quantile(V1,.95),
                    con10_ub90 =quantile(V2,.95),
                    con11_ub90 =quantile(V3,.95),
                    con20_ub90 =quantile(V4,.95),
                    con21_ub90 =quantile(V5,.95),
                    ratio210 = mean(ratio210),
                    ratio210_sd = sd(ratio210),
                    ratio210_lb = quantile(ratio210,.025),
                    ratio210_ub = quantile(ratio210,.975),
                    ratio210_lb90 = quantile(ratio210,.05),
                    ratio210_ub90 = quantile(ratio210,.95),
                    ratio211 = mean(ratio211,na.rm = TRUE),
                    ratio211_sd = sd(ratio211,na.rm = TRUE),
                    ratio211_lb = quantile(ratio211,.025,na.rm = TRUE),
                    ratio211_ub = quantile(ratio211,.975,na.rm = TRUE),
                    ratio211_lb90 = quantile(ratio211,.05,na.rm = TRUE),
                    ratio211_ub90 = quantile(ratio211,.95,na.rm = TRUE),
                    diff210 = mean(diff210),
                    diff210_sd = sd(diff210),
                    diff210_lb = quantile(diff210,.025),
                    diff210_ub = quantile(diff210,.975),
                    diff210_lb90 = quantile(diff210,.05),
                    diff210_ub90 = quantile(diff210,.95),
                    diff211 = mean(diff211,na.rm = TRUE),
                    diff211_sd = sd(diff211,na.rm = TRUE),
                    diff211_lb = quantile(diff211,.025,na.rm = TRUE),
                    diff211_ub = quantile(diff211,.975,na.rm = TRUE),
                    diff211_lb90 = quantile(diff211,.05,na.rm = TRUE),
                    diff211_ub90 = quantile(diff211,.95,na.rm = TRUE),
                    est0 = mean(V6),
                    est0_sd = sd(V6),
                    est0_lb = quantile(V6,.025),
                    est0_ub = quantile(V6,.975),
                    est0_lb90 = quantile(V6,.05),
                    est0_ub90 = quantile(V6,.95),
                    B = .N)] 
}



###########################
###########################
###########################

prepare.reg.emp.con.event.table <- function(table) {
  
table <- table[,.(con3 = mean(V1),
                    con1m5 = mean(V2),
                    con1m4 = mean(V3),
                    con1m3 = mean(V4),
                    con1m2 = mean(V5),
                    con1m1 = mean(V6),
                    con1p1 = mean(V7),
                    con1p2 = mean(V8),
                    con1p3 = mean(V9),
                    con1p4 = mean(V10),
                    con1p5 = mean(V11),
                    con2p0 = mean(V12),
                    con2p1 = mean(V13),
                    con2p2 = mean(V14),
                    con2p3 = mean(V15),
                    con2p4 = mean(V16),
                    con2p5 = mean(V17),
                    con3_sd = sd(V1),
                    con1m5_sd = sd(V2),
                    con1m4_sd = sd(V3),
                    con1m3_sd = sd(V4),
                    con1m2_sd = sd(V5),
                    con1m1_sd = sd(V6),
                    con1p1_sd = sd(V7),
                    con1p2_sd = sd(V8),
                    con1p3_sd = sd(V9),
                    con1p4_sd = sd(V10),
                    con1p5_sd = sd(V11),
                    con2p0_sd = sd(V12),
                    con2p1_sd = sd(V13),
                    con2p2_sd = sd(V14),
                    con2p3_sd = sd(V15),
                    con2p4_sd = sd(V16),
                    con2p5_sd = sd(V17),
                    con3_lb =quantile(V1,.025),
                    con1m5_lb =quantile(V2,.025),
                    con1m4_lb =quantile(V3,.025),
                    con1m3_lb =quantile(V4,.025),
                    con1m2_lb =quantile(V5,.025),
                    con1m1_lb =quantile(V6,.025),
                    con1p1_lb =quantile(V7,.025),
                    con1p2_lb =quantile(V8,.025),
                    con1p3_lb =quantile(V9,.025),
                    con1p4_lb =quantile(V10,.025),
                    con1p5_lb =quantile(V11,.025),
                    con2p0_lb =quantile(V12,.025),
                    con2p1_lb =quantile(V13,.025),
                    con2p2_lb =quantile(V14,.025),
                    con2p3_lb =quantile(V15,.025),
                    con2p4_lb =quantile(V16,.025),
                    con2p5_lb =quantile(V17,.025),
                    con3_ub =quantile(V1,.975),
                    con1m5_ub =quantile(V2,.975),
                    con1m4_ub =quantile(V3,.975),
                    con1m3_ub =quantile(V4,.975),
                    con1m2_ub =quantile(V5,.975),
                    con1m1_ub =quantile(V6,.975),
                    con1p1_ub =quantile(V7,.975),
                    con1p2_ub =quantile(V8,.975),
                    con1p3_ub =quantile(V9,.975),
                    con1p4_ub =quantile(V10,.975),
                    con1p5_ub =quantile(V11,.975),
                    con2p0_ub =quantile(V12,.975),
                    con2p1_ub =quantile(V13,.975),
                    con2p2_ub =quantile(V14,.975),
                    con2p3_ub =quantile(V15,.975),
                    con2p4_ub =quantile(V16,.975),
                    con2p5_ub =quantile(V17,.975),
                    est0 = mean(V18),
                    est0_sd = sd(V18),
                    est0_lb = quantile(V18,.025),
                    est0_ub = quantile(V18,.975),
                    B = .N)] 

}


###########################
###########################
###########################

prepare.reg.emp.con.rob1.table <- function(table) {
  
  table[,ratio21 := (V5 + V2)/(V5 + V1)]
  table[,ratio31 := (V5 + V3)/(V5 + V1)]
  table[,ratio41 := (V5 + V4)/(V5 + V1)]
  
  table[,diff21 := (V2 - V1)]
  table[,diff31 := (V3- V1)]
  table[,diff41 := (V4 - V1)]
  
  table <- table[,.(con1 = mean(V1),
                    con2 = mean(V2),
                    con3 = mean(V3),
                    con4 = mean(V4),
                    con1_sd = sd(V1),
                    con2_sd = sd(V2),
                    con3_sd = sd(V3),
                    con4_sd = sd(V4),
                    con1_lb =quantile(V1,.025),
                    con2_lb =quantile(V2,.025),
                    con3_lb =quantile(V3,.025),
                    con4_lb =quantile(V4,.025),
                    con1_ub =quantile(V1,.975),
                    con2_ub =quantile(V2,.975),
                    con3_ub =quantile(V3,.975),
                    con4_ub =quantile(V4,.975),
                    ratio21 = mean(ratio21),
                    ratio21_sd = sd(ratio21),
                    ratio21_lb = quantile(ratio21,.025),
                    ratio21_ub = quantile(ratio21,.975),
                    ratio31 = mean(ratio31),
                    ratio31_sd = sd(ratio31),
                    ratio31_lb = quantile(ratio31,.025),
                    ratio31_ub = quantile(ratio31,.975),
                    ratio41 = mean(ratio41),
                    ratio41_sd = sd(ratio41),
                    ratio41_lb = quantile(ratio41,.025),
                    ratio41_ub = quantile(ratio41,.975),
                    diff21 = mean(diff21),
                    diff21_sd = sd(diff21),
                    diff21_lb = quantile(diff21,.025),
                    diff21_ub = quantile(diff21,.975),
                    diff31 = mean(diff31),
                    diff31_sd = sd(diff31),
                    diff31_lb = quantile(diff31,.025),
                    diff31_ub = quantile(diff31,.975),
                    diff41 = mean(diff41),
                    diff41_sd = sd(diff41),
                    diff41_lb = quantile(diff41,.025),
                    diff41_ub = quantile(diff41,.975),
                    est0 = mean(V5),
                    est0_sd = sd(V5),
                    est0_lb = quantile(V5,.025),
                    est0_ub = quantile(V5,.975),
                    B = .N)]
  
}

