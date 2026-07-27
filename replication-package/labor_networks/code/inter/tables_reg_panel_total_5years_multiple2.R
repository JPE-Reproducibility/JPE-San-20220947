filename <- paste0(data, "children_panel_total_5years_multiple2.Rdata")
load(filename)
df_wages = df
rm(df)
# run the regressions

vars = c("log_yearly_salary",
         "log_discounted_salary" ,
         "log_yearly_salary_subs")

count <- 0

for (k in 1:length(vars)){
  print(vars[k])
  for (s in 1:4){
    print(s)
    if (s == 1) {  
      form1 = as.formula(paste0(vars[k], "~  con1 + con2 + con3 + con4 + con5 + con6 + con7 + con8 |
                               group | 0 |group"))
      form2 = as.formula(paste0(vars[k], "~  con4 + con14 + con2  + con3 + con5 + con6 + con7 + con8 |
                               group | 0 |group"))
      form3 = as.formula(paste0(vars[k], "~  con5 + con25 + con1 + con3  + con4 + con5  + con6 + con7 + con8  |
                               group | 0 |group"))
      form4 = as.formula(paste0(vars[k], "~  con6 + con36 + con1 + con2  + con4 + con5  + con6 + con7 + con8  |
                               group | 0 |group"))
    }
    
    if (s == 2) {  
      form1 = as.formula(paste0(vars[k], "~  con1 + con2 + con3 + con4 + con5 + con6 + con7 + con8 |
                              id_firm +  group | 0 |group"))
      form2 = as.formula(paste0(vars[k], "~  con4 + con14 + con2  + con3 + con5 + con6 + con7 + con8 |
                               id_firm + group | 0 |group"))
      form3 = as.formula(paste0(vars[k], "~  con5 + con25 + con1 + con3  + con4 + con5  + con6 + con7 + con8  |
                             id_firm +  group | 0 |group"))
      form4 = as.formula(paste0(vars[k], "~  con6 + con36 + con1 + con2  + con4 + con5  + con6 + con7 + con8  |
                             id_firm +  group | 0 |group"))
    }

    
    if (s == 3) {  
      form1 = as.formula(paste0(vars[k], "~  con1 + con2 + con3 + con4 + con5 + con6 + con7 + con8  + log_yearly_salary |
                               group | 0 |group"))
      form2 = as.formula(paste0(vars[k], "~  con4 + con14 + con2  + con3 + con5 + con6 + con7 + con8  + log_yearly_salary |
                               group | 0 |group"))
      form3 = as.formula(paste0(vars[k], "~  con5 + con25 + con1 + con3  + con4 + con5  + con6 + con7 + con8  + log_yearly_salary |
                               group | 0 |group"))
      form4 = as.formula(paste0(vars[k], "~  con6 + con36 + con1 + con2  + con4 + con5  + con6 + con7 + con8  + log_yearly_salary |
                               group | 0 |group"))
    }
    
    if (s == 4) {  
      form1 = as.formula(paste0(vars[k], "~  con1 + con2 + con3 + con4 + con5 + con6 + con7 + con8  + log_yearly_salary|
                              id_firm +  group | 0 |group"))
      form2 = as.formula(paste0(vars[k], "~  con4 + con14 + con2  + con3 + con5 + con6 + con7 + con8  + log_yearly_salary|
                               id_firm + group | 0 |group"))
      form3 = as.formula(paste0(vars[k], "~  con5 + con25 + con1 + con3  + con4 + con5  + con6 + con7 + con8  + log_yearly_salary |
                             id_firm +  group | 0 |group"))
      form4 = as.formula(paste0(vars[k], "~  con6 + con36 + con1 + con2  + con4 + con5  + con6 + con7 + con8   + log_yearly_salary|
                             id_firm +  group | 0 |group"))
    }
    
    est1 <- felm(form1,df_wages)
    est2 <- felm(form2,df_wages)
    est3 <- felm(form3,df_wages)
    est4 <- felm(form4,df_wages)
    
    x = df_wages[!is.na(get(vars[k])),.N, by = "id_firm"]
    
    firms = x[,.N]
    
    y0 = df_wages[con_type == 0,mean(get(vars[k]),na.rm = T),]
    
    table1 = data.table(c(est1[["beta"]][1:8],
                          est1[["cse"]][1:8],
                          est2[["beta"]][1],
                          est2[["cse"]][1],
                          est3[["beta"]][1],
                          est3[["cse"]][1],
                          est4[["beta"]][1],
                          est4[["cse"]][1],
                          vars[k],
                          s,
                          est1[["N"]][1],
                          firms,summary(est1)[["r2"]][1],
                          summary(est1)[["P.r.squared"]][1],
                          y0))
    
    
    rm(est1,est2,est3,est4)
    
    if (count == 0){
      table <- transpose(table1)
    }
    if (count > 0){
      table <- rbind(table,transpose(table1))
    }
    count <- count + 1
  }
}

# export the results

table <- table[,.(con1 = V1,
                  con2 = V2,
                  con3 = V3,
                  con4 = V4,
                  con5 = V5,
                  con6 = V6,
                  con7 = V7,
                  con8 = V8,
                  con1_se = V9,
                  con2_se = V10,
                  con3_se = V11,
                  con4_se = V12,
                  con5_se = V13,
                  con6_se = V14,
                  con7_se = V15,
                  con8_se = V16,
                  diff41 = V17,
                  diff41_se = V18,
                  diff52 = V19,
                  diff52_se = V20,
                  diff63 = V21,
                  diff63_se = V22,
                  var = V23,
                  fe = V24,
                  obs = V25,
                  firms = V26,
                  r2 = V27,
                  pr2 = V28,
                  y0 = V29)]

filename  <- paste0(output, "table_reg_salary_subs_5years_multiple2.csv")
write.csv(table,filename)
rm(table,table1,x,df_wages)

