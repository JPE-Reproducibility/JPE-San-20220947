  # open log file
today <- today()
filename <- paste0(log, "reg_emp_con_",today,".txt")
sink(file = filename,split = TRUE)

source(paste0(process, "functions_reg_emp_con.R"))

set.seed(12345)



B = 100
for (b in 1:B) {
#take 20% of children
  print('b = ')
  print(b)
  
  # load the children sample
  filename <- paste0(data, "children_sample.Rdata")
  load(filename)
  df_children <- df
  rm(df)
  
df_children = cbind(df_children,data.table(runif(dim(df_children)[1])))
df_children <- df_children[V1 < 0.2 ]
df_children[,V1 := NULL]

df_reg <- get.reg.emp.con.data.multiple2(df_children)
rm(df_children)

## table xx

# all

table_temp <- run.reg.emp.con.multiple2(df_reg)

if (b == 1){table1 <- table_temp}
if (b > 1) {table1 <- rbind(table1,table_temp)}


## Event study- all
table_temp <- run.reg.emp.con.event.multiple2(df_reg)

if (b == 1){table8 <- table_temp}
if (b > 1) {table8 <- rbind(table8,table_temp)}


# remove the reg data
rm(df_reg)

# save the tables
filename <- paste0(output, "reg_emp_con_event_multiple2.Rdata")
save(table1,
     table8,
     file = filename)
}

# load the tables

filename <- paste0(output, "reg_emp_con_event_multiple2.Rdata")
load(filename)

## get statistics
filename <- paste0(data, "children_sample.Rdata")
load(filename)
df_children <- df
rm(df)

stat1 <- get.statistics(df_children)



## prepare the regression tables

table1 <- prepare.reg.emp.con.table(table1)


table1 <- cbind(table1,stat1)


table <- rbind(table1)

# export the table
filename <- paste0(output, "table_reg_emp_con_multiple2.csv")
write.csv(table,filename)

## prepare the event study tables

table8 <- prepare.reg.emp.con.event.table(table8)

table8 <- cbind(table8,stat1)


table <- rbind(table8)

# export the table
filename <- paste0(output, "figure_reg_emp_con_event_multiple2.csv")
write.csv(table,filename)