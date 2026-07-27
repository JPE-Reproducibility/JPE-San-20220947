filename <- paste0(data, "children_panel_employment.Rdata")
load(filename)
df_wages = df
rm(df)
# run the regressions

lhs_vars = c("employment",
             "firm_rank" ,
             "switch", 
             "log_yearly_salary",
             "log_yearly_salary0")


count <- 0

for (l in 1:length(lhs_vars)){

    print(lhs_vars[l])

    form1 = as.formula(paste0(lhs_vars[l], "~ " ,"employment_1  |
                               group | 0 |group"))
    form2 = as.formula(paste0(lhs_vars[l], "~ " ,"log_contacts_1 |
                               group | 0 |group"))
    form3 = as.formula(paste0(lhs_vars[l], "~ " ,"employment_1 + log_contacts_1 |
                               group | 0 |group"))
    
    
    est1 <- felm(form1,df_wages)
    est2 <- felm(form2,df_wages)
    est3 <- felm(form3,df_wages)
    
    lhs_var_mean = df_wages[,mean(get(lhs_vars[l]),na.rm=T)]
    employment_mean = df_wages[,mean(employment_1,na.rm=T)]
    log_contacts_mean = df_wages[,mean(log_contacts_1,na.rm=T)]
    
    lhs_var_sd = df_wages[,sd(get(lhs_vars[l]),na.rm=T)]
    employment_sd = df_wages[,sd(employment_1,na.rm=T)]
    log_contacts_sd = df_wages[,sd(log_contacts_1,na.rm=T)]
    
    
    table1 = data.table(c(est1[["beta"]][1:1],
                          est1[["cse"]][1:1],
                          est2[["beta"]][1:1],
                          est2[["cse"]][1:1],
                          est3[["beta"]][1:2],
                          est3[["cse"]][1:2],
                          lhs_vars[l],
                          est1[["N"]][1],
                          summary(est1)[["r2"]][1],
                          summary(est1)[["P.r.squared"]][1],
                          lhs_var_mean,
                          employment_mean,
                          log_contacts_mean,
                          lhs_var_sd,
                          employment_sd,
                          log_contacts_sd))
    
    
    rm(est1,est2,est3)
    
    if (count == 0){
      table <- transpose(table1)
    }
    if (count > 0){
      table <- rbind(table,transpose(table1))
    }
    count <- count + 1
  }


# export the results

table <- table[,.(employment_sep = V1,
                  employment_sep_se = V2,
                  log_contacts_sep = V3,
                  log_contacts_sep_se = V4,
                  employment_joint = V5,
                  log_contacts_joint = V6,
                  employment_sep_joint = V7,
                  log_contacts_sep_joint = V8,
                  lhs_var = V9,
                  obs = V10,
                  r2 = V11,
                  pr2 = V12,
                  lhs_var_mean = V13,
                  employment_mean = V14,
                  log_contacts_mean = V15,
                  lhs_var_sd = V16,
                  employment_sd = V17,
                  log_contacts_sd = V18)]

filename  <- paste0(output, "table_reg_children_panel_employment.csv")
write.csv(table,filename)
rm(table,table1,df_wages)

