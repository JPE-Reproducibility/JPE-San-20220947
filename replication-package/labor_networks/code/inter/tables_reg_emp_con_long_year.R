# open log file
today <- today()
filename <- paste0(log, "reg_emp_con_long_figure_year_",today,".txt")
sink(file = filename,split = TRUE)
source(paste0(process, "functions_reg_emp_con_long.R"))
set.seed(12345)

bin_vars = c("year")
table = vector(mode = "list", length = length(bin_vars))
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
  
  list1 <- get.reg.emp.con.data.long.figure(df_children)
  
  # bring the child's year into the long-connections table (no get.firm.vars needed for year)
  df_connections_long_firm <- merge(list1[[2]], df_children[,.(id,year)], by = "id")
  rm(df_children)
  
  for (k in 1:length(bin_vars)){
    bin_var = bin_vars[k]
    print(bin_var)
    table_temp <- run.reg.emp.con.long.figure(df_reg = list1[[1]] ,df_connections_long = df_connections_long_firm,bin_var = bin_var,bins = NULL)
    df_connections_long_firm[,bin_var := NULL]
    df_connections_long_firm[,bin := NULL]
    if (b == 1){
      table[[k]] <- table_temp
    }
    if (b > 1) {
      table[[k]] <- rbind(table[[k]],table_temp)
    }
    rm(table_temp)
  }
  
  filename <- paste0(data, "reg_emp_con_long_year.Rdata")
  save(table,file = filename)
}

# ---- reshape to the tidy format: type, bin_var, bin, beta, sd, lb, ub, bin_lable ----
filename <- paste0(data, "reg_emp_con_long_year.Rdata")
load(filename)

melt.long.figure <- function(tab, bv) {
  tab  <- data.table(tab)
  bins <- (ncol(tab) - 3) / 3          # e.g. year -> 10
  out  <- list()
  for (bin in 1:bins) {
    v1 <- paste0("V", bins + 2*bin)     # bin_1_l (con_type==1)
    v2 <- paste0("V", bins + 2*bin + 1) # bin_2_l (con_type==2)
    d  <- tab[[v2]] - tab[[v1]]         # diff = con_type2 - con_type1
    av <- tab[[paste0("V", bin)]]       # bin average value
    out[[length(out)+1]] <- data.table(
      type = "diff", bin_var = bv, bin = bin,
      beta = mean(d, na.rm = TRUE), sd = sd(d, na.rm = TRUE),
      lb = quantile(d, .025, na.rm = TRUE), ub = quantile(d, .975, na.rm = TRUE),
      bin_lable = round(mean(av, na.rm = TRUE)))
  }
  c3 <- tab[[paste0("V", bins + 1)]]                 # con3
  e0 <- tab[[paste0("V", 3*bins + 2)]]               # est0
  ob <- tab[[paste0("V", 3*bins + 3)]]               # obs
  out[[length(out)+1]] <- data.table(type="con3", bin_var=bv, bin=NA,
                                     beta=mean(c3), sd=sd(c3), lb=quantile(c3,.025), ub=quantile(c3,.975), bin_lable=NA)
  out[[length(out)+1]] <- data.table(type="est0", bin_var=bv, bin=NA,
                                     beta=mean(e0), sd=sd(e0), lb=quantile(e0,.025), ub=quantile(e0,.975), bin_lable=NA)
  out[[length(out)+1]] <- data.table(type="obs", bin_var=bv, bin=NA,
                                     beta=round(mean(ob)), sd=NA_real_, lb=NA_real_, ub=NA_real_, bin_lable=NA)
  out[[length(out)+1]] <- data.table(type="B", bin_var=bv, bin=NA,
                                     beta=nrow(tab), sd=NA_real_, lb=NA_real_, ub=NA_real_, bin_lable=NA)
  rbindlist(out)
}

for (l in 1:length(table)) {
  table_l <- melt.long.figure(table[[l]], bin_vars[[l]])
  if (l == 1) {
    table_out <- table_l
  } else {
    table_out <- rbind(table_out, table_l)
  }
}

# export the table
filename <- paste0(output, "figure_reg_emp_con_long_year.csv")
fwrite(table_out, filename)