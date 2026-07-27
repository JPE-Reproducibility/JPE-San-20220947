###########################
###########################
###########################

get.reg.emp.con.data.long <- function(df_children) {
  
# load the long-connections file
filename <- paste0(data, "connections_long.Rdata")
load(filename)
df_connections_long <- df
rm(df)
df_connections_long <- merge(df_connections_long,df_children[,.(id)], by = "id")

# load connections by firm 
filename <- paste0(data, "connections_type.Rdata")
load(filename)
df_connections <- df
rm(df)
df_connections <- merge(df_connections,df_children[,.(id,year)], by = "id")

# keep only con_type == 2 in the long file
df_connections_long <- merge(df_connections_long,df_connections[con_type == 2,.(id,id_firm)], by = c("id","id_firm"))

# gen groups of children
df_children[,education := 1* (education > 0)]
df_groups <- df_children[,.(n = .N), by = c("year","birth_year","ethnicity","sex","education","district")]
df_groups <- df_groups[n>1]
df_groups[,group := 1:.N]
df_children = merge(df_children,df_groups, by = c("year","birth_year","ethnicity","sex","education","district"))


# get the group of each child in the connections datasets
df_connections <- merge(df_children[,.(id,group)], df_connections, by = "id")
df_connections_long <- merge(df_children[,.(id,group)], df_connections_long, by = "id")

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
df_employment_group <- df_employment_group[,.(group,id_firm,n_0,n,
                                              employment_1 = employment_1/n_1 ,
                                              employment_0 = employment_0/n_0) ]

# get the difference between them and multiply by 100
df_employment_group[,employment_1 := employment_1 * 100]
df_employment_group [,employment_0 := employment_0 * 100]

df_employment_group[,employment := employment_1 - employment_0]
df_employment_group[,employment_1 := NULL]

rm(df_children,df_employment,df_groups)


# get the average of connections measure by group-firm
df_connections_groups_long <- df_connections_long[,
                                              .(duration_past = mean(duration_past ),
                                                lag_past = mean(lag_past ),
                                                log_firm_size_past = mean(log_firm_size_past ),
                                                rank_total_parent = mean(rank_total_parent ),
                                                rank_firm_parent = mean(rank_firm_parent ),
                                                rank_total_pco_past = mean(rank_total_pco_past ),
                                                rank_firm_pco_past = mean(rank_firm_pco_past ),
                                                log_firm_size_current = mean(log_firm_size_current ),
                                                sex_child = mean(sex_child ),
                                                sex_parent = mean(sex_parent ),
                                                sex_pco = mean(sex_pco ),
                                                ethnicity_child = mean(ethnicity_child ),
                                                ethnicity_pco = mean(ethnicity_pco ),
                                                education_child = mean(education_child ),
                                                same_sex_child_parent = mean(same_sex_child_parent ),
                                                same_sex_child_pco = mean(same_sex_child_pco ),
                                                same_ethnicity_child_pco = mean(same_ethnicity_child_pco ),
                                                rank_firm_diff_parent_pco = mean(rank_firm_diff_parent_pco )
                                              ),
                                              by = .(id_firm,group)]
rm(df_connections_long)



# get the average of connections measure by group-firm
df_connections_groups <- df_connections[,
                                        .(con1 = mean(1 * (con_type == 1)),
                                          con2 = mean(1 * (con_type == 2)),
                                          con3 = mean(1 * (con_type == 3))),
                                        by = .(group,id_firm)]

rm(df_connections)

# merge df_connections_groups and df_connections_groups_long
df_connections1 <- merge(df_connections_groups,df_connections_groups_long, by = c("group", "id_firm"), all.x = TRUE)


df_connections1[is.na(duration_past ), duration_past := 0]
df_connections1[is.na(lag_past ), lag_past := 0]
df_connections1[is.na(log_firm_size_past ), log_firm_size_past := 0]
df_connections1[is.na(rank_total_parent ), rank_total_parent := 0]
df_connections1[is.na(rank_firm_parent ), rank_firm_parent := 0]
df_connections1[is.na(rank_total_pco_past ), rank_total_pco_past := 0]
df_connections1[is.na(rank_firm_pco_past ), rank_firm_pco_past := 0]
df_connections1[is.na(log_firm_size_current ), log_firm_size_current := 0]
df_connections1[is.na(sex_child ), sex_child := 0]
df_connections1[is.na(sex_parent ), sex_parent := 0]
df_connections1[is.na(sex_pco ), sex_pco := 0]
df_connections1[is.na(ethnicity_child ), ethnicity_child := 0]
df_connections1[is.na(ethnicity_pco ), ethnicity_pco := 0]
df_connections1[is.na(education_child ), education_child := 0]
df_connections1[is.na(same_sex_child_parent ), same_sex_child_parent := 0]
df_connections1[is.na(same_sex_child_pco ), same_sex_child_pco := 0]
df_connections1[is.na(same_ethnicity_child_pco ), same_ethnicity_child_pco := 0]
df_connections1[is.na(rank_firm_diff_parent_pco ), rank_firm_diff_parent_pco := 0]

# merge with df_employment_group
df_reg <- merge(df_connections1,df_employment_group, by = c("group", "id_firm"))

return(df_reg)
}


