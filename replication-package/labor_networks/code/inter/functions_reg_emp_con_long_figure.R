###########################################################################
## functions_reg_emp_con_long_figure.R
##
## "diff" long-figure stack that ALSO keeps the raw bin_1_l / bin_2_l coefficient
## columns (with sd/lb/ub), matching the figure CSV layout:
##   bin_var,
##   diff{i}, diff{i}_sd, diff{i}_lb, diff{i}_ub           (weak - phantom per bin)
##   bin{i}_av                                             (x-axis average per bin)
##   con3, bin1_{l}, bin2_{l}          (raw coefficient MEANS)
##   con3_sd, bin1_{l}_sd, bin2_{l}_sd (SD block)
##   con3_lb, bin1_{l}_lb, bin2_{l}_lb (LB block)
##   con3_ub, bin1_{l}_ub, bin2_{l}_ub (UB block)
##   est0, est0_sd, est0_lb, est0_ub, B
##
## Bin labels come from the bootstrap: 10-bin vars label 1..10; integer-binned
## vars (bins=NULL) label by their ceiling value; binary vars label 0,1.
###########################################################################

###########################################################################
## get.reg.emp.con.data.long.figure(df_children) -> list(df_reg, df_connections_long)
###########################################################################
get.reg.emp.con.data.long.figure <- function(df_children) {

  first_year <- df_children[, min(year)]
  last_year  <- df_children[, max(year)]

  for (t in first_year:last_year) {
    filename <- paste0(data, "connections_long_", t, ".Rdata")
    load(filename)
    df_connections_long <- df
    rm(df)
    df_connections_long <- merge(df_connections_long, df_children[, .(id)], by = "id")
    if (t == first_year) df_connections_long1 <- df_connections_long
    else                 df_connections_long1 <- rbind(df_connections_long1, df_connections_long)
  }
  df_connections_long <- df_connections_long1
  rm(df_connections_long1)

  filename <- paste0(data, "connections_type.Rdata")
  load(filename)
  df_connections <- df
  rm(df)
  df_connections <- merge(df_connections, df_children[, .(id, year)], by = "id")

  df_connections_long <- merge(df_connections_long,
                               df_connections[con_type == 1 | con_type == 2, .(id, id_firm, con_type)],
                               by = c("id", "id_firm"))

  df_children[, education := 1 * (education > 0)]
  df_groups <- df_children[, .(n = .N), by = c("year", "birth_year", "ethnicity", "sex", "education", "district")]
  df_groups <- df_groups[n > 1]
  df_groups[, group := 1:.N]
  df_children <- merge(df_children, df_groups, by = c("year", "birth_year", "ethnicity", "sex", "education", "district"))

  df_connections      <- merge(df_children[, .(id, group)], df_connections,      by = "id")
  df_connections_long <- merge(df_children[, .(id, group)], df_connections_long, by = "id")

  df_employment <- df_children[, .(id, id_firm)]
  df_employment[, employment := 1]

  df_employment_group <- merge(df_connections[, .(id, id_firm, con = 1)], df_employment,
                               by = c("id", "id_firm"), all = TRUE)
  df_employment_group[is.na(employment), employment := 0]
  df_employment_group[is.na(con), con := 0]
  df_employment_group <- merge(df_employment_group, df_children[, .(id, group)], by = "id")
  df_employment_group <- df_employment_group[, .(employment_1 = sum(employment * con),
                                                 employment_0 = sum(employment * (1 - con)),
                                                 n_1 = sum(con)),
                                             by = .(group, id_firm)]
  df_employment_group <- merge(df_employment_group, df_groups[, .(group, n)], by = "group")
  df_employment_group <- df_employment_group[n_1 > 0 & n_1 < n]
  df_employment_group[, n_0 := n - n_1]
  df_employment_group <- df_employment_group[, .(group, id_firm, n_0, n,
                                                 employment_1 = employment_1 / n_1,
                                                 employment_0 = employment_0 / n_0)]
  df_employment_group[, employment_1 := employment_1 * 100]
  df_employment_group[, employment_0 := employment_0 * 100]
  df_employment_group[, employment := employment_1 - employment_0]
  df_employment_group[, employment_1 := NULL]

  rm(df_children, df_employment, df_groups)

  df_connections_groups <- df_connections[, .(con1 = mean(1 * (con_type == 1)),
                                              con2 = mean(1 * (con_type == 2)),
                                              con3 = mean(1 * (con_type == 3))),
                                          by = .(group, id_firm)]
  rm(df_connections)

  df_reg <- merge(df_connections_groups, df_employment_group, by = c("group", "id_firm"))
  rm(df_connections_groups, df_employment_group)

  return(list(df_reg, df_connections_long))
}

###########################################################################
## run.reg.emp.con.long.figure -> c(bins_av, con3, bin1_l, bin2_l, ..., est0)
##   plus the bin LABELS are recoverable from bins_av positions (attached as
##   an attribute so prepare knows them). We store bins_list in attr "bins".
###########################################################################
run.reg.emp.con.long.figure <- function(df_reg, df_connections_long, bin_var, bins = NULL) {

  df_connections_long[, bin_var := get(bin_var)]
  if (!is.null(bins)) df_connections_long[, bin := ceiling(bins * rank(bin_var) / .N)]
  else                df_connections_long[, bin := ceiling(bin_var)]

  bins1 <- df_connections_long[, .(mean(bin_var)), by = "bin"]
  setorder(bins1, V1)
  bins_list <- as.list(t(bins1[, 1]))
  bins_av   <- as.vector(t(bins1[, 2]))
  rm(bins1)

  df_g <- df_connections_long[, .(id_firm, group, bin, con_type)]
  for (l in bins_list) {
    df_g[, paste0("bin_1_", l) := (1 * (bin == l & con_type == 1))]
    df_g[, paste0("bin_2_", l) := (1 * (bin == l & con_type == 2))]
  }
  df_g[, bin := NULL]
  df_g <- df_g[, lapply(.SD, mean), by = .(id_firm, group)]
  rm(df_connections_long)

  df_reg <- merge(df_reg, df_g, by = c("group", "id_firm"), all.x = TRUE)
  rm(df_g)
  df_reg[is.na(df_reg)] <- 0

  vars_str <- ""
  for (l in bins_list) vars_str <- paste0(vars_str, "+ bin_1_", l, "+ bin_2_", l)
  form <- as.formula(paste0("employment  ~ -1  + con3", vars_str))

  est1 <- felm(form, df_reg)
  est0 <- df_reg[, sum(employment_0 * n_0) / sum(n_0)]

  table_temp <- data.table(c(bins_av, est1[["beta"]], est0))
  table_temp <- transpose(table_temp)
  # remember the bin labels for the aggregation step
  setattr(table_temp, "bins_list", unlist(bins_list))
  return(table_temp)
}

