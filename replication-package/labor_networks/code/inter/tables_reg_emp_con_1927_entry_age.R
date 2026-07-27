# open log file
today <- today()
filename <- paste0(log, "reg_emp_con_1927_entry_age_",today,".txt")
sink(file = filename,split = TRUE)

source(paste0(process, "functions_reg_emp_con.R"))

set.seed(12345)

min_age = 19
max_age = 27
for (a in min_age:max_age) {
  
  print('a = ')
  print(a)
  
  B = 100
  for (b in 1:B) {

    print('b = ')
    print(b)
    
    # load the children sample
    filename <- paste0(data, "children_sample_1927.Rdata")
    load(filename)
    df_children <- df[year - birth_year == a]
    rm(df)
    
    #take 20% of children
    df_children = cbind(df_children,data.table(runif(dim(df_children)[1])))
    df_children <- df_children[V1 < 0.2 ]
    df_children[,V1 := NULL]

    df_reg <- get.reg.emp.con.data(df_children,"connections_type_1927.Rdata")
    rm(df_children)
    
    ## table xx
    
    # all
    
    table_temp <- run.reg.emp.con(df_reg)
    
    if (b == 1){table1 <- table_temp}
    if (b > 1) {table1 <- rbind(table1,table_temp)}
    
    # Jews
    table_temp <- run.reg.emp.con(df_reg[ethnicity == 0])
    
    if (b == 1){table2 <- table_temp}
    if (b > 1) {table2 <- rbind(table2,table_temp)}
    
    
    # Arabs
    table_temp <- run.reg.emp.con(df_reg[ethnicity == 1])
    
    if (b == 1){table3 <- table_temp}
    if (b > 1) {table3 <- rbind(table3,table_temp)}
    
    # Males
    table_temp <- run.reg.emp.con(df_reg[sex == 0])
    
    if (b == 1){ table6 <- table_temp}
    if (b > 1) {table6 <- rbind(table6,table_temp)}
    
    
    # Females
    table_temp <- run.reg.emp.con(df_reg[sex == 1])
    
    if (b == 1){ table7 <- table_temp}
    if (b > 1) {table7 <- rbind(table7,table_temp)}
    
    ## Event study- all
    table_temp <- run.reg.emp.con.event(df_reg)
    
    if (b == 1){table8 <- table_temp}
    if (b > 1) {table8 <- rbind(table8,table_temp)}
    
    ## Event study- Jews
    table_temp <- run.reg.emp.con.event(df_reg[ethnicity == 0])
    
    if (b == 1){table9 <- table_temp}
    if (b > 1) {table9 <- rbind(table9,table_temp)}
    
    ## Event study- Arabs
    table_temp <- run.reg.emp.con.event(df_reg[ethnicity == 1])
    
    if (b == 1){table10 <- table_temp}
    if (b > 1) {table10 <- rbind(table10,table_temp)}
  
    
    ## Event study- Males
    table_temp <- run.reg.emp.con.event(df_reg[sex == 0])
    
    if (b == 1){table13 <- table_temp}
    if (b > 1) {table13 <- rbind(table13,table_temp)}
    
    ## Event study- Females
    table_temp <- run.reg.emp.con.event(df_reg[sex == 1])
    
    if (b == 1){table14 <- table_temp}
    if (b > 1) {table14 <- rbind(table14,table_temp)}
    
    
    
    # remove the reg data
    rm(df_reg)
    
    # save the tables
    filename <- paste0(data, "reg_emp_con_1927_entry_age_",a,".Rdata")
    save(table1,table2,table3,table6,table7,
         table8,table9,table10,table13,table14,
         file = filename)
  }
}

count = 0
for (a in min_age:max_age) {
  
  # load the tables
  
  filename <- paste0(data, "reg_emp_con_1927_entry_age_",a,".Rdata")
  load(filename)
  
  ## get statistics
  filename <- paste0(data, "children_sample_1927.Rdata")
  load(filename)
  df_children <- df[year - birth_year == a]
  rm(df)
  
  stat1 <- get.statistics(df_children,"connections_type_1927.Rdata")
  stat2 <- get.statistics(df_children[ethnicity == 0],"connections_type_1927.Rdata")
  stat3 <- get.statistics(df_children[ethnicity == 1],"connections_type_1927.Rdata")
  stat6 <- get.statistics(df_children[ sex == 0],"connections_type_1927.Rdata")
  stat7 <- get.statistics(df_children[ sex == 1],"connections_type_1927.Rdata")
  
  
  ## prepare the regression tables
  
  table1 <- prepare.reg.emp.con.table(table1)
  table2 <- prepare.reg.emp.con.table(table2)
  table3 <- prepare.reg.emp.con.table(table3)
  table6 <- prepare.reg.emp.con.table(table6)
  table7 <- prepare.reg.emp.con.table(table7)
  
  table1 <- cbind(a,table1,stat1)
  table2 <- cbind(a,table2,stat2)
  table3 <- cbind(a,table3,stat3)
  table6 <- cbind(a,table6,stat6)
  table7 <- cbind(a,table7,stat7)
  
  
  table_static_0 = rbind(table1,table2,table3,table6,table7)
  if (count == 0){table_static = table_static_0}
  if (count > 0) {  table_static = rbind(table_static,table_static_0)}

  
  ## prepare the event study tables
  
  table8 <- prepare.reg.emp.con.event.table(table8)
  table9 <- prepare.reg.emp.con.event.table(table9)
  table10 <- prepare.reg.emp.con.event.table(table10)
  table13 <- prepare.reg.emp.con.event.table(table13)
  table14 <- prepare.reg.emp.con.event.table(table14)
  
  table8 <- cbind(a,table8,stat1)
  table9 <- cbind(a,table9,stat2)
  table10 <- cbind(a,table10,stat3)
  table13 <- cbind(a,table13,stat6)
  table14 <- cbind(a,table14,stat7)
  
  table_event_0 <- rbind(table8,table9,table10,table13,table14)
  if (count == 0){table_event = table_event_0}
  if (count > 0) {  table_event = rbind(table_event,table_event_0)}

  count = count + 1
  
}

# export the table
filename <- paste0(output, "table_reg_emp_con_1927_entry_age.csv")
write.csv(table_static,filename)

# export the table
#filename <- paste0(output, "figure_reg_emp_con_event_1927_entry_age.csv")
#write.csv(table_event,filename)