###########################
###########################
###########################

get.reg.emp.con.data.long.figure <- function(df_children) {
  
  first_year <- df_children[,min(year)]
  last_year <- df_children[,max(year)]
  
  # load the long-connections file
  
  for (t in first_year:last_year){
    filename <- paste0(data, "connections_long_",t,".Rdata")
    load(filename)
    df_connections_long <- df
    rm(df)
    df_connections_long <- merge(df_connections_long,df_children[,.(id)], by = "id")
  
    
    if (t == first_year) {
      df_connections_long1 <- df_connections_long
    } else {
      df_connections_long1 <- rbind(df_connections_long1,df_connections_long)
    }
  }
  df_connections_long <- df_connections_long1
  rm(df_connections_long1)
  
  # load connections by firm 
  filename <- paste0(data, "connections_type.Rdata")
  load(filename)
  df_connections <- df
  rm(df)
  df_connections <- merge(df_connections,df_children[,.(id,year)], by = "id")
  
  # keep only con_type == 1 | 2 in the long file
  df_connections_long <- merge(df_connections_long,df_connections[con_type == 1 |con_type == 2,.(id,id_firm,con_type)], by = c("id","id_firm"))
  
  # gen groups of children
  df_children[,education := 1* (education > 0)]
  df_groups <- df_children[,.(n = .N), by = c("year","birth_year","ethnicity","sex","education","district")]
  df_groups <- df_groups[n>1]
  df_groups[,group := 1:.N]
  df_children = merge(df_children,df_groups, by = c("year","birth_year","ethnicity","sex","education","district"))
  
  
  # get the group of each child in the connections datasets
  df_connections <- merge(df_children[,.(id,group)], df_connections, by = "id")
  df_connections_long <- merge(df_children[,.(id,group)], df_connections_long, by = "id")
  
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
  df_employment_group <- df_employment_group[,.(group,id_firm,n_0,n,
                                                employment_1 = employment_1/n_1 ,
                                                employment_0 = employment_0/n_0) ]
  
  # get the difference between them and multiply by 100
  df_employment_group[,employment_1 := employment_1 * 100]
  df_employment_group [,employment_0 := employment_0 * 100]
  
  df_employment_group[,employment := employment_1 - employment_0]
  df_employment_group[,employment_1 := NULL]
  
  rm(df_children,df_employment,df_groups)
  
  # get the average of connections measure by group-firm
  df_connections_groups <- df_connections[,
                                          .(con1 = mean(1 * (con_type == 1)),
                                            con2 = mean(1 * (con_type == 2)),
                                            con3 = mean(1 * (con_type == 3))),
                                          by = .(group,id_firm)]
  
  rm(df_connections)
  
  # merge with df_employment_group
  df_reg <- merge(df_connections_groups,df_employment_group, by = c("group", "id_firm"))
  rm(df_connections_groups,df_employment_group)
  list1 <- list(df_reg,df_connections_long)
  return(list1)
}



###########################
###########################
###########################