###########################################################################
## prepare.reg.emp.con.table.long.figure(table, bin_var)
##   Emits the full figure layout (diff block, bin_av, raw coef mean/sd/lb/ub,
##   est0 stats, B). Bin labels taken from attr "bins_list" (fallback 1..nbins).
###########################################################################
prepare.reg.emp.con.table.long.figure <- function(table, bin_var, labs = NULL) {

  nbins <- (length(table) - 2) / 3          # cols = nbins(av) + 1(con3) + 2*nbins(coef) + 1(est0)
  if (is.null(labs)) labs <- attr(table, "bins_list")
  if (is.null(labs) || length(labs) != nbins) labs <- 1:nbins

  ln <- list(); lv <- list()
  add <- function(name, val) { ln[[length(ln)+1]] <<- name; lv[[length(lv)+1]] <<- val }

  add("bin_var", bin_var)

  # column index helpers into the bootstrap table (V1.. )
  #  V1..Vnbins           = bins_av
  #  V(nbins+1)           = con3
  #  V(nbins+2), V(nbins+3) = bin1_lab1, bin2_lab1 ; then lab2, ...
  #  V(last)              = est0
  con3_col <- paste0("V", nbins + 1)
  est0_col <- paste0("V", length(table))
  b1 <- function(i) paste0("V", nbins + 1 + 2*(i-1) + 1)   # bin_1 for i-th bin
  b2 <- function(i) paste0("V", nbins + 1 + 2*(i-1) + 2)   # bin_2 for i-th bin

  # --- diff blocks (grouped by statistic, matching the figure CSV header) ---
  # first build all diff{lab} columns in the bootstrap table
  for (i in 1:nbins) {
    d <- paste0("diff", labs[i])
    table[, eval(d) := get(b2(i)) - get(b1(i))]
  }
  # diff means, then all sd, then all lb, then all ub, then all bin_av
  for (i in 1:nbins) add(paste0("diff", labs[i]),        table[, mean(get(paste0("diff", labs[i])), na.rm = TRUE)])
  for (i in 1:nbins) add(paste0("diff", labs[i], "_sd"), table[, sd(get(paste0("diff", labs[i])), na.rm = TRUE)])
  for (i in 1:nbins) add(paste0("diff", labs[i], "_lb"), table[, quantile(get(paste0("diff", labs[i])), .025, na.rm = TRUE)])
  for (i in 1:nbins) add(paste0("diff", labs[i], "_ub"), table[, quantile(get(paste0("diff", labs[i])), .975, na.rm = TRUE)])
  for (i in 1:nbins) add(paste0("bin", labs[i], "_av"),  table[, mean(get(paste0("V", i)), na.rm = TRUE)])

  # --- raw coefficient MEANS: con3, bin1_l, bin2_l ---
  add("con3", table[, mean(get(con3_col), na.rm = TRUE)])
  for (i in 1:nbins) {
    add(paste0("bin1_", labs[i]), table[, mean(get(b1(i)), na.rm = TRUE)])
    add(paste0("bin2_", labs[i]), table[, mean(get(b2(i)), na.rm = TRUE)])
  }
  # --- SD block ---
  add("con3_sd", table[, sd(get(con3_col), na.rm = TRUE)])
  for (i in 1:nbins) {
    add(paste0("bin1_", labs[i], "_sd"), table[, sd(get(b1(i)), na.rm = TRUE)])
    add(paste0("bin2_", labs[i], "_sd"), table[, sd(get(b2(i)), na.rm = TRUE)])
  }
  # --- LB block ---
  add("con3_lb", table[, quantile(get(con3_col), .025, na.rm = TRUE)])
  for (i in 1:nbins) {
    add(paste0("bin1_", labs[i], "_lb"), table[, quantile(get(b1(i)), .025, na.rm = TRUE)])
    add(paste0("bin2_", labs[i], "_lb"), table[, quantile(get(b2(i)), .025, na.rm = TRUE)])
  }
  # --- UB block ---
  add("con3_ub", table[, quantile(get(con3_col), .975, na.rm = TRUE)])
  for (i in 1:nbins) {
    add(paste0("bin1_", labs[i], "_ub"), table[, quantile(get(b1(i)), .975, na.rm = TRUE)])
    add(paste0("bin2_", labs[i], "_ub"), table[, quantile(get(b2(i)), .975, na.rm = TRUE)])
  }
  # --- est0 stats + B ---
  add("est0",    table[, mean(get(est0_col), na.rm = TRUE)])
  add("est0_sd", table[, sd(get(est0_col), na.rm = TRUE)])
  add("est0_lb", table[, quantile(get(est0_col), .025, na.rm = TRUE)])
  add("est0_ub", table[, quantile(get(est0_col), .975, na.rm = TRUE)])
  add("B",       table[, .N])

  out <- as.data.table(as.list(unlist(lv)))
  setnames(out, unlist(ln))
  return(out)
}
