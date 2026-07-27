## Code Quality

### R

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_moments.R, line 17)
  → table_temp <- merge(table_temp,table_temp1, by = "year")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_moments.R, line 40)
  → table_temp <- merge(table_temp,table_temp1, by =  c( "year","ethnicity") )

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_moments.R, line 60)
  → table_temp <- merge(table_temp,table_temp1, by =  c( "year","education") )

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_moments.R, line 80)
  → table_temp <- merge(table_temp,table_temp1, by =  c( "year","sex") )

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_moments.R, line 103)
  → table_temp <- merge(table_temp,table_temp1, by =  c( "year","ethnicity") )

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_moments.R, line 123)
  → table_temp <- merge(table_temp,table_temp1, by =  c( "year","education") )

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_moments.R, line 143)
  → table_temp <- merge(table_temp,table_temp1, by =  c( "year","sex") )

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_moments.R, line 166)
  → table_temp <- merge(table_temp,table_temp1, by =  c( "year","job_type") )

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con.R, line 13)
  → df_connections <- merge(df_connections,df_children[,.(id,year)], by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con.R, line 21)
  → df_children = merge(df_children,df_groups, by = c("year","birth_year","ethnicity","sex","education","district"))

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con.R, line 25)
  → df_connections <- merge(df_children[,.(id,group)], df_connections, by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con.R, line 38)
  → df_employment_group <- merge(df_employment_group,df_children[,.(id,group)], by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con.R, line 46)
  → df_employment_group <- merge(df_employment_group,df_groups[,.(group,n)],by = "group")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con.R, line 90)
  → df_reg <- merge(df_employment_group,df_connections_groups, by = c("group", "id_firm"))

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con.R, line 94)
  → df_reg <- merge(df_reg,df_groups[,.(group,ethnicity,sex,education)], by = "group")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con.R, line 110)
  → df_connections <- merge(df_connections,df_children[,.(id,year)], by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con.R, line 118)
  → df_children = merge(df_children,df_groups, by = c("year","birth_year","ethnicity","sex","education","district"))

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con.R, line 122)
  → df_connections <- merge(df_children[,.(id,group)], df_connections, by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con.R, line 135)
  → df_employment_group <- merge(df_employment_group,df_children[,.(id,group)], by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con.R, line 143)
  → df_employment_group <- merge(df_employment_group,df_groups[,.(group,n)],by = "group")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con.R, line 175)
  → df_reg <- merge(df_employment_group,df_connections_groups, by = c("group", "id_firm"))

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con.R, line 179)
  → df_reg <- merge(df_reg,df_groups[,.(group,ethnicity,sex,education)], by = "group")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con.R, line 198)
  → df_connections <- merge(df_connections,df_children[,.(id,year)], by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con.R, line 217)
  → df_children = merge(df_children,df_groups, by = c("year","birth_year","ethnicity","sex","education","district"))

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con.R, line 221)
  → df_connections <- merge(df_children[,.(id,group)], df_connections, by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con.R, line 234)
  → df_employment_group <- merge(df_employment_group,df_children[,.(id,group)], by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con.R, line 242)
  → df_employment_group <- merge(df_employment_group,df_groups[,.(group,n)],by = "group")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con.R, line 274)
  → df_reg <- merge(df_employment_group,df_connections_groups, by = c("group", "id_firm"))

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con.R, line 278)
  → df_reg <- merge(df_reg,df_groups[,.(group,ethnicity,sex,education)], by = "group")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con.R, line 295)
  → df_connections <- merge(df_connections,df_children[,.(id,year)], by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con.R, line 303)
  → df_children = merge(df_children,df_groups, by = c("year","birth_year","ethnicity","sex","education","district"))

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con.R, line 307)
  → df_connections <- merge(df_children[,.(id,group)], df_connections, by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con.R, line 320)
  → df_employment_group <- merge(df_employment_group,df_children[,.(id,group)], by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con.R, line 328)
  → df_employment_group <- merge(df_employment_group,df_groups[,.(group,n)],by = "group")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con.R, line 356)
  → df_reg <- merge(df_employment_group,df_connections_groups, by = c("group", "id_firm"))

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con.R, line 360)
  → df_reg <- merge(df_reg,df_groups[,.(group,ethnicity,sex,education)], by = "group")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con.R, line 379)
  → df_connections <- merge(df_connections,df_children[,.(id,year)], by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con.R, line 387)
  → df_children = merge(df_children,df_groups, by = c("year","birth_year","ethnicity","sex","education","district"))

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con.R, line 391)
  → df_connections <- merge(df_children[,.(id,group)], df_connections, by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con.R, line 404)
  → df_employment_group <- merge(df_employment_group,df_children[,.(id,group)], by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con.R, line 412)
  → df_employment_group <- merge(df_employment_group,df_groups[,.(group,n)],by = "group")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con.R, line 431)
  → df_employment_group <- merge(df_employment_group,df_groups[,.(group,n)], by = "group")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con.R, line 478)
  → df_reg <- merge(df_employment_group,df_connections_groups, by = c("group", "id_firm"))

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con.R, line 498)
  → df_connections <- merge(df_connections,df_children[,.(id,year)], by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con.R, line 506)
  → df_children = merge(df_children,df_groups, by = c("year","birth_year","ethnicity","sex","education","district"))

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con.R, line 513)
  → df_connections <- merge(df_children[,.(id,id_placebo,group)], df_connections, by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con.R, line 526)
  → df_employment_group <- merge(df_employment_group,df_children[,.(id,group)], by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con.R, line 534)
  → df_employment_group <- merge(df_employment_group,df_groups[,.(group,n)],by = "group")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con.R, line 553)
  → df_employment_group <- merge(df_employment_group,df_groups[,.(group,n)], by = "group")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con.R, line 582)
  → df_reg <- merge(df_employment_group,df_connections_groups, by = c("group", "id_firm"))

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con.R, line 586)
  → df_reg <- merge(df_reg,df_groups[,.(group,ethnicity,sex,education)], by = "group")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con.R, line 623)
  → parents_industries <- unique(merge(parent_firms,df_industry, by = "id_firm")[,.(id, parent_industry = industry)])

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con.R, line 631)
  → df_connections <- merge(df_connections,df_children[,.(id,year)], by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con.R, line 639)
  → df_children = merge(df_children,df_groups, by = c("year","birth_year","ethnicity","sex","education","district"))

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con.R, line 643)
  → df_connections <- merge(df_children[,.(id,group)], df_connections, by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con.R, line 655)
  → df_connections1 <- merge(unique(df_connections1[,.(id,group)]),

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con.R, line 661)
  → df_connections1 = merge(df_connections1,df_connections3[,.(id,id_firm,con)],

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con.R, line 667)
  → df_connections1 = merge(df_connections1,df_children[,.(id,X,Y)],

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con.R, line 670)
  → df_connections1 = merge(df_connections1,df_firms[,.(id_firm,firm_X,firm_Y,firm_industry)],

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con.R, line 724)
  → df_employment_group <- merge(df_employment_group,df_children[,.(id,group)], by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con.R, line 732)
  → df_employment_group <- merge(df_employment_group,df_groups[,.(group,n)],by = "group")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con.R, line 751)
  → df_employment_group <- merge(df_employment_group,df_groups[,.(group,n)], by = "group")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con.R, line 762)
  → df_reg <- merge(df_employment_group,df_connections_groups, by = c("group", "id_firm"))

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con.R, line 782)
  → df_connections <- merge(df_connections,df_children[,.(id,year)], by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con.R, line 790)
  → df_children = merge(df_children,df_groups, by = c("year","birth_year","ethnicity","sex","education","district"))

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con.R, line 794)
  → df_connections <- merge(df_children[,.(id,group)], df_connections, by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con.R, line 807)
  → df_employment_group <- merge(df_employment_group,df_children[,.(id,group)], by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con.R, line 815)
  → df_employment_group <- merge(df_employment_group,df_groups[,.(group,n)],by = "group")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con.R, line 842)
  → df_reg <- merge(df_employment_group,df_connections_groups, by = c("group", "id_firm"))

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con.R, line 846)
  → df_reg <- merge(df_reg,df_groups[,.(group,ethnicity,sex,education)], by = "group")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con.R, line 864)
  → df_connections <- merge(df_connections,df_children[,.(id,year)], by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con.R, line 872)
  → df_children = merge(df_children,df_groups, by = c("year","birth_year","ethnicity","sex","education","district"))

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con.R, line 876)
  → df_connections <- merge(df_children[,.(id,group)], df_connections, by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con.R, line 889)
  → df_employment_group <- merge(df_employment_group,df_children[,.(id,group)], by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con.R, line 897)
  → df_employment_group <- merge(df_employment_group,df_groups[,.(group,n)],by = "group")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con.R, line 923)
  → df_reg <- merge(df_employment_group,df_connections_groups, by = c("group", "id_firm"))

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con.R, line 927)
  → df_reg <- merge(df_reg,df_groups[,.(group,ethnicity,sex,education)], by = "group")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con.R, line 1121)
  → df_children1 <- merge(df_children1,df_groups, by = c("year","birth_year","ethnicity","sex","education","district"))

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con.R, line 1133)
  → df_connections <- merge(df_connections1,df_children[,.(id,year)], by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con.R, line 1137)
  → df_connections <- merge(df_children[,.(id,group)], df_connections, by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con.R, line 1145)
  → df_connections_group <- merge(df_connections_group,df_groups[,.(group,n)],by = "group")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con.R, line 1195)
  → df_connections <- merge(df_connections,df_children[,.(id,year)], by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con.R, line 1221)
  → df_children1 <- merge(df_children1,df_groups, by = c("year","birth_year","ethnicity","sex","education","district"))

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con.R, line 1228)
  → df_connections <- merge(df_connections1,df_children[,.(id,year)], by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con.R, line 1232)
  → df_connections <- merge(df_children[,.(id,group)], df_connections, by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con.R, line 1240)
  → df_connections_group <- merge(df_connections_group,df_groups[,.(group,n)],by = "group")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con.R, line 1290)
  → df_children1 <- merge(df_children1,df_groups, by = c("year","birth_year","ethnicity","sex","education","district"))

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con.R, line 1315)
  → df_connections <- merge(df_connections1,df_children[,.(id,year)], by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con.R, line 1319)
  → df_connections <- merge(df_children[,.(id,group)], df_connections, by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con.R, line 1360)
  → df_connections_group <- merge(df_connections_group,df_groups[,.(group,n)],by = "group")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con_long.R, line 12)
  → df_connections_long <- merge(df_connections_long,df_children[,.(id)], by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con_long.R, line 19)
  → df_connections <- merge(df_connections,df_children[,.(id,year)], by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con_long.R, line 22)
  → df_connections_long <- merge(df_connections_long,df_connections[con_type == 2,.(id,id_firm)], by = c("id","id_firm"))

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con_long.R, line 29)
  → df_children = merge(df_children,df_groups, by = c("year","birth_year","ethnicity","sex","education","district"))

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con_long.R, line 33)
  → df_connections <- merge(df_children[,.(id,group)], df_connections, by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con_long.R, line 34)
  → df_connections_long <- merge(df_children[,.(id,group)], df_connections_long, by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con_long.R, line 45)
  → df_employment_group <- merge(df_employment_group,df_children[,.(id,group)], by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con_long.R, line 53)
  → df_employment_group <- merge(df_employment_group,df_groups[,.(group,n)],by = "group")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con_long.R, line 133)
  → df_reg <- merge(df_connections1,df_employment_group, by = c("group", "id_firm"))

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con_long.R, line 155)
  → df_connections_long <- merge(df_connections_long,df_children[,.(id)], by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con_long.R, line 172)
  → df_connections <- merge(df_connections,df_children[,.(id,year)], by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con_long.R, line 175)
  → df_connections_long <- merge(df_connections_long,df_connections[con_type == 1 |con_type == 2,.(id,id_firm,con_type)], by = c("id","id_firm"))

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con_long.R, line 182)
  → df_children = merge(df_children,df_groups, by = c("year","birth_year","ethnicity","sex","education","district"))

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con_long.R, line 186)
  → df_connections <- merge(df_children[,.(id,group)], df_connections, by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con_long.R, line 187)
  → df_connections_long <- merge(df_children[,.(id,group)], df_connections_long, by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con_long.R, line 198)
  → df_employment_group <- merge(df_employment_group,df_children[,.(id,group)], by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con_long.R, line 206)
  → df_employment_group <- merge(df_employment_group,df_groups[,.(group,n)],by = "group")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con_long.R, line 236)
  → df_reg <- merge(df_connections_groups,df_employment_group, by = c("group", "id_firm"))

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con_long.R, line 260)
  → df_connections_long = merge(df_connections_long,df, by = "id_firm")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con_long.R, line 266)
  → df_connections_long <- merge(df_connections_long,df[,.(id_firm,main_sector)], by = c("id_firm"))

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con_long.R, line 273)
  → df_connections <- merge(df_connections,df_children[,.(id,year)], by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con_long.R, line 276)
  → df_connections_long <- merge(df_connections_long[,.(id_firm ,main_sector,

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con_long.R, line 286)
  → df_children = merge(df_children,df_groups, by = c("year","birth_year","ethnicity","sex","education","district"))

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con_long.R, line 290)
  → df_connections <- merge(df_children[,.(id,group)], df_connections, by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con_long.R, line 291)
  → df_connections_long <- merge(df_children[,.(id,group)], df_connections_long, by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con_long.R, line 302)
  → df_employment_group <- merge(df_employment_group,df_children[,.(id,group)], by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con_long.R, line 310)
  → df_employment_group <- merge(df_employment_group,df_groups[,.(group,n)],by = "group")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con_long.R, line 340)
  → df_reg <- merge(df_connections_groups,df_employment_group, by = c("group", "id_firm"))

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con_long.R, line 359)
  → df_connections <- merge(df_connections,df_children[,.(id,year)], by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con_long.R, line 366)
  → df_akm_person <- merge(df_akm_person,df_children[,.(id,year)], by = c("id","year"))

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con_long.R, line 375)
  → df_connections_long <- merge(df_akm_firm,

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con_long.R, line 380)
  → df_connections_long = merge(df_connections_long,df_akm_person,

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con_long.R, line 392)
  → df_children = merge(df_children,df_groups, by = c("year","birth_year","ethnicity","sex","education","district"))

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con_long.R, line 396)
  → df_connections <- merge(df_children[,.(id,group)], df_connections, by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con_long.R, line 397)
  → df_connections_long <- merge(df_children[,.(id,group)], df_connections_long, by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con_long.R, line 408)
  → df_employment_group <- merge(df_employment_group,df_children[,.(id,group)], by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con_long.R, line 416)
  → df_employment_group <- merge(df_employment_group,df_groups[,.(group,n)],by = "group")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con_long.R, line 446)
  → df_reg <- merge(df_connections_groups,df_employment_group, by = c("group", "id_firm"))

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con_long_figure.R, line 32)
  → df_connections_long <- merge(df_connections_long, df_children[, .(id)], by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con_long_figure.R, line 43)
  → df_connections <- merge(df_connections, df_children[, .(id, year)], by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con_long_figure.R, line 45)
  → df_connections_long <- merge(df_connections_long,

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con_long_figure.R, line 53)
  → df_children <- merge(df_children, df_groups, by = c("year", "birth_year", "ethnicity", "sex", "education", "district"))

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con_long_figure.R, line 55)
  → df_connections      <- merge(df_children[, .(id, group)], df_connections,      by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con_long_figure.R, line 56)
  → df_connections_long <- merge(df_children[, .(id, group)], df_connections_long, by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con_long_figure.R, line 61)
  → df_employment_group <- merge(df_connections[, .(id, id_firm, con = 1)], df_employment,

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con_long_figure.R, line 65)
  → df_employment_group <- merge(df_employment_group, df_children[, .(id, group)], by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con_long_figure.R, line 70)
  → df_employment_group <- merge(df_employment_group, df_groups[, .(group, n)], by = "group")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (functions_reg_emp_con_long_figure.R, line 89)
  → df_reg <- merge(df_connections_groups, df_employment_group, by = c("group", "id_firm"))

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_akm.R, line 49)
  → df_wages <- merge(df_wages, df_population, by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_akm_children.R, line 41)
  → df_wages <- merge(df_wages, df_population, by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_akm_res.R, line 51)
  → df_wages <- merge(df_wages, df_population, by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_children_first_job_data.R, line 21)
  → df_wages <- merge(df_children[,.(id,id_firm_first_job = id_firm,year_first_job = year)],

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_children_first_job_data_multiple2.R, line 21)
  → df_wages <- merge(df_children[,.(id,id_firm_first_job = id_firm,year_first_job = year)],

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_children_panel.R, line 21)
  → df_wages <- merge(df_children[,.(id,id_firm_first_job = id_firm,year_first_job = year)],

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_children_panel.R, line 46)
  → df_employment = merge(df_employment,

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_children_panel_employment.R, line 17)
  → df = merge(df[salary>0],df_children[,.(id)],by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_children_panel_employment.R, line 25)
  → df = merge(df1[,.(id,id_firm )],df2[,.(id,yearly_salary )] , by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_children_panel_employment.R, line 59)
  → df_wages = merge(df_wages,

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_children_panel_employment.R, line 68)
  → df_wages = merge(df_wages,

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_children_panel_employment_25.R, line 16)
  → df = merge(df[salary>0],df_children[,.(id)],by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_children_panel_employment_25.R, line 24)
  → df = merge(df1[,.(id,id_firm )],df1[,.(id,yearly_salary )] , by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_children_panel_employment_25.R, line 54)
  → df_connections = merge(df_connections,df_children[,.(id,year)], by = c("id"))

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_children_panel_employment_25.R, line 56)
  → df_connections = merge(df_connections,df[,.(id_firm,firm_rank,year)], by = c("id_firm","year"))

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_children_panel_employment_25.R, line 74)
  → df_wages = merge(df_wages,df_connections, by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_children_panel_employment_25.R, line 76)
  → df_wages = merge(df_wages,df_children_first_job, by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_children_panel_employment_phantom_past.R, line 16)
  → df = merge(df[salary>0],df_children[,.(id)],by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_children_panel_employment_phantom_past.R, line 24)
  → df = merge(df1[,.(id,id_firm )],df1[,.(id,yearly_salary )] , by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_children_panel_employment_phantom_past.R, line 55)
  → df_wages = merge(df_wages,

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_children_panel_employment_phantom_past.R, line 64)
  → df_wages = merge(df_wages,

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_children_panel_total_5years.R, line 24)
  → df = merge(df[salary>0],df_children[,.(id)],by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_children_panel_total_5years.R, line 32)
  → df = merge(df1[,.(id,id_firm )],df1[,.(id,yearly_salary )] , by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_children_panel_total_5years.R, line 47)
  → df_wages <- merge(df_wages,

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_children_panel_total_5years.R, line 63)
  → df_wages_subs_job = merge(df_wages,first_job, by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_children_panel_total_5years.R, line 78)
  → df_wages = merge(df_wages,

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_children_panel_total_5years_multiple2.R, line 24)
  → df = merge(df[salary>0],df_children[,.(id)],by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_children_panel_total_5years_multiple2.R, line 32)
  → df = merge(df1[,.(id,id_firm )],df1[,.(id,yearly_salary )] , by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_children_panel_total_5years_multiple2.R, line 47)
  → df_wages <- merge(df_wages,

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_children_panel_total_5years_multiple2.R, line 63)
  → df_wages_subs_job = merge(df_wages,first_job, by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_children_panel_total_5years_multiple2.R, line 78)
  → df_wages = merge(df_wages,

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_children_salary_30.R, line 19)
  → df_children_30 <- merge(df_children[,.(id,birth_year)],

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_children_salary_30.R, line 35)
  → df_children_30_1 <- merge(df_children_30_1,df[,.(id_firm,year,firm_rank)], by = c("id_firm","year"))

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_children_sample.R, line 13)
  → df_children <- merge(df_children,df_parents, by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_children_sample1.R, line 20)
  → df_children <- merge(df_children, df_population, by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_children_sample1.R, line 57)
  → df_children <- merge(df_children,df_location,by.x = c("id","birth_year"),

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_children_sample1_1927.R, line 20)
  → df_children <- merge(df_children, df_population, by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_children_sample1_1927.R, line 57)
  → df_children <- merge(df_children,df_location,by.x = c("id","birth_year"),

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_children_sample1_25.R, line 20)
  → df_children <- merge(df_children, df_population, by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_children_sample1_25.R, line 55)
  → df_children <- merge(df_children,df_location,by.x = c("id","birth_year"),

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_children_sample1_employment.R, line 20)
  → df_children <- merge(df_children, df_population, by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_children_sample1_employment.R, line 55)
  → df_children <- merge(df_children,df_location,by.x = c("id","birth_year"),

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_children_sample1_grad1.R, line 20)
  → df_children <- merge(df_children, df_population, by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_children_sample1_grad1.R, line 55)
  → df_children <- merge(df_children,df_location,by.x = c("id","birth_year"),

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_children_sample_1927.R, line 15)
  → df_children <- merge(df_children,df_parents, by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_children_sample_25.R, line 15)
  → df_children <- merge(df_children,df_parents, by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_children_sample_employment.R, line 15)
  → df_children <- merge(df_children,df_parents, by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_children_sample_grad1.R, line 15)
  → df_children <- merge(df_children,df_parents, by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_connections_employment_rate_25_20.R, line 45)
  → df_connections <- merge(df_children_sample[,.(id)],

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_connections_employment_rate_25_20.R, line 57)
  → df_connections <- merge(df_connections,

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_connections_employment_rate_25_20.R, line 70)
  → df_connections <- merge(df_connections,

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_connections_employment_rate_25_20.R, line 90)
  → df_connections <- merge(df_connections,

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_connections_employment_rate_25_20.R, line 105)
  → df_connections <- merge(df_connections,

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_connections_indirect.R, line 46)
  → df_connections <- merge(df_children_sample[,.(id)],

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_connections_indirect.R, line 58)
  → df_connections <- merge(df_connections,

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_connections_indirect.R, line 69)
  → df_connections <- merge(df_connections,

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_connections_indirect.R, line 97)
  → df_connections <- merge(df_connections,

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_connections_indirect_1927.R, line 46)
  → df_connections <- merge(df_children_sample[,.(id)],

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_connections_indirect_1927.R, line 58)
  → df_connections <- merge(df_connections,

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_connections_indirect_1927.R, line 69)
  → df_connections <- merge(df_connections,

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_connections_indirect_1927.R, line 97)
  → df_connections <- merge(df_connections,

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_connections_indirect_25.R, line 46)
  → df_connections <- merge(df_children_sample[,.(id)],

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_connections_indirect_25.R, line 58)
  → df_connections <- merge(df_connections,

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_connections_indirect_25.R, line 69)
  → df_connections <- merge(df_connections,

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_connections_indirect_25.R, line 97)
  → df_connections <- merge(df_connections,

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_connections_indirect_grad1.R, line 46)
  → df_connections <- merge(df_children_sample[,.(id)],

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_connections_indirect_grad1.R, line 58)
  → df_connections <- merge(df_connections,

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_connections_indirect_grad1.R, line 69)
  → df_connections <- merge(df_connections,

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_connections_indirect_grad1.R, line 97)
  → df_connections <- merge(df_connections,

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_connections_long.R, line 53)
  → df_connections <- merge(df_children[,.(id)],

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_connections_long.R, line 65)
  → df_connections <- merge(df_connections,

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_connections_long.R, line 78)
  → df_connections <- merge(df_connections,

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_connections_long.R, line 105)
  → df_connections <- merge(df_connections,

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_connections_phantom_past_employment.R, line 47)
  → df_connections <- merge(df_children_sample[,.(id)],

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_connections_phantom_past_employment.R, line 59)
  → df_connections <- merge(df_connections,

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_connections_phantom_past_employment.R, line 77)
  → df_connections1 <- merge(df_connections,

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_connections_phantom_past_employment.R, line 105)
  → df_connections <- merge(df_connections,

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_duration_first_job.R, line 19)
  → df_wages <- merge(df_children[,.(id,id_firm_first_job = id_firm,year_first_job = year)],

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_duration_first_job.R, line 65)
  → df_children = merge(df_children,df_employment_first_firm, by = c("id"))

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_education.R, line 35)
  → df_education <- merge(df_education,birth_year, by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_firm_year.R, line 27)
  → df_firms <- merge(df_firms, df[,.(id_firm,year,firm_rank)],

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_industry.R, line 53)
  → df1 <- merge(df,df, by = "id_firm", allow.cartesian = TRUE)[year.y - year.x == 1,  .N, by = c("year.x","year.y","industry.x","industry.y") ]

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_industry.R, line 63)
  → df1 <- merge(df2,df3, by.x = "industry1", by.y = "industry2", allow.cartesian = TRUE)[year2>=year0]

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_parents_firms.R, line 24)
  → df_connections <- merge(df_children_sample[,.(id,birth_year)],

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_parents_firms.R, line 30)
  → df_connections <- merge(df_connections,

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_parents_firms_1927.R, line 23)
  → df_connections <- merge(df_children_sample[,.(id,birth_year)],

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_parents_firms_1927.R, line 29)
  → df_connections <- merge(df_connections,

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_parents_firms_25.R, line 23)
  → df_connections <- merge(df_children_sample[,.(id,birth_year)],

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_parents_firms_25.R, line 29)
  → df_connections <- merge(df_connections,

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_parents_firms_employment.R, line 23)
  → df_connections <- merge(df_children_sample[,.(id,birth_year)],

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_parents_firms_employment.R, line 29)
  → df_connections <- merge(df_connections,

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_parents_firms_firm_size.R, line 26)
  → df_connections <- merge(df_children_sample[,.(id,birth_year)],

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_parents_firms_firm_size.R, line 31)
  → df_connections <- merge(df_connections,

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_parents_firms_firm_size.R, line 43)
  → df_connections = merge(df_connections,df_children_sample[,.(id,year)], by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_parents_firms_firm_size.R, line 47)
  → df_connections = merge(df_connections,employment_history[,.(id_firm,year,firm_size)], by = c("id_firm","year"))

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_parents_firms_grad1.R, line 23)
  → df_connections <- merge(df_children_sample[,.(id,birth_year)],

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_parents_firms_grad1.R, line 29)
  → df_connections <- merge(df_connections,

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_population.R, line 27)
  → df <- merge(df,  df_birth_country, by = c("birth_country"),

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_population.R, line 43)
  → df <- merge(df,  df1, by = c("id"),

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_sector.R, line 37)
  → df <- merge(df_firm, ind2d2sector,

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_sector.R, line 40)
  → df <- merge(df, public,

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_wages.R, line 120)
  → df <- merge(df, df_population, by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_wages_1927.R, line 120)
  → df <- merge(df, df_population, by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (prepare_wages_total.R, line 132)
  → df <- merge(df, df_population, by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (tables_children_panel.R, line 13)
  → df_wages = merge(df_wages,df_children[,.(id,duration_first_job)], by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (tables_hist_con.R, line 20)
  → df_connections <- merge(df_connections, df_children[,.(id, year)], by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (tables_hist_con.R, line 49)
  → df_firms = merge(df_firms,df_industry, by = "id_firm")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (tables_hist_con.R, line 60)
  → firm_size = merge(df_firms[,.(id_firm,year,con_type,N)],firm_size, by = c("id_firm","year"))

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (tables_hist_con.R, line 72)
  → df_workers =merge(df_workers,df_children[,.(id,sex,ethnicity)],by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (tables_hist_con.R, line 129)
  → df_connections = merge(df_connections,df_industry, by = "id_firm")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (tables_hist_con.R, line 149)
  → df_connections_long <- merge(df_connections_long,df_connections, by = c("id","id_firm"))

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (tables_hist_con.R, line 198)
  → df_connections_long <- merge(df_connections_long,df_connections, by = c("id","id_firm"))

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (tables_raw_emp_con.R, line 14)
  → df_connections <- merge(df_connections,df_children[,.(id,year)], by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (tables_reg_emp_con_long_sector_sex.R, line 36)
  → df_connections_long_firm = merge(df_connections_long_firm,df_children[,.(id,sex)], by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (tables_reg_emp_con_long_year.R, line 30)
  → df_connections_long_firm <- merge(list1[[2]], df_children[,.(id,year)], by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (tables_reg_emp_con_multiple_jobs.R, line 34)
  → df_children = merge(df_children,df_jobs, by = c("id_firm", "year"))

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (tables_reg_emp_con_multiple_jobs.R, line 84)
  → df_children = merge(df_children,df_jobs, by = c("id_firm", "year"))

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (tables_reg_emp_con_one_job.R, line 34)
  → df_children = merge(df_children,df_jobs, by = c("id_firm", "year"))

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (tables_reg_emp_con_one_job.R, line 160)
  → df_children = merge(df_children,df_jobs, by = c("id_firm", "year"))

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (tables_retirement.R, line 74)
  → df <- merge(df, df_population, by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (tables_structural_data_multiple2.R, line 15)
  → df_children <- merge(df_children,df[,.(id_firm,year,firm_rank)], by = c("id_firm","year"))

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (tables_structural_data_multiple2.R, line 26)
  → df_children <- merge(df_children,df_children_types, by = c("ethnicity","education","sex"))

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (tables_structural_data_multiple2.R, line 38)
  → df_jobs <- merge(df_jobs,df_job_types, by = c("firm_rank_bin"))

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (tables_structural_data_multiple2.R, line 42)
  → df_children <- merge(df_children,df_jobs[,.(id_job,year,job_type)], by = c("id_job","year"))

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (tables_structural_data_multiple2.R, line 50)
  → df_connections <- merge(df_connections,df_children[,.(id)], by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (tables_structural_data_multiple2.R, line 69)
  → df_connections <- merge(df_connections,df_children[,.(id,year,worker_type)] , by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (tables_structural_data_multiple2.R, line 70)
  → df_connections <- merge(df_connections,df_jobs[,.(id_job,id_firm,year,job_type)] , by = c("id_firm","year") , allow.cartesian=TRUE)

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (‏‏functions_reg_emp_con_25.R, line 12)
  → df_connections <- merge(df_connections,df_children[,.(id,year)], by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (‏‏functions_reg_emp_con_25.R, line 20)
  → df_children = merge(df_children,df_groups, by = c("year","birth_year","ethnicity","sex","education","district"))

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (‏‏functions_reg_emp_con_25.R, line 24)
  → df_connections <- merge(df_children[,.(id,group)], df_connections, by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (‏‏functions_reg_emp_con_25.R, line 37)
  → df_employment_group <- merge(df_employment_group,df_children[,.(id,group)], by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (‏‏functions_reg_emp_con_25.R, line 45)
  → df_employment_group <- merge(df_employment_group,df_groups[,.(group,n)],by = "group")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (‏‏functions_reg_emp_con_25.R, line 89)
  → df_reg <- merge(df_employment_group,df_connections_groups, by = c("group", "id_firm"))

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (‏‏functions_reg_emp_con_25.R, line 93)
  → df_reg <- merge(df_reg,df_groups[,.(group,ethnicity,sex,education)], by = "group")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (‏‏functions_reg_emp_con_25.R, line 161)
  → df_children1 <- merge(df_children1,df_groups, by = c("year","birth_year","ethnicity","sex","education","district"))

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (‏‏functions_reg_emp_con_25.R, line 173)
  → df_connections <- merge(df_connections1,df_children[,.(id,year)], by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (‏‏functions_reg_emp_con_25.R, line 177)
  → df_connections <- merge(df_children[,.(id,group)], df_connections, by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (‏‏functions_reg_emp_con_25.R, line 185)
  → df_connections_group <- merge(df_connections_group,df_groups[,.(group,n)],by = "group")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (‏‏‏‏functions_reg_emp_con_grad1.R, line 12)
  → df_connections <- merge(df_connections,df_children[,.(id,year)], by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (‏‏‏‏functions_reg_emp_con_grad1.R, line 20)
  → df_children = merge(df_children,df_groups, by = c("year","birth_year","ethnicity","sex","education","district"))

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (‏‏‏‏functions_reg_emp_con_grad1.R, line 24)
  → df_connections <- merge(df_children[,.(id,group)], df_connections, by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (‏‏‏‏functions_reg_emp_con_grad1.R, line 37)
  → df_employment_group <- merge(df_employment_group,df_children[,.(id,group)], by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (‏‏‏‏functions_reg_emp_con_grad1.R, line 45)
  → df_employment_group <- merge(df_employment_group,df_groups[,.(group,n)],by = "group")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (‏‏‏‏functions_reg_emp_con_grad1.R, line 89)
  → df_reg <- merge(df_employment_group,df_connections_groups, by = c("group", "id_firm"))

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (‏‏‏‏functions_reg_emp_con_grad1.R, line 93)
  → df_reg <- merge(df_reg,df_groups[,.(group,ethnicity,sex,education)], by = "group")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (‏‏‏‏functions_reg_emp_con_grad1.R, line 161)
  → df_children1 <- merge(df_children1,df_groups, by = c("year","birth_year","ethnicity","sex","education","district"))

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (‏‏‏‏functions_reg_emp_con_grad1.R, line 173)
  → df_connections <- merge(df_connections1,df_children[,.(id,year)], by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (‏‏‏‏functions_reg_emp_con_grad1.R, line 177)
  → df_connections <- merge(df_children[,.(id,group)], df_connections, by = "id")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (‏‏‏‏functions_reg_emp_con_grad1.R, line 185)
  → df_connections_group <- merge(df_connections_group,df_groups[,.(group,n)],by = "group")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (gen_figures.R, line 1384)
  → df <- merge(df1,df2, by = "year")

[ADVISORY] `merge()` called without explicit `all=`, `all.x=`, or `all.y=` argument — defaults to inner join, which may silently drop rows. (simulate_wages.R, line 85)
  → py <- merge(py, firms[, .(id_firm, industry)], by = "id_firm")