get.reg.emp.con.data.firm <- function(df_children) {
 
  # load the firm bins vars
  
  filename <- paste0(data, "firms_duration_bins.Rdata")
  load(filename)
  df_connections_long = df
  rm(df)
  
  filename <- paste0(data, "firms_akm_res_bins.Rdata")
  load(filename)
  df_connections_long = merge(df_connections_long,df, by = "id_firm")
  rm(df)
  
  ## get industries and sectors
  filename <- paste0(data, "firm_industry_sector.Rdata")
  load(filename)
  df_connections_long <- merge(df_connections_long,df[,.(id_firm,main_sector)], by = c("id_firm"))
  
  # load connections by firm 
  filename <- paste0(data, "connections_type.Rdata")
  load(filename)
  df_connections <- df
  rm(df)
  df_connections <- merge(df_connections,df_children[,.(id,year)], by = "id")
  
  # keep only con_type == 1 | 2 in the long file
  df_connections_long <- merge(df_connections_long[,.(id_firm ,main_sector,
                                                      duration_mean ,duration_sd,akm_res)],
                               df_connections[con_type == 1 |con_type == 2,.(id,id_firm,con_type)],
                               by = c("id_firm"))
  
  # gen groups of children
  df_children[,education := 1* (education > 0)]
  df_groups <- df_children[,.(n = .N), by = c("year","birth_year","ethnicity","sex","education","district")]
  df_groups <- df_groups[n>1]
  df_groups[,group := 1:.N]
  df_children = merge(df_children,df_groups, by = c("year","birth_year","ethnicity","sex","education","district"))
  
  
  # get the group of each child in the connections datasets
  df_connections <- merge(df_children[,.(id,group)], df_connections, by = "id")
  df_connections_long <- merge(df_children[,.(id,group)], df_connections_long, by = "id")
  
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
  df_employment_group <- df_employment_group[,.(group,id_firm,n_0,n,
                                                employment_1 = employment_1/n_1 ,
                                                employment_0 = employment_0/n_0) ]
  
  # get the difference between them and multiply by 100
  df_employment_group[,employment_1 := employment_1 * 100]
  df_employment_group [,employment_0 := employment_0 * 100]
  
  df_employment_group[,employment := employment_1 - employment_0]
  df_employment_group[,employment_1 := NULL]
  
  rm(df_children,df_employment,df_groups)
  
  # get the average of connections measure by group-firm
  df_connections_groups <- df_connections[,
                                          .(con1 = mean(1 * (con_type == 1)),
                                            con2 = mean(1 * (con_type == 2)),
                                            con3 = mean(1 * (con_type == 3))),
                                          by = .(group,id_firm)]
  
  rm(df_connections)
  
  # merge with df_employment_group
  df_reg <- merge(df_connections_groups,df_employment_group, by = c("group", "id_firm"))
  rm(df_connections_groups,df_employment_group)
  list1 <- list(df_reg,df_connections_long)
  return(list1)
}


###########################
###########################
###########################


