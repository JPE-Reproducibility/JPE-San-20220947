###########################
###########################
###########################

get.reg.emp.con.data <- function(df_children) {
  
# load connections by firm 
filename <- paste0(data, "connections_type_25.Rdata")
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


run.reg.emp.con.event <- function(df_reg,name_dep_var = 'employment') {
  
  df_reg[,dep_var := get(name_dep_var)]
  
  
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

get.statistics <- function(df_children) {
  
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
  filename <- paste0(data, "connections_type_25.Rdata")
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
