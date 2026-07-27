filename <- paste0(data, "children_first_job_data_multiple2.Rdata")
load(filename)
df_children <- df
rm(df)

## create groups
df_children[,group := interaction(factor(year),factor(ethnicity),sep = ":")]
df_children[,group := interaction(group,factor(age),sep = ":")]
df_children[,group := interaction(group,factor(sex),sep = ":")]
df_children[,group := interaction(group,factor(education),sep = ":")]
df_children[,group := interaction(group,factor(district),sep = ":")]

df_children <- df_children[,.(id,id_firm,year,group,ethnicity,sex,education,salary, duration_first_job,
    employment3,  salary3, salary_growth3,
    same_firm3, salary_growth_same_firm3,con_type)]

df_children[,id_firm := factor(id_firm)]


df_children[,log_salary := log(salary)]
df_children[,log_salary3 := log(salary3)]

df_children[,con1 := 1 * (con_type == 1)]
df_children[,con2 := 1 * (con_type == 2)]
df_children[,con3 := 1 * (con_type == 3)]
df_children[,con4 := 1 * (con_type == 4)]
df_children[,con5 := 1 * (con_type == 5)]
df_children[,con6 := 1 * (con_type == 6)]
df_children[,con7 := 1 * (con_type == 7)]
df_children[,con8 := 1 * (con_type == 8)]

df_children[,con14 := con1 + con4]
df_children[,con25 := con2 + con5]
df_children[,con36 := con3 + con6]

df_children1 = copy(df_children)
# run the regressions

vars = c("log_salary",
"duration_first_job" ,
"employment3", 
"log_salary3",
"salary_growth3",
"same_firm3",
"salary_growth_same_firm3")


count <- 0

for (g in 1:7){
  df_children = copy(df_children1)
  if (g==1){
    df_children = df_children
    group1 = "all"
  }
  
  if (g==2){
    df_children = df_children[ethnicity == 0]
    group1 = "jews"
  }
  
  if (g==3){
    df_children = df_children[ethnicity == 1]
    group1 = "arabs"
  }
  
  if (g==4){
    df_children = df_children[education == 0]
    group1 = "no college"
  }
  
  if (g==5){
    df_children = df_children[education == 1]
    group1 = "college"
  }
  
  if (g==6){
    df_children = df_children[sex == 0]
    group1 = "males"
  }
  
  if (g==7){
    df_children = df_children[sex == 1]
    group1 = "females"
  }
  
  print(group1)
  
for (k in 1:length(vars)){
  print(vars[k])
  for (s in 1:2){
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
      
      
    est1 <- felm(form1,df_children)
    est2 <- felm(form2,df_children)
    est3 <- felm(form3,df_children)
    est4 <- felm(form4,df_children)
    
    x = df_children[!is.na(get(vars[k])),.N, by = "id_firm"]
    
    firms = x[,.N]
    
    y0 = df_children[con_type == 0,mean(get(vars[k]),na.rm = T),]
    
      table1 = data.table(c(est1[["beta"]][1:8],
                            est1[["cse"]][1:8],
                            est2[["beta"]][1],
                            est2[["cse"]][1],
                            est3[["beta"]][1],
                            est3[["cse"]][1],
                            est4[["beta"]][1],
                            est4[["cse"]][1],
                            vars[k],
                            group1,
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
                  group1 = V24,
                  fe = V25,
                  obs = V26,
                  firms = V27,
                  r2 = V28,
                  pr2 = V29,
                  y0 = V30)]

filename  <- paste0(output, "table_reg_salary_duration_con_multiple2.csv")
write.csv(table,filename)
rm(table,table1,x,df_children)