get.reg.emp.con.data.int <- function(df_children,children_vars,firm_vars) {
  
  # load connections by firm 
  filename <- paste0(data, "connections_type.Rdata")
  load(filename)
  df_connections <- df
  rm(df)
  df_connections <- merge(df_connections,df_children[,.(id,year)], by = "id")
  
  # load akm data (the person effects from the akm estimated with children and the firms from the akm without to minimize LMB)
  filename <- paste0(data, "akm_person_children_only.Rdata")
  load(filename)
  df_akm_person <- df[,.(id,year,person_rank )]
  rm(df)
  df_akm_person <- merge(df_akm_person,df_children[,.(id,year)], by = c("id","year"))
  
  filename <- paste0(data, "akm_firm.Rdata")
  load(filename)
  df_akm_firm <- df[,.(id_firm,year,firm_rank )]
  rm(df)
  

  # keep only con_type == 1 | 2 in the long file
  df_connections_long <- merge(df_akm_firm,
                               df_connections[con_type == 1 |con_type == 2,.(id,year,id_firm,con_type)],
                               by = c("id_firm","year"))
  rm(df_akm_firm)
  
  df_connections_long = merge(df_connections_long,df_akm_person,
                                    by = c("id","year"))
  df_connections_long[,gap:=firm_rank - person_rank]
  df_connections_long[,firm_rank:=NULL]
  df_connections_long[,person_rank:=NULL]
  
  rm(df_akm_person)
  # gen groups of children
  df_children[,education := 1* (education > 0)]
  df_groups <- df_children[,.(n = .N), by = c("year","birth_year","ethnicity","sex","education","district")]
  df_groups <- df_groups[n>1]
  df_groups[,group := 1:.N]
  df_children = merge(df_children,df_groups, by = c("year","birth_year","ethnicity","sex","education","district"))
  
  
  # get the group of each child in the connections datasets
  df_connections <- merge(df_children[,.(id,group)], df_connections, by = "id")
  df_connections_long <- merge(df_children[,.(id,group)], df_connections_long, by = "id")
  
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
  df_employment_group <- df_employment_group[,.(group,id_firm,n_0,n,
                                                employment_1 = employment_1/n_1 ,
                                                employment_0 = employment_0/n_0) ]
  
  # get the difference between them and multiply by 100
  df_employment_group[,employment_1 := employment_1 * 100]
  df_employment_group [,employment_0 := employment_0 * 100]
  
  df_employment_group[,employment := employment_1 - employment_0]
  df_employment_group[,employment_1 := NULL]
  
  rm(df_children,df_employment,df_groups)
  
  # get the average of connections measure by group-firm
  df_connections_groups <- df_connections[,
                                          .(con1 = mean(1 * (con_type == 1)),
                                            con2 = mean(1 * (con_type == 2)),
                                            con3 = mean(1 * (con_type == 3))),
                                          by = .(group,id_firm)]
  
  rm(df_connections)
  
  # merge with df_employment_group
  df_reg <- merge(df_connections_groups,df_employment_group, by = c("group", "id_firm"))
  rm(df_connections_groups,df_employment_group)
  list1 <- list(df_reg,df_connections_long)
  return(list1)
}


###########################
###########################
###########################

run.reg.emp.con.long <- function(df_reg) {
  est1 <- felm(employment  ~ -1 + con1 +con2 + con3 + 
                 duration_past + 
                 lag_past + 
                 log_firm_size_past +
                 rank_total_parent + 
                 rank_firm_parent + 
                 rank_total_pco_past+
                 rank_firm_pco_past   +
                 log_firm_size_current + 
                 sex_child + 
                 sex_parent  + 
                 sex_pco + 
                 ethnicity_child +
                 ethnicity_pco +
                 education_child +
                 same_sex_child_parent + 
                 same_sex_child_pco+
                 same_ethnicity_child_pco +
                 rank_firm_diff_parent_pco ,
               df_reg)
  
  est0 <- df_reg[,sum(employment_0 * n_0)/sum(n_0)]
  
  table_temp <- data.table(c(est1[["beta"]],est0))
  table_temp <- transpose(table_temp)  
  
  return(table_temp)
  
}


###########################
###########################
###########################

prepare.reg.emp.con.table.long <- function(table) {
  
  table <- table[,.( con1 = mean( V1 ) ,
                     con2 = mean( V2 ) ,
                     con3 = mean( V3 ) ,
                     duration_past = mean( V4 ) ,
                     lag_past = mean( V5 ) ,
                     log_firm_size_past = mean( V6 ) ,
                     rank_total_parent = mean( V7 ) ,
                     rank_firm_parent = mean( V8 ) ,
                     rank_total_pco_past = mean( V9 ) ,
                     rank_firm_pco_past = mean( V10 ) ,
                     log_firm_size_current = mean( V11 ) ,
                     sex_child = mean( V12 ) ,
                     sex_parent = mean( V13 ) ,
                     sex_pco = mean( V14 ) ,
                     ethnicity_child = mean( V15 ) ,
                     ethnicity_pco = mean( V16 ) ,
                     education_child = mean( V17 ) ,
                     same_sex_child_parent = mean( V18 ) ,
                     same_sex_child_pco = mean( V19 ) ,
                     same_ethnicity_child_pco = mean( V20 ) ,
                     rank_firm_diff_parent_pco = mean( V21 ) ,
                     con1_sd = sd( V1 ) ,
                     con2_sd = sd( V2 ) ,
                     con3_sd = sd( V3 ) ,
                     duration_past_sd = sd( V4 ) ,
                     lag_past_sd = sd( V5 ) ,
                     log_firm_size_past_sd = sd( V6 ) ,
                     rank_total_parent_sd = sd( V7 ) ,
                     rank_firm_parent_sd = sd( V8 ) ,
                     rank_total_pco_past_sd = sd( V9 ) ,
                     rank_firm_pco_past_sd = sd( V10 ) ,
                     log_firm_size_current_sd = sd( V11 ) ,
                     sex_child_sd = sd( V12 ) ,
                     sex_parent_sd = sd( V13 ) ,
                     sex_pco_sd = sd( V14 ) ,
                     ethnicity_child_sd = sd( V15 ) ,
                     ethnicity_pco_sd = sd( V16 ) ,
                     education_child_sd = sd( V17 ) ,
                     same_sex_child_parent_sd = sd( V18 ) ,
                     same_sex_child_pco_sd = sd( V19 ) ,
                     same_ethnicity_child_pco_sd = sd( V20) ,
                     rank_firm_diff_parent_pco_sd = sd( V21 ) ,
                     con1_lb = quantile(V1,.025),
                     con2_lb = quantile(V2,.025),
                     con3_lb = quantile(V3,.025),
                     duration_past_lb = quantile(V4,.025),
                     lag_past_lb = quantile(V5,.025),
                     log_firm_size_past_lb = quantile(V6,.025),
                     rank_total_parent_lb = quantile(V7,.025),
                     rank_firm_parent_lb = quantile(V8,.025),
                     rank_total_pco_past_lb = quantile(V9,.025),
                     rank_firm_pco_past_lb = quantile(V10,.025),
                     log_firm_size_current_lb = quantile(V11,.025),
                     sex_child_lb = quantile(V12,.025),
                     sex_parent_lb = quantile(V13,.025),
                     sex_pco_lb = quantile(V14,.025),
                     ethnicity_child_lb = quantile(V15,.025),
                     ethnicity_pco_lb = quantile(V16,.025),
                     education_child_lb = quantile(V17,.025),
                     same_sex_child_parent_lb = quantile(V18,.025),
                     same_sex_child_pco_lb = quantile(V19,.025),
                     same_ethnicity_child_pco_lb = quantile(V20,.025),
                     rank_firm_diff_parent_pco_lb = quantile(V21,.025),
                     con1_ub = quantile(V1,.975),
                     con2_ub = quantile(V2,.975),
                     con3_ub = quantile(V3,.975),
                     duration_past_ub = quantile(V4,.975),
                     lag_past_ub = quantile(V5,.975),
                     log_firm_size_past_ub = quantile(V6,.975),
                     rank_total_parent_ub = quantile(V7,.975),
                     rank_firm_parent_ub = quantile(V8,.975),
                     rank_total_pco_past_ub = quantile(V9,.975),
                     rank_firm_pco_past_ub = quantile(V10,.975),
                     log_firm_size_current_ub = quantile(V11,.975),
                     sex_child_ub = quantile(V12,.975),
                     sex_parent_ub = quantile(V13,.975),
                     sex_pco_ub = quantile(V14,.975),
                     ethnicity_child_ub = quantile(V15,.975),
                     ethnicity_pco_ub = quantile(V16,.975),
                     education_child_ub = quantile(V17,.975),
                     same_sex_child_parent_ub = quantile(V18,.975),
                     same_sex_child_pco_ub = quantile(V19,.975),
                     same_ethnicity_child_pco_ub = quantile(V20,.975),
                     rank_firm_diff_parent_pco_ub = quantile(V21,.975),
                     est0 = mean(V22),
                     est0_sd = sd(V22),
                     est0_lb = quantile(V22,.025),
                     est0_ub = quantile(V22,.975),
                     B = .N)]

}


###########################
###########################
###########################

run.reg.emp.con.long.figure <- function(df_reg,df_connections_long,bin_var,bins = NULL) {
  # make bins of bin_var
  df_connections_long[,bin_var := get(bin_var)]
  
  if (!is.null(bins)){
    df_connections_long <- df_connections_long[,bin := ceiling( bins *
                                                                  rank(bin_var)/.N)]
  } else {
    
    df_connections_long[,bin := ceiling(bin_var)]
  }
  
  # get the mean of the bin_var in each bin
  bins1 <- df_connections_long[,.(mean(bin_var)), by =  "bin"]
  setorder(bins1,V1)
  bins_list <- as.list(t(bins1[,1]))
  bins_av <- as.vector(t(bins1[,2]))
  rm(bins1)
  # get the average of connections measure by group-firm
  
  df_connections_groups_long <- df_connections_long[,.(id_firm,group,bin,con_type)]
  
  for (l in bins_list){
    df_connections_groups_long[,paste0("bin_1_",l) := (1 * (bin == l & con_type ==1))]
    df_connections_groups_long[,paste0("bin_2_",l) := (1 * (bin == l & con_type ==2))]
  }
  df_connections_groups_long[,bin := NULL]
  
  df_connections_groups_long <- df_connections_groups_long[,lapply(.SD,mean), by = .(id_firm,group)]
  
  rm(df_connections_long)
  
  
  
  # merge df_connections_groups and df_connections_groups_long
  df_reg <- merge(df_reg,df_connections_groups_long, by = c("group", "id_firm"), all.x = TRUE)
  rm(df_connections_groups_long)
  
  df_reg[is.na(df_reg)] <- 0
  
  ## run the regressions
  
  vars_str = ""
  for (l in bins_list){
    vars_str <- paste0(vars_str,"+ bin_1_",l,"+ bin_2_",l)
  }
  
  
  form = as.formula(paste0("employment  ~ -1  + con3",vars_str))
  
  est1 <- felm(form,df_reg)
  
  est0 <- df_reg[,sum(employment_0 * n_0)/sum(n_0)]
  
  obs <- df_reg[,.N]
  
  # keep the relevant information
  table_temp <- data.table(c(bins_av,est1[["beta"]],est0,obs))
  table_temp <- transpose(table_temp)
  
  return(table_temp)
}


###########################
###########################
###########################

prepare.reg.emp.con.table.long.figure <- function(table,bin_var) {
  
  
  bins = (length(table) - 3) / 3
  
  list_l_names <- list()
  list_l <- list()
  
  list_l_names = append(list_l_names , "bin_var")
  list_l = append(list_l , bin_var)
  
  for (bin in 1:bins) {	
    
    var1 = paste0("V",bins + 2 * bin )
    var2 = paste0("V",bins + 2 * bin  +1 )
    diff = as.character(paste0("diff",bin))
    
    table[,eval(diff) := (get(var2) - get(var1))]
    
    
    list_l_names = append(list_l_names , diff)
    list_l = append(list_l , table[,mean(get(diff),na.rm = TRUE)])
    
    list_l_names = append(list_l_names , paste0(diff,"_sd"))
    list_l = append(list_l , table[,sd(get(diff),na.rm = TRUE)])
    
    list_l_names = append(list_l_names , paste0(diff,"_lb"))
    list_l = append(list_l , table[,quantile(get(diff),.025,na.rm = TRUE)])
    
    list_l_names = append(list_l_names , paste0(diff,"_ub"))
    list_l = append(list_l , table[,quantile(get(diff),.975,na.rm = TRUE)])
    
    var_bin_av = paste0("V", bin )
    
    list_l_names = append(list_l_names , paste0("bin",bin,"_av"))
    list_l = append(list_l , table[,mean(get(var_bin_av),na.rm = TRUE)])
    
    
  }
  
  con3 = paste0("V", bins + 1 )
  est0 = paste0("V", 3 * bins + 2 )
  obs = paste0("V", 3 * bins + 3 )
  
  list_l_names = append(list_l_names , "con3")
  list_l = append(list_l , table[,mean(get(con3),na.rm = TRUE)])
  
  list_l_names = append(list_l_names , "con3_sd")
  list_l = append(list_l , table[,sd(get(con3),na.rm = TRUE)])
  
  list_l_names = append(list_l_names , "con3_lb")
  list_l = append(list_l , table[,quantile(get(con3),.025,na.rm = TRUE)])
  
  list_l_names = append(list_l_names , "con3_ub")
  list_l = append(list_l , table[,quantile(get(con3),.975,na.rm = TRUE)])
  
  list_l_names = append(list_l_names , "est0")
  list_l = append(list_l , table[,mean(get(est0),na.rm = TRUE)])
  
  list_l_names = append(list_l_names , "est0_sd")
  list_l = append(list_l , table[,sd(get(est0),na.rm = TRUE)])
  
  list_l_names = append(list_l_names , "est0_lb")
  list_l = append(list_l , table[,quantile(get(est0),.025,na.rm = TRUE)])
  
  list_l_names = append(list_l_names , "est0_ub")
  list_l = append(list_l , table[,quantile(get(est0),.975,na.rm = TRUE)])
  
  list_l_names = append(list_l_names , "obs")
  list_l = append(list_l , table[,round(mean(get(obs),na.rm = TRUE))])
  
  list_l_names = append(list_l_names , "B")
  list_l = append(list_l , table[,.N])
  
  
  table_temp = cbind(list_l_names,list_l)
  
  
  return(table_temp)
  
}


###########################
###########################
###########################

prepare.table.sex_sector <- function(table) {
  

# calculate statistics for gap by sector and overall
filename <- paste0(data, "connections_type.Rdata")
load(filename)
df_connections = df[con_type != 3,.(id,id_firm)]
rm(df)

filename <- paste0(data, "children_sample.Rdata")
load(filename)
df_children = df[,.(id,year,sex)]
rm(df)

filename <- paste0(data, "firm_industry_sector.Rdata")
load(filename)
df_sector = df
rm(df)


df_connections = merge(df_connections,df_children,by = "id", all.x = T)
df_connections = merge(df_connections,df_sector[,.(id_firm,main_sector)],by = "id_firm", all.x = T)

table_sector = df_connections[!is.na(main_sector),.(obs = .N, share_women = mean(sex)), 
                              by = .(main_sector)]

bins = 20
for (bin in 1:bins) {	
  
  var1 = paste0("V",bins + 2 * bin )
  var2 = paste0("V",bins + 2 * bin  +1 )
  diff = as.character(paste0("diff",bin))
  
  table[,eval(diff) := (get(var2) - get(var1))]
}

list_l_names <- list()
list_l <- list()

table[,obs_s := 0]
table[,did_obs_s := 0]

for (bin in 1:10) {	
  
  var1 = paste0("diff", bin )
  var2 = paste0("diff", bin  +10 )
  
  did = as.character(paste0("did",bin))
  
  table[,eval(did) := (get(var1) - get(var2))]
  
  list_l_names = append(list_l_names , did)
  list_l = append(list_l , table[,mean(get(did),na.rm = TRUE)])
  
  list_l_names = append(list_l_names , paste0(did,"_sd"))
  list_l = append(list_l , table[,sd(get(did),na.rm = TRUE)])
  
  list_l_names = append(list_l_names , paste0(did,"_lb"))
  list_l = append(list_l , table[,quantile(get(did),.025,na.rm = TRUE)])
  
  list_l_names = append(list_l_names , paste0(did,"_ub"))
  list_l = append(list_l , table[,quantile(get(did),.975,na.rm = TRUE)])
  
  # get weighted av.
  
  
  obs = as.character(paste0("obs",bin))
  
  table[,eval(obs) := table_sector[bin,obs]]
  
  did_obs = as.character(paste0("did_obs",bin))
  
  table[,eval(did_obs) := get(did) * get(obs)]
  
  table[,obs_s := obs_s +  get(obs)]
  table[,did_obs_s := did_obs_s +  get(did_obs)]
  
}

table[,did_w:= did_obs_s/obs_s]

list_l_names = append(list_l_names , "did_w")
list_l = append(list_l , table[,mean((did_w),na.rm = TRUE)])

list_l_names = append(list_l_names ,"did_w_sd")
list_l = append(list_l , table[,sd(did_w,na.rm = TRUE)])

list_l_names = append(list_l_names , "did_w_lb")
list_l = append(list_l , table[,quantile(did_w,.025,na.rm = TRUE)])

list_l_names = append(list_l_names , "did_w_ub")
list_l = append(list_l , table[,quantile(did_w,.975,na.rm = TRUE)])


table_temp = cbind(list_l_names,list_l)

return(table_temp)
}


  