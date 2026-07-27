
####################################################
### Table 1: summary statistics--- new workers  ###
####################################################
df <- read.csv(paste0( output, "table_summary_children_multiple2.csv"))
df =data.table(df)
df = df[c(1,2,3,6,7)]

filename  <- paste0(tables, "table_summary_children_body.tex")
cat("\\\\[-1.8ex]
    & \\multicolumn{1}{c}{All}
    & \\multicolumn{2}{c}{Ethnicity}
    & \\multicolumn{2}{c}{Gender}
    \\\\ ",
    "
      \\cmidrule(lr){2-2}
      \\cmidrule(lr){3-4}
      \\cmidrule(lr){5-6}
    \\\\  ",
    "
    &
    & \\multicolumn{1}{c}{Jews}
    & \\multicolumn{1}{c}{Arabs}
    & \\multicolumn{1}{c}{Males}
    & \\multicolumn{1}{c}{Females}
    \\\\ ",
    "\\hline \\\\[+0.5ex] ",
    paste0( "N." ,
            " & " ,format(round(df[1,"obs"], 0), nsmall = 0 , big.mark = ","),
            " & " ,format(round(df[2,"obs"], 0), nsmall = 0, big.mark = ","),
            " & " ,format(round(df[3,"obs"], 0), nsmall = 0, big.mark = ","),
            " & " ,format(round(df[4,"obs"], 0), nsmall = 0, big.mark = ","),
            " & " ,format(round(df[5,"obs"], 0), nsmall = 0, big.mark = ","),
            " \\\\[0.5ex]  "),
    paste0( "Arabs" ,
            " & " ,format(round(df[1,"ethnicity"], 3), nsmall = 3),
            " & " ,format(round(df[2,"ethnicity"], 3), nsmall = 3),
            " & " ,format(round(df[3,"ethnicity"], 3), nsmall = 3),
            " & " ,format(round(df[4,"ethnicity"], 3), nsmall = 3),
            " & " ,format(round(df[5,"ethnicity"], 3), nsmall = 3),
            " \\\\[0.5ex]  "),
    paste0( "Females" ,
            " & " ,format(round(df[1,"sex"], 3), nsmall = 3),
            " & " ,format(round(df[2,"sex"], 3), nsmall = 3),
            " & " ,format(round(df[3,"sex"], 3), nsmall = 3),
            " & " ,format(round(df[4,"sex"], 3), nsmall = 3),
            " & " ,format(round(df[5,"sex"], 3), nsmall = 3),
            " \\\\[0.5ex]  "),
    paste0( "College" ,
            " & " ,format(round(df[1,"education"], 3), nsmall = 3),
            " & " ,format(round(df[2,"education"], 3), nsmall = 3),
            " & " ,format(round(df[3,"education"], 3), nsmall = 3),
            " & " ,format(round(df[4,"education"], 3), nsmall = 3),
            " & " ,format(round(df[5,"education"], 3), nsmall = 3),
            " \\\\[2.5ex]  "),
    paste0( "First job" ,
            " & ",
            " & ",
            " & ",
            " & ",
            " & ",
            " \\\\[0.5ex]  "),
    paste0( "\\quad \\quad Age" ,
            " & " ,format(round(df[1,"age"], 2), nsmall = 2),
            " & " ,format(round(df[2,"age"], 2), nsmall = 2),
            " & " ,format(round(df[3,"age"], 2), nsmall = 2),
            " & " ,format(round(df[4,"age"], 2), nsmall = 2),
            " & " ,format(round(df[5,"age"], 2), nsmall = 2),
            " \\\\[0.5ex]  "),
    paste0( "\\quad \\quad  Salary" ,
            " & " ,format(round(df[1,"salary"], 0), nsmall = 0 , big.mark = ","),
            " & " ,format(round(df[2,"salary"], 0), nsmall = 0, big.mark = ","),
            " & " ,format(round(df[3,"salary"], 0), nsmall = 0, big.mark = ","),
            " & " ,format(round(df[4,"salary"], 0), nsmall = 0, big.mark = ","),
            " & " ,format(round(df[5,"salary"], 0), nsmall = 0, big.mark = ","),
            " \\\\[0.5ex]  "),
    paste0( "\\quad \\quad  Firm rank" ,
            " & " ,format(round(df[1,"firm_rank"], 3), nsmall = 3),
            " & " ,format(round(df[2,"firm_rank"], 3), nsmall = 3),
            " & " ,format(round(df[3,"firm_rank"], 3), nsmall = 3),
            " & " ,format(round(df[4,"firm_rank"], 3), nsmall = 3),
            " & " ,format(round(df[5,"firm_rank"], 3), nsmall = 3),
            " \\\\[0.5ex]  "),
    paste0( "\\quad \\quad Connections" ,
            " & ",
            " & ",
            " & ",
            " & ",
            " & ",
            " \\\\[0.5ex]  "),
    paste0( "\\quad \\quad \\quad \\quad  Weak: 1" ,
            " & " ,format(round(df[1,"con4"], 3), nsmall = 3),
            " & " ,format(round(df[2,"con4"], 3), nsmall = 3),
            " & " ,format(round(df[3,"con4"], 3), nsmall = 3),
            " & " ,format(round(df[4,"con4"], 3), nsmall = 3),
            " & " ,format(round(df[5,"con4"], 3), nsmall = 3),
            " \\\\[0.5ex]  "),
    paste0( "\\quad \\quad \\quad \\quad  Weak: 2" ,
            " & " ,format(round(df[1,"con5"], 3), nsmall = 3),
            " & " ,format(round(df[2,"con5"], 3), nsmall = 3),
            " & " ,format(round(df[3,"con5"], 3), nsmall = 3),
            " & " ,format(round(df[4,"con5"], 3), nsmall = 3),
            " & " ,format(round(df[5,"con5"], 3), nsmall = 3),
            " \\\\[0.5ex]  "),
    paste0( "\\quad \\quad \\quad \\quad  Weak: 3+" ,
            " & " ,format(round(df[1,"con6"], 3), nsmall = 3),
            " & " ,format(round(df[2,"con6"], 3), nsmall = 3),
            " & " ,format(round(df[3,"con6"], 3), nsmall = 3),
            " & " ,format(round(df[4,"con6"], 3), nsmall = 3),
            " & " ,format(round(df[5,"con6"], 3), nsmall = 3),
            " \\\\[0.5ex]  "),
    paste0( "\\quad \\quad \\quad \\quad   Strong" ,
            " & " ,format(round(df[1,"con8"], 3), nsmall = 3),
            " & " ,format(round(df[2,"con8"], 3), nsmall = 3),
            " & " ,format(round(df[3,"con8"], 3), nsmall = 3),
            " & " ,format(round(df[4,"con8"], 3), nsmall = 3),
            " & " ,format(round(df[5,"con8"], 3), nsmall = 3),
            " \\\\[2.5ex]  "),
    paste0( "Connections" ,
            " & ",
            " & ",
            " & ",
            " & ",
            " & ",
            " \\\\[0.5ex]  "),
    paste0( "\\quad \\quad Av. firm rank" ,
            " & ",
            " & ",
            " & ",
            " & ",
            " & ",
            " \\\\[0.5ex]  "),
    paste0( "\\quad \\quad \\quad \\quad Weak: 1" ,
            " & " ,format(round(df[1,"firm_rank_con4"], 3), nsmall = 3),
            " & " ,format(round(df[2,"firm_rank_con4"], 3), nsmall = 3),
            " & " ,format(round(df[3,"firm_rank_con4"], 3), nsmall = 3),
            " & " ,format(round(df[4,"firm_rank_con4"], 3), nsmall = 3),
            " & " ,format(round(df[5,"firm_rank_con4"], 3), nsmall = 3),
            " \\\\[0.5ex]  "),
    paste0( "\\quad \\quad \\quad \\quad Weak: 2" ,
            " & " ,format(round(df[1,"firm_rank_con5"], 3), nsmall = 3),
            " & " ,format(round(df[2,"firm_rank_con5"], 3), nsmall = 3),
            " & " ,format(round(df[3,"firm_rank_con5"], 3), nsmall = 3),
            " & " ,format(round(df[4,"firm_rank_con5"], 3), nsmall = 3),
            " & " ,format(round(df[5,"firm_rank_con5"], 3), nsmall = 3),
            " \\\\[0.5ex]  "),
    paste0( "\\quad \\quad \\quad \\quad Weak: 3+" ,
            " & " ,format(round(df[1,"firm_rank_con6"], 3), nsmall = 3),
            " & " ,format(round(df[2,"firm_rank_con6"], 3), nsmall = 3),
            " & " ,format(round(df[3,"firm_rank_con6"], 3), nsmall = 3),
            " & " ,format(round(df[4,"firm_rank_con6"], 3), nsmall = 3),
            " & " ,format(round(df[5,"firm_rank_con6"], 3), nsmall = 3),
            " \\\\[0.5ex]  "),
    paste0( "\\quad \\quad \\quad \\quad Strong" ,
            " & " ,format(round(df[1,"firm_rank_con8"], 3), nsmall = 3),
            " & " ,format(round(df[2,"firm_rank_con8"], 3), nsmall = 3),
            " & " ,format(round(df[3,"firm_rank_con8"], 3), nsmall = 3),
            " & " ,format(round(df[4,"firm_rank_con8"], 3), nsmall = 3),
            " & " ,format(round(df[5,"firm_rank_con8"], 3), nsmall = 3),
            " \\\\[0.5ex]  "),
    paste0( "\\quad \\quad N. firms" ,
            " & ",
            " & ",
            " & ",
            " & ",
            " & ",
            " \\\\[0.5ex]  "),
    paste0( "\\quad \\quad \\quad \\quad Weak: 1" ,
            " & " ,format(round(df[1,"firms_con4"], 2), nsmall = 2),
            " & " ,format(round(df[2,"firms_con4"], 2), nsmall = 2),
            " & " ,format(round(df[3,"firms_con4"], 2), nsmall = 2),
            " & " ,format(round(df[4,"firms_con4"], 2), nsmall = 2),
            " & " ,format(round(df[5,"firms_con4"], 2), nsmall = 2),
            " \\\\[0.5ex]  "),
    paste0( "\\quad \\quad \\quad \\quad Weak: 2" ,
            " & " ,format(round(df[1,"firms_con5"], 3), nsmall = 3),
            " & " ,format(round(df[2,"firms_con5"], 3), nsmall = 3),
            " & " ,format(round(df[3,"firms_con5"], 3), nsmall = 3),
            " & " ,format(round(df[4,"firms_con5"], 3), nsmall = 3),
            " & " ,format(round(df[5,"firms_con5"], 3), nsmall = 3),
            " \\\\[0.5ex]  "),
    paste0( "\\quad \\quad \\quad \\quad Weak: 3+" ,
            " & " ,format(round(df[1,"firms_con6"], 3), nsmall = 3),
            " & " ,format(round(df[2,"firms_con6"], 3), nsmall = 3),
            " & " ,format(round(df[3,"firms_con6"], 3), nsmall = 3),
            " & " ,format(round(df[4,"firms_con6"], 3), nsmall = 3),
            " & " ,format(round(df[5,"firms_con6"], 3), nsmall = 3),
            " \\\\[0.5ex]  "),
    paste0( "\\quad \\quad \\quad \\quad Strong" ,
            " & " ,format(round(df[1,"firms_con8"], 3), nsmall = 3),
            " & " ,format(round(df[2,"firms_con8"], 3), nsmall = 3),
            " & " ,format(round(df[3,"firms_con8"], 3), nsmall = 3),
            " & " ,format(round(df[4,"firms_con8"], 3), nsmall = 3),
            " & " ,format(round(df[5,"firms_con8"], 3), nsmall = 3),
            " \\\\[0.5ex]  "),
    file=filename,sep="\n",append=FALSE)



###################################################################
### Table 2: effects of connections on employment - multiple2  ###
###################################################################
df <- read.csv(paste0( output, "table_reg_emp_con_multiple2.csv"))

filename  <- paste0(tables, "table_reg_emp_con_multiple2_body.tex")
cat(
  " \\\\[-1.8ex] &
    \\multicolumn{1}{c}{All} &
    \\multicolumn{1}{c}{Jews} &
    \\multicolumn{1}{c}{Arabs} &
    \\multicolumn{1}{c}{Males} &
    \\multicolumn{1}{c}{Females}
    \\\\ ",
  " \\\\[-1.8ex] &
    \\multicolumn{1}{c}{(1)} &
    \\multicolumn{1}{c}{(2)} &
    \\multicolumn{1}{c}{(3)} &
    \\multicolumn{1}{c}{(4)} &
    \\multicolumn{1}{c}{(5)}
    \\\\ ",
  
  "\\hline \\\\[+0.5ex] ",
  paste0( "Phantom: 1" ,
          " & ",format(round(df[1,"con1"], 3), nsmall = 3),
          " & " ,format(round(df[2,"con1"], 3), nsmall = 3),
          " & " ,format(round(df[3,"con1"], 3), nsmall = 3),
          " & " ,format(round(df[4,"con1"], 3), nsmall = 3),
          " & " ,format(round(df[5,"con1"], 3), nsmall = 3),
          " \\\\[0.2ex]  "),
  paste0(
    " & ", "(",format(round(df[1,"con1_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[2,"con1_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[3,"con1_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[4,"con1_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[5,"con1_sd"], 3), nsmall = 3),")",
    " \\\\[0.5ex]  "),
  
  paste0( "Phantom: 2" ,
          " & ",format(round(df[1,"con2"], 3), nsmall = 3),
          " & " ,format(round(df[2,"con2"], 3), nsmall = 3),
          " & " ,format(round(df[3,"con2"], 3), nsmall = 3),
          " & " ,format(round(df[4,"con2"], 3), nsmall = 3),
          " & " ,format(round(df[5,"con2"], 3), nsmall = 3),
          " \\\\[0.2ex]  "),
  paste0(
    " & ", "(",format(round(df[1,"con2_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[2,"con2_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[3,"con2_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[4,"con2_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[5,"con2_sd"], 3), nsmall = 3),")",
    " \\\\[0.5ex]  "),
  
  paste0( "Phantom: 3+" ,
          " & " ,format(round(df[1,"con3"], 3), nsmall = 3),
          " & " ,format(round(df[2,"con3"], 3), nsmall = 3),
          " & " ,format(round(df[3,"con3"], 3), nsmall = 3),
          " & " ,format(round(df[4,"con3"], 3), nsmall = 3),
          " & " ,format(round(df[5,"con3"], 3), nsmall = 3),
          " \\\\[0.2ex]  "),
  
  paste0(
    " & ", "(",format(round(df[1,"con3_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[2,"con3_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[3,"con3_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[4,"con3_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[5,"con3_sd"], 3), nsmall = 3),")",
    " \\\\[0.5ex]  "),
  
  paste0( "Weak: 1" ,
          " & " ,format(round(df[1,"con4"], 3), nsmall = 3),
          " & " ,format(round(df[2,"con4"], 3), nsmall = 3),
          " & " ,format(round(df[3,"con4"], 3), nsmall = 3),
          " & " ,format(round(df[4,"con4"], 3), nsmall = 3),
          " & " ,format(round(df[5,"con4"], 3), nsmall = 3),
          " \\\\[0.2ex]  "),
  
  paste0(
    " & ", "(",format(round(df[1,"con4_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[2,"con4_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[3,"con4_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[4,"con4_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[5,"con4_sd"], 3), nsmall = 3),")",
    " \\\\[0.5ex]  "),
  
  paste0( "Weak: 2" ,
          " & " ,format(round(df[1,"con5"], 3), nsmall = 3),
          " & " ,format(round(df[2,"con5"], 3), nsmall = 3),
          " & " ,format(round(df[3,"con5"], 3), nsmall = 3),
          " & " ,format(round(df[4,"con5"], 3), nsmall = 3),
          " & " ,format(round(df[5,"con5"], 3), nsmall = 3),
          " \\\\[0.2ex]  "),
  
  paste0(
    " & ", "(",format(round(df[1,"con5_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[2,"con5_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[3,"con5_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[4,"con5_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[5,"con5_sd"], 3), nsmall = 3),")",
    " \\\\[0.5ex]  "),
  
  paste0( "Weak: 3+" ,
          " & " ,format(round(df[1,"con6"], 3), nsmall = 3),
          " & " ,format(round(df[2,"con6"], 3), nsmall = 3),
          " & " ,format(round(df[3,"con6"], 3), nsmall = 3),
          " & " ,format(round(df[4,"con6"], 3), nsmall = 3),
          " & " ,format(round(df[5,"con6"], 3), nsmall = 3),
          " \\\\[0.2ex]  "),
  
  paste0(
    " & ", "(",format(round(df[1,"con6_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[2,"con6_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[3,"con6_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[4,"con6_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[5,"con6_sd"], 3), nsmall = 3),")",
    " \\\\[0.5ex]  "),
  
  paste0( "Mixed (phantom/weak)" ,
          " & " ,format(round(df[1,"con7"], 3), nsmall = 3),
          " & " ,format(round(df[2,"con7"], 3), nsmall = 3),
          " & " ,format(round(df[3,"con7"], 3), nsmall = 3),
          " & " ,format(round(df[4,"con7"], 3), nsmall = 3),
          " & " ,format(round(df[5,"con7"], 3), nsmall = 3),
          " \\\\[0.2ex]  "),
  
  paste0(
    " & ", "(",format(round(df[1,"con7_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[2,"con7_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[3,"con7_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[4,"con7_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[5,"con7_sd"], 3), nsmall = 3),")",
    " \\\\[0.5ex]  "),
  
  paste0( "Strong" ,
          " & " ,format(round(df[1,"con8"], 3), nsmall = 3),
          " & " ,format(round(df[2,"con8"], 3), nsmall = 3),
          " & " ,format(round(df[3,"con8"], 3), nsmall = 3),
          " & " ,format(round(df[4,"con8"], 3), nsmall = 3),
          " & " ,format(round(df[5,"con8"], 3), nsmall = 3),
          " \\\\[0.2ex]  "),
  
  paste0(
    " & ", "(",format(round(df[1,"con8_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[2,"con8_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[3,"con8_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[4,"con8_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[5,"con8_sd"], 3), nsmall = 3),")",
    " \\\\[0.5ex]  "),
  
  
  " \\hline \\\\[-1.8ex] ",
  
  paste0( "Diff. weak-phantom: 1" ,
          " & ",format(round(df[1,"diff41"], 3), nsmall = 3),
          " & ",format(round(df[2,"diff41"], 3), nsmall = 3),
          " & ",format(round(df[3,"diff41"], 3), nsmall = 3),
          " & ",format(round(df[4,"diff41"], 3), nsmall = 3),
          " & ",format(round(df[5,"diff41"], 3), nsmall = 3),
          " \\\\[+0.2ex]  "),
  paste0(
    " & ", "(",format(round(df[1,"diff41_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[2,"diff41_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[3,"diff41_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[4,"diff41_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[5,"diff41_sd"], 3), nsmall = 3),")", 
    " \\\\[+0.5ex]  "),
  paste0( "Diff. weak-phantom: 2" ,
          " & ",format(round(df[1,"diff52"], 3), digits = 4),
          " & ",format(round(df[2,"diff52"], 3), digits = 4),
          " & ",format(round(df[3,"diff52"], 3), digits = 4),
          " & ",format(round(df[4,"diff52"], 3), digits = 4),
          " & ",format(round(df[5,"diff52"], 3), digits = 4),
          " \\\\[+0.2ex]  "),
  paste0(
    " & ", "(",format(round(df[1,"diff52_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[2,"diff52_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[3,"diff52_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[4,"diff52_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[5,"diff52_sd"], 3), nsmall = 3),")", 
    " \\\\[+0.5ex]  "),
  
  paste0( "Diff. weak-phantom: 3+" ,
          " & ",format(round(df[1,"diff63"], 3), digits = 4),
          " & ",format(round(df[2,"diff63"], 3), digits = 4),
          " & ",format(round(df[3,"diff63"], 3), digits = 4),
          " & ",format(round(df[4,"diff63"], 3), digits = 4),
          " & ",format(round(df[5,"diff63"], 3), digits = 4),
          " \\\\[+0.2ex]  "),
  paste0(
    " & ", "(",format(round(df[1,"diff63_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[2,"diff63_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[3,"diff63_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[4,"diff63_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[5,"diff63_sd"], 3), nsmall = 3),")", 
    " \\\\[+0.5ex]  "),
  
  
  " \\hline \\\\[-1.8ex] ",
  
  paste0( "Ratio weak-phantom: 1" ,
          " & ",format(round(df[1,"ratio41"], 3), nsmall = 3),
          " & ",format(round(df[2,"ratio41"], 3), nsmall = 3),
          " & ",format(round(df[3,"ratio41"], 3), nsmall = 3),
          " & ",format(round(df[4,"ratio41"], 3), nsmall = 3),
          " & ",format(round(df[5,"ratio41"], 3), nsmall = 3),
          " \\\\[+0.2ex]  "),
  paste0(
    " & ", "(",format(round(df[1,"ratio41_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[2,"ratio41_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[3,"ratio41_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[4,"ratio41_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[5,"ratio41_sd"], 3), nsmall = 3),")", 
    " \\\\[+0.5ex]  "),
  paste0( "Ratio weak-phantom: 2" ,
          " & ",format(round(df[1,"ratio52"], 3), digits = 4),
          " & ",format(round(df[2,"ratio52"], 3), digits = 4),
          " & ",format(round(df[3,"ratio52"], 3), digits = 4),
          " & ",format(round(df[4,"ratio52"], 3), digits = 4),
          " & ",format(round(df[5,"ratio52"], 3), digits = 4),
          " \\\\[+0.2ex]  "),
  paste0(
    " & ", "(",format(round(df[1,"ratio52_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[2,"ratio52_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[3,"ratio52_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[4,"ratio52_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[5,"ratio52_sd"], 3), nsmall = 3),")", 
    " \\\\[+0.5ex]  "),
  
  paste0( "Ratio weak-phantom: 3+" ,
          " & ",format(round(df[1,"ratio63"], 3), digits = 4),
          " & ",format(round(df[2,"ratio63"], 3), digits = 4),
          " & ",format(round(df[3,"ratio63"], 3), digits = 4),
          " & ",format(round(df[4,"ratio63"], 3), digits = 4),
          " & ",format(round(df[5,"ratio63"], 3), digits = 4),
          " \\\\[+0.2ex]  "),
  paste0(
    " & ", "(",format(round(df[1,"ratio63_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[2,"ratio63_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[3,"ratio63_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[4,"ratio63_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[5,"ratio63_sd"], 3), nsmall = 3),")", 
    " \\\\[+0.5ex]  "),
  
  " \\hline \\\\[-1.8ex] ",
  
  paste0( "R0 (no connections)" ,
          " & ",format(round(df[1,"est0"], 3), nsmall = 3),
          " & ",format(round(df[2,"est0"], 3), nsmall = 3),
          " & ",format(round(df[3,"est0"], 3), nsmall = 3),
          " & ",format(round(df[4,"est0"], 3), nsmall = 3),
          " & ",format(round(df[5,"est0"], 3), nsmall = 3),
          " \\\\[+0.2ex]  "),
  paste0(
    " & ", "(",format(round(df[1,"est0_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[2,"est0_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[3,"est0_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[4,"est0_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[5,"est0_sd"], 3), nsmall = 3),")", 
    " \\\\[+0.5ex]  "),
  
  " \\hline \\\\[-1.8ex] ",
  paste0( "Observations" ,
          " & ",format(round(df[1,"obs"], 0), nsmall = 0, big.mark=","),
          " & ",format(round(df[2,"obs"], 0), nsmall = 0, big.mark=","),
          " & ",format(round(df[3,"obs"], 0), nsmall = 0, big.mark=","),
          " & ",format(round(df[4,"obs"], 0), nsmall = 0, big.mark=","),
          " & ",format(round(df[5,"obs"], 0), nsmall = 0, big.mark=","),
          " \\\\[0.5ex]  "),
  
  file=filename,sep="\n",append=FALSE)



##########################################################################
### Table 3: effects of phantom connections on employment and switch  ###
##########################################################################
df <- read.csv(paste0(output, "table_reg_children_panel_employment.csv"))
filename <- paste0(tables, "table_reg_employment_panel_body.tex")
cat(
  " \\\\[-1.8ex] &
  \\multicolumn{3}{c}{Employment} &
  \\multicolumn{3}{c}{Switch}
  \\\\ ",
  " \\\\[-1.8ex] &
  \\multicolumn{1}{c}{(1)} &
  \\multicolumn{1}{c}{(2)} &
  \\multicolumn{1}{c}{(3)} &
  \\multicolumn{1}{c}{(4)} &
  \\multicolumn{1}{c}{(5)} &
  \\multicolumn{1}{c}{(6)}
  \\\\ ",
  "\\hline \\\\[+0.5ex] ",
  
  paste0("Employment share",
         " & ", format(round(100*df[1,"employment_sd"]*df[1,"employment_sep"], 3), nsmall = 3),
         " & ",
         " & ", format(round(100*df[1,"employment_sd"]*df[1,"employment_joint"], 3), nsmall = 3),
         " & ", format(round(100*df[3,"employment_sd"]*df[3,"employment_sep"], 3), nsmall = 3),
         " & ",
         " & ", format(round(100*df[3,"employment_sd"]*df[3,"employment_joint"], 3), nsmall = 3),
         " \\\\[0.2ex]  "),
  paste0(" & ", "(", format(round(100*df[1,"employment_sd"]*df[1,"employment_sep_se"], 3), nsmall = 3), ")",
         " & ",
         " & ", "(", format(round(100*df[1,"employment_sd"]*df[1,"employment_sep_joint"], 3), nsmall = 3), ")",
         " & ", "(", format(round(100*df[3,"employment_sd"]*df[3,"employment_sep_se"], 3), nsmall = 3), ")",
         " & ",
         " & ", "(", format(round(100*df[3,"employment_sd"]*df[3,"employment_sep_joint"], 3), nsmall = 3), ")",
         " \\\\[0.5ex]  "),
  
  paste0("Log contacts",
         " & ",
         " & ", format(round(100*df[1,"log_contacts_sd"]*df[1,"log_contacts_sep"], 3), nsmall = 3),
         " & ", format(round(100*df[1,"log_contacts_sd"]*df[1,"log_contacts_joint"], 3), nsmall = 3),
         " & ",
         " & ", format(round(100*df[3,"log_contacts_sd"]*df[3,"log_contacts_sep"], 3), nsmall = 3),
         " & ", format(round(100*df[3,"log_contacts_sd"]*df[3,"log_contacts_joint"], 3), nsmall = 3),
         " \\\\[0.2ex]  "),
  paste0(" & ",
         " & ", "(", format(round(100*df[1,"log_contacts_sd"]*df[1,"log_contacts_sep_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(100*df[1,"log_contacts_sd"]*df[1,"log_contacts_sep_joint"], 3), nsmall = 3), ")",
         " & ",
         " & ", "(", format(round(100*df[3,"log_contacts_sd"]*df[3,"log_contacts_sep_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(100*df[3,"log_contacts_sd"]*df[3,"log_contacts_sep_joint"], 3), nsmall = 3), ")",
         " \\\\[0.5ex]  "),
  "\\hline \\\\[-1.8ex] ",
  paste0("Observations",
         " & ", format(round(df[1,"obs"], 0), nsmall = 0, big.mark = ","),
         " & ", format(round(df[1,"obs"], 0), nsmall = 0, big.mark = ","),
         " & ", format(round(df[1,"obs"], 0), nsmall = 0, big.mark = ","),
         " & ", format(round(df[3,"obs"], 0), nsmall = 0, big.mark = ","),
         " & ", format(round(df[3,"obs"], 0), nsmall = 0, big.mark = ","),
         " & ", format(round(df[3,"obs"], 0), nsmall = 0, big.mark = ","),
         " \\\\[0.5ex]  "),
  
  file = filename, sep = "\n", append = FALSE)



######################################################################
### Table 4: effects of connections in a firm on salary and duration: multiple types of connections
#######################################################################

df <- read.csv(paste0( output, "table_reg_salary_duration_con_multiple2.csv"))

# Keep only the with-firm-FE rows: log_salary (row 2), duration (row 4), salary_growth3 (row 10)
df <- df[c(2, 4, 10), ]

filename  <- paste0(tables, "table_reg_salary_duration_con_multiple2_body.tex")
cat(
  "\\\\[-1.8ex] &
  \\multicolumn{1}{c}{Log salary} &
  \\multicolumn{1}{c}{Job tenure} &
  \\multicolumn{1}{c}{Salary growth}  \\\\ ",
  " \\\\[-1.8ex] &
    \\multicolumn{1}{c}{(1)} &
    \\multicolumn{1}{c}{(2)} &
    \\multicolumn{1}{c}{(3)}
    \\\\ ",
  "\\hline \\\\[+0.5ex] ",
  paste0( "Phantom: 1" ,
          " & " ,format(round(df[1,"con1"], 3), nsmall = 3),
          " & " ,format(round(df[2,"con1"], 3), nsmall = 3),
          " & " ,format(round(df[3,"con1"], 3), nsmall = 3),
          " \\\\[0.2ex]  "),
  paste0( " & ", "(",format(round(df[1,"con1_se"], 3), nsmall = 3),")",
          " & ", "(",format(round(df[2,"con1_se"], 3), nsmall = 3),")",
          " & ", "(",format(round(df[3,"con1_se"], 3), nsmall = 3),")",
          " \\\\[0.5ex]  "),
  
  paste0( "Phantom: 2" ,
          " & ",format(round(df[1,"con2"], 3), nsmall = 3),
          " & " ,format(round(df[2,"con2"], 3), nsmall = 3),
          " & " ,format(round(df[3,"con2"], 3), nsmall = 3),
          " \\\\[0.2ex]  "),
  paste0( " & ", "(",format(round(df[1,"con2_se"], 3), nsmall = 3),")",
          " & ", "(",format(round(df[2,"con2_se"], 3), nsmall = 3),")",
          " & ", "(",format(round(df[3,"con2_se"], 3), nsmall = 3),")",
          " \\\\[0.5ex]  "),
  paste0( "Phantom: 3+" ,
          " & ",format(round(df[1,"con3"], 3), nsmall = 3),
          " & " ,format(round(df[2,"con3"], 3), nsmall = 3),
          " & " ,format(round(df[3,"con3"], 3), nsmall = 3),
          " \\\\[0.2ex]  "),
  paste0( " & ", "(",format(round(df[1,"con3_se"], 3), nsmall = 3),")",
          " & ", "(",format(round(df[2,"con3_se"], 3), nsmall = 3),")",
          " & ", "(",format(round(df[3,"con3_se"], 3), nsmall = 3),")",
          " \\\\[0.5ex]  "),
  
  paste0( "Weak: 1" ,
          " & " ,format(round(df[1,"con4"], 3), nsmall = 3),
          " & " ,format(round(df[2,"con4"], 3), nsmall = 3),
          " & " ,format(round(df[3,"con4"], 3), nsmall = 3),
          " \\\\[0.2ex]  "),
  paste0( " & ", "(",format(round(df[1,"con4_se"], 3), nsmall = 3),")",
          " & ", "(",format(round(df[2,"con4_se"], 3), nsmall = 3),")",
          " & ", "(",format(round(df[3,"con4_se"], 3), nsmall = 3),")",
          " \\\\[0.5ex]  "),
  
  paste0( "Weak: 2" ,
          " & ",format(round(df[1,"con5"], 3), nsmall = 3),
          " & " ,format(round(df[2,"con5"], 3), nsmall = 3),
          " & " ,format(round(df[3,"con5"], 3), nsmall = 3),
          " \\\\[0.2ex]  "),
  paste0( " & ", "(",format(round(df[1,"con5_se"], 3), nsmall = 3),")",
          " & ", "(",format(round(df[2,"con5_se"], 3), nsmall = 3),")",
          " & ", "(",format(round(df[3,"con5_se"], 3), nsmall = 3),")",
          " \\\\[0.5ex]  "),
  paste0( "Weak: 3+" ,
          " & ",format(round(df[1,"con6"], 3), nsmall = 3),
          " & " ,format(round(df[2,"con6"], 3), nsmall = 3),
          " & " ,format(round(df[3,"con6"], 3), nsmall = 3),
          " \\\\[0.2ex]  "),
  paste0( " & ", "(",format(round(df[1,"con6_se"], 3), nsmall = 3),")",
          " & ", "(",format(round(df[2,"con6_se"], 3), nsmall = 3),")",
          " & ", "(",format(round(df[3,"con6_se"], 3), nsmall = 3),")",
          " \\\\[0.5ex]  "),
  paste0( "Mixed (phantom/weak)" ,
          " & ",format(round(df[1,"con7"], 3), nsmall = 3),
          " & " ,format(round(df[2,"con7"], 3), nsmall = 3),
          " & " ,format(round(df[3,"con7"], 3), nsmall = 3),
          " \\\\[0.2ex]  "),
  paste0( " & ", "(",format(round(df[1,"con7_se"], 3), nsmall = 3),")",
          " & ", "(",format(round(df[2,"con7_se"], 3), nsmall = 3),")",
          " & ", "(",format(round(df[3,"con7_se"], 3), nsmall = 3),")",
          " \\\\[0.5ex]  "),
  paste0( "Strong" ,
          " & ",format(round(df[1,"con8"], 3), nsmall = 3),
          " & " ,format(round(df[2,"con8"], 3), nsmall = 3),
          " & " ,format(round(df[3,"con8"], 3), nsmall = 3),
          " \\\\[0.2ex]  "),
  paste0( " & ", "(",format(round(df[1,"con8_se"], 3), nsmall = 3),")",
          " & ", "(",format(round(df[2,"con8_se"], 3), nsmall = 3),")",
          " & ", "(",format(round(df[3,"con8_se"], 3), nsmall = 3),")",
          " \\\\[0.5ex]  "),
  
  " \\hline \\\\[-1.8ex] ",
  
  paste0( "Diff. weak-phantom: 1" ,
          " & ",format(round(df[1,"diff41"], 3), nsmall = 3),
          " & " ,format(round(df[2,"diff41"], 3), nsmall = 3),
          " & " ,format(round(df[3,"diff41"], 3), nsmall = 3),
          " \\\\[0.2ex]  "),
  paste0( " & ", "(",format(round(df[1,"diff41_se"], 3), nsmall = 3),")",
          " & ", "(",format(round(df[2,"diff41_se"], 3), nsmall = 3),")",
          " & ", "(",format(round(df[3,"diff41_se"], 3), nsmall = 3),")",
          " \\\\[0.5ex]  "),
  paste0( "Diff. weak-phantom: 2" ,
          " & ",format(round(df[1,"diff52"], 3), nsmall = 3),
          " & " ,format(round(df[2,"diff52"], 3), nsmall = 3),
          " & " ,format(round(df[3,"diff52"], 3), nsmall = 3),
          " \\\\[0.2ex]  "),
  paste0( " & ", "(",format(round(df[1,"diff52_se"], 3), nsmall = 3),")",
          " & ", "(",format(round(df[2,"diff52_se"], 3), nsmall = 3),")",
          " & ", "(",format(round(df[3,"diff52_se"], 3), nsmall = 3),")",
          " \\\\[0.5ex]  "),
  paste0( "Diff. weak-phantom: 3+" ,
          " & ",format(round(df[1,"diff63"], 3), nsmall = 3),
          " & " ,format(round(df[2,"diff63"], 3), nsmall = 3),
          " & " ,format(round(df[3,"diff63"], 3), nsmall = 3),
          " \\\\[0.2ex]  "),
  paste0( " & ", "(",format(round(df[1,"diff63_se"], 3), nsmall = 3),")",
          " & ", "(",format(round(df[2,"diff63_se"], 3), nsmall = 3),")",
          " & ", "(",format(round(df[3,"diff63_se"], 3), nsmall = 3),")",
          " \\\\[0.5ex]  "),
  " \\hline \\\\[-1.8ex] ",
  paste0( "Mean (no connections)" ,
          " & ",format(round(df[1,"y0"], 3), nsmall = 3),
          " & ",format(round(df[2,"y0"], 3), nsmall = 3),
          " & ",format(round(df[3,"y0"], 3), nsmall = 3),
          " \\\\[+0.2ex]  "),
  paste0( "Observations" ,
          " & ",format(round(df[1,"obs"], 0), nsmall = 0, big.mark=","),
          " & ",format(round(df[2,"obs"], 0), nsmall = 0, big.mark=","),
          " & ",format(round(df[3,"obs"], 0), nsmall = 0, big.mark=","),
          " \\\\[0.5ex]  "),
  
  file=filename,sep="\n",append=FALSE)


##################################################################
### Table 5: total salary outcomes  ###
##################################################################

df <- read.csv(paste0(output, "table_reg_salary_subs_5years_multiple2.csv"))

df_filtered <- df[df$fe == 2 & df$var %in% c("log_discounted_salary", "log_yearly_salary_subs"), ]

df_disc   <- df_filtered[df_filtered$var == "log_discounted_salary", ]
df_yearly <- df_filtered[df_filtered$var == "log_yearly_salary_subs", ]

df_table <- rbind(df_disc, df_yearly)

filename <- paste0(tables, "table_reg_salary_subs_5years_multiple2_body.tex")
cat(
  "\\\\[-1.8ex] &
  \\multicolumn{1}{c}{Log discounted salary} &
  \\multicolumn{1}{c}{Log salary (subsequent)}  \\\\ ",
  " \\\\[-1.8ex] &
    \\multicolumn{1}{c}{(1)} &
    \\multicolumn{1}{c}{(2)}
    \\\\ ",
  "\\hline \\\\[+0.5ex] ",
  paste0("Phantom: 1",
         " & ", format(round(df_table[1,"con1"], 3), nsmall = 3),
         " & ", format(round(df_table[2,"con1"], 3), nsmall = 3),
         " \\\\[0.2ex]  "),
  paste0(" & ", "(", format(round(df_table[1,"con1_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_table[2,"con1_se"], 3), nsmall = 3), ")",
         " \\\\[0.5ex]  "),
  
  paste0("Phantom: 2",
         " & ", format(round(df_table[1,"con2"], 3), nsmall = 3),
         " & ", format(round(df_table[2,"con2"], 3), nsmall = 3),
         " \\\\[0.2ex]  "),
  paste0(" & ", "(", format(round(df_table[1,"con2_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_table[2,"con2_se"], 3), nsmall = 3), ")",
         " \\\\[0.5ex]  "),
  
  paste0("Phantom: 3+",
         " & ", format(round(df_table[1,"con3"], 3), nsmall = 3),
         " & ", format(round(df_table[2,"con3"], 3), nsmall = 3),
         " \\\\[0.2ex]  "),
  paste0(" & ", "(", format(round(df_table[1,"con3_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_table[2,"con3_se"], 3), nsmall = 3), ")",
         " \\\\[0.5ex]  "),
  
  paste0("Weak: 1",
         " & ", format(round(df_table[1,"con4"], 3), nsmall = 3),
         " & ", format(round(df_table[2,"con4"], 3), nsmall = 3),
         " \\\\[0.2ex]  "),
  paste0(" & ", "(", format(round(df_table[1,"con4_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_table[2,"con4_se"], 3), nsmall = 3), ")",
         " \\\\[0.5ex]  "),
  
  paste0("Weak: 2",
         " & ", format(round(df_table[1,"con5"], 3), nsmall = 3),
         " & ", format(round(df_table[2,"con5"], 3), nsmall = 3),
         " \\\\[0.2ex]  "),
  paste0(" & ", "(", format(round(df_table[1,"con5_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_table[2,"con5_se"], 3), nsmall = 3), ")",
         " \\\\[0.5ex]  "),
  
  paste0("Weak: 3+",
         " & ", format(round(df_table[1,"con6"], 3), nsmall = 3),
         " & ", format(round(df_table[2,"con6"], 3), nsmall = 3),
         " \\\\[0.2ex]  "),
  paste0(" & ", "(", format(round(df_table[1,"con6_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_table[2,"con6_se"], 3), nsmall = 3), ")",
         " \\\\[0.5ex]  "),
  
  paste0("Mixed (phantom/weak)",
         " & ", format(round(df_table[1,"con7"], 3), nsmall = 3),
         " & ", format(round(df_table[2,"con7"], 3), nsmall = 3),
         " \\\\[0.2ex]  "),
  paste0(" & ", "(", format(round(df_table[1,"con7_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_table[2,"con7_se"], 3), nsmall = 3), ")",
         " \\\\[0.5ex]  "),
  
  paste0("Strong",
         " & ", format(round(df_table[1,"con8"], 3), nsmall = 3),
         " & ", format(round(df_table[2,"con8"], 3), nsmall = 3),
         " \\\\[0.2ex]  "),
  paste0(" & ", "(", format(round(df_table[1,"con8_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_table[2,"con8_se"], 3), nsmall = 3), ")",
         " \\\\[0.5ex]  "),
  
  " \\hline \\\\[-1.8ex] ",
  
  paste0("Diff. weak-phantom: 1",
         " & ", format(round(df_table[1,"diff41"], 3), nsmall = 3),
         " & ", format(round(df_table[2,"diff41"], 3), nsmall = 3),
         " \\\\[0.2ex]  "),
  paste0(" & ", "(", format(round(df_table[1,"diff41_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_table[2,"diff41_se"], 3), nsmall = 3), ")",
         " \\\\[0.5ex]  "),
  
  paste0("Diff. weak-phantom: 2",
         " & ", format(round(df_table[1,"diff52"], 3), nsmall = 3),
         " & ", format(round(df_table[2,"diff52"], 3), nsmall = 3),
         " \\\\[0.2ex]  "),
  paste0(" & ", "(", format(round(df_table[1,"diff52_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_table[2,"diff52_se"], 3), nsmall = 3), ")",
         " \\\\[0.5ex]  "),
  
  paste0("Diff. weak-phantom: 3+",
         " & ", format(round(df_table[1,"diff63"], 3), nsmall = 3),
         " & ", format(round(df_table[2,"diff63"], 3), nsmall = 3),
         " \\\\[0.2ex]  "),
  paste0(" & ", "(", format(round(df_table[1,"diff63_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_table[2,"diff63_se"], 3), nsmall = 3), ")",
         " \\\\[0.5ex]  "),
  
  " \\hline \\\\[-1.8ex] ",
  paste0("Mean (no connections)",
         " & ", format(round(df_table[1,"y0"], 3), nsmall = 3),
         " & ", format(round(df_table[2,"y0"], 3), nsmall = 3),
         " \\\\[+0.2ex]  "),
  
  paste0("Observations",
         " & ", format(round(df_table[1,"obs"], 0), nsmall = 0, big.mark = ","),
         " & ", format(round(df_table[2,"obs"], 0), nsmall = 0, big.mark = ","),
         " \\\\[0.5ex]  "),
  
  file = filename, sep = "\n", append = FALSE)

print("Salary subs table created successfully!")


################################
### Table A1: summary firms  ###
################################
df <- read.csv(paste0( output, "table_summary_firms.csv"))

filename  <- paste0(tables, "table_summary_firms_body.tex")
cat("\\\\[-1.8ex]  & \\multicolumn{1}{c}{1-4} & \\multicolumn{1}{c}{5-500} &
    \\multicolumn{1}{c}{501+}  \\\\ ",
    "\\hline \\\\[+0.5ex] ",
    paste0( "Firms" ,
            " & " ,format(round(df[1,"firms"], 0), nsmall = 0 , big.mark = ","),
            " & " ,format(round(df[2,"firms"], 0), nsmall = 0, big.mark = ","),
            " & " ,format(round(df[3,"firms"], 0), nsmall = 0, big.mark = ","),
            " \\\\[0.5ex]  "),
    paste0( "Workers" ,
            " & " ,format(round(df[1,"workers"], 0), nsmall = 0, big.mark = ","),
            " & " ,format(round(df[2,"workers"], 0), nsmall = 0, big.mark = ","),
            " & " ,format(round(df[3,"workers"], 0), nsmall = 0, big.mark = ","),
            " \\\\[0.5ex]  "),
    paste0( "Av. firm size" ,
            " & " ,format(round(df[1,"firm_size"], 2), nsmall = 0),
            " & " ,format(round(df[2,"firm_size"], 2), nsmall = 0),
            " & " ,format(round(df[3,"firm_size"], 2), nsmall = 0),
            " \\\\[0.5ex]  "),
    paste0( "Share of firms" ,
            " & " ,format(round(df[1,"share_firms"], 3), nsmall = 3),
            " & " ,format(round(df[2,"share_firms"], 3), nsmall = 3),
            " & " ,format(round(df[3,"share_firms"], 3), nsmall = 3),
            " \\\\[0.5ex]  "),
    paste0( "Share of workers" ,
            " & " ,format(round(df[1,"share_workers"], 3), nsmall = 3),
            " & " ,format(round(df[2,"share_workers"], 3), nsmall = 3),
            " & " ,format(round(df[3,"share_workers"], 3), nsmall = 3),
            " \\\\[2.5ex]  "),
    file=filename,sep="\n",append=FALSE)




#########################################################################################
### Table A2: effects of connections on employment: full results of the event study  ###
#########################################################################################
df <- read.csv(paste0( output, "figure_reg_emp_con_event.csv"))

filename  <- paste0(tables, "table_reg_emp_con_event_full_body.tex")
cat(
  "\\\\[-1.8ex]
  \\multicolumn{4}{c}{Employment}
  \\\\ ",
  "\\hline \\\\[+0.5ex] ",
  paste0( "Phantom connections & & Weak connections &  \\\\[1.5ex]"),
  paste0( "\\quad -5" ,
          " & ",
          format(round(df[1,"con1m5"], 3), nsmall = 3),
          "& " ,
          "\\quad 0" ,
          " & ",format(round(df[1,"con2p0"], 3), nsmall = 3),
          " \\\\[0.2ex]  "),

  paste0(
    " & ",
    "(",format(round(df[1,"con1m5_sd"], 3), nsmall = 3),")",
    " & &",
    "(",format(round(df[1,"con2p0_sd"], 3), nsmall = 3),")",
    " \\\\[0.5ex]  "),

  paste0( "\\quad -4" ,
          " & ",
          format(round(df[1,"con1m4"], 3), nsmall = 3),
          "& " ,
          "\\quad 1" ,
          " & ",format(round(df[1,"con2p1"], 3), nsmall = 3),
          " \\\\[0.2ex]  "),

  paste0(
    " & ",
    "(",format(round(df[1,"con1m4_sd"], 3), nsmall = 3),")",
    " & &",
    "(",format(round(df[1,"con2p1_sd"], 3), nsmall = 3),")",
    " \\\\[0.5ex]  "),

  paste0( "\\quad -3" ,
          " & ",
          format(round(df[1,"con1m3"], 3), nsmall = 3),
          "& " ,
          "\\quad 2" ,
          " & ",format(round(df[1,"con2p2"], 3), nsmall = 3),
          " \\\\[0.2ex]  "),

  paste0(
    " & ",
    "(",format(round(df[1,"con1m3_sd"], 3), nsmall = 3),")",
    " & &",
    "(",format(round(df[1,"con2p2_sd"], 3), nsmall = 3),")",
    " \\\\[0.5ex]  "),

  paste0( "\\quad -2" ,
          " & ",
          format(round(df[1,"con1m2"], 3), nsmall = 3),
          "& " ,
          "\\quad 3" ,
          " & ",format(round(df[1,"con2p3"], 3), nsmall = 3),
          " \\\\[0.2ex]  "),

  paste0(
    " & ",
    "(",format(round(df[1,"con1m2_sd"], 3), nsmall = 3),")",
    " & &",
    "(",format(round(df[1,"con2p3_sd"], 3), nsmall = 3),")",
    " \\\\[0.5ex]  "),

  paste0( "\\quad -1" ,
          " & ",
          format(round(df[1,"con1m1"], 3), nsmall = 3),
          "& " ,
          "\\quad 4" ,
          " & ",format(round(df[1,"con2p4"], 3), nsmall = 3),
          " \\\\[0.2ex]  "),

  paste0(
    " & ",
    "(",format(round(df[1,"con1m1_sd"], 3), nsmall = 3),")",
    " & &",
    "(",format(round(df[1,"con2p4_sd"], 3), nsmall = 3),")",
    " \\\\[0.5ex]  "),

  paste0( "\\quad 1" ,
          " & ",
          format(round(df[1,"con1p1"], 3), nsmall = 3),
          "& " ,
          "\\quad 5" ,
          " & ",format(round(df[1,"con2p5"], 3), nsmall = 3),
          " \\\\[0.2ex]  "),

  paste0(
    " & ",
    "(",format(round(df[1,"con1p1_sd"], 3), nsmall = 3),")",
    " & &",
    "(",format(round(df[1,"con2p5_sd"], 3), nsmall = 3),")",
    " \\\\[0.5ex]  "),

  paste0( "\\quad 2" ,
          " & ",
          format(round(df[1,"con1p2"], 3), nsmall = 3),
          "& " ,
          "Other connections" ,
          " & ",
          " \\\\[0.2ex]  "),

  paste0(
    " & ",
    "(",format(round(df[1,"con1p2_sd"], 3), nsmall = 3),")",
    " & & ",
    " \\\\[0.5ex]  "),

  paste0( "\\quad 3" ,
          " & ",
          format(round(df[1,"con1p3"], 3), nsmall = 3),
          "& " ,
          " & ",format(round(df[1,"con3"], 3), nsmall = 3),
          " \\\\[0.2ex]  "),

  paste0(
    " & ",
    "(",format(round(df[1,"con1p3_sd"], 3), nsmall = 3),")",
    " & &",
    "(",format(round(df[1,"con3_sd"], 3), nsmall = 3),")",
    " \\\\[0.5ex]  "),

  paste0( "\\quad 4" ,
          " & ",
          format(round(df[1,"con1p4"], 3), nsmall = 3),
          "& &  \\\\[0.2ex]  "),

  paste0(
    " & ",
    "(",format(round(df[1,"con1p4_sd"], 3), nsmall = 3),")",
    " & & ",
    " \\\\[0.5ex]  "),

  paste0( "\\quad 5" ,
          " & ",
          format(round(df[1,"con1p5"], 3), nsmall = 3),
          "& & " ,
          " \\\\[0.2ex]  "),

  paste0(
    " & ",
    "(",format(round(df[1,"con1p5_sd"], 3), nsmall = 3),")",
    " & &",
    " \\\\[0.5ex]  "),

  file=filename,sep="\n",append=FALSE)


##################################################################
### Table A3: Employment effects by firm size ###
##################################################################

df <- read.csv(paste0(output, "table_reg_emp_con_multiple2_firm_size.csv"))

df <- df[2:5, ]

filename <- paste0(tables, "table_reg_emp_con_multiple2_firm_size_body.tex")
cat(
  " \\\\[-1.8ex] &
    \\multicolumn{2}{c}{Past firm size} &
    \\multicolumn{2}{c}{Current firm size}  \\\\ ",
  " \\\\[-1.8ex] &
    \\multicolumn{1}{c}{Small} &
    \\multicolumn{1}{c}{Large} &
    \\multicolumn{1}{c}{Small} &
    \\multicolumn{1}{c}{Large}
    \\\\ ",
  " \\\\[-1.8ex] &
    \\multicolumn{1}{c}{(1)} &
    \\multicolumn{1}{c}{(2)} &
    \\multicolumn{1}{c}{(3)} &
    \\multicolumn{1}{c}{(4)}
    \\\\ ",
  "\\hline \\\\[+0.5ex] ",
  
  paste0("Phantom: 1",
         " & ", format(round(df[1,"con1"], 3), nsmall = 3),
         " & ", format(round(df[2,"con1"], 3), nsmall = 3),
         " & ", format(round(df[3,"con1"], 3), nsmall = 3),
         " & ", format(round(df[4,"con1"], 3), nsmall = 3),
         " \\\\[0.2ex]  "),
  paste0(" & ", "(", format(round(df[1,"con1_sd"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df[2,"con1_sd"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df[3,"con1_sd"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df[4,"con1_sd"], 3), nsmall = 3), ")",
         " \\\\[0.5ex]  "),
  
  paste0("Phantom: 2",
         " & ", format(round(df[1,"con2"], 3), nsmall = 3),
         " & ", format(round(df[2,"con2"], 3), nsmall = 3),
         " & ", format(round(df[3,"con2"], 3), nsmall = 3),
         " & ", format(round(df[4,"con2"], 3), nsmall = 3),
         " \\\\[0.2ex]  "),
  paste0(" & ", "(", format(round(df[1,"con2_sd"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df[2,"con2_sd"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df[3,"con2_sd"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df[4,"con2_sd"], 3), nsmall = 3), ")",
         " \\\\[0.5ex]  "),
  
  paste0("Phantom: 3+",
         " & ", format(round(df[1,"con3"], 3), nsmall = 3),
         " & ", format(round(df[2,"con3"], 3), nsmall = 3),
         " & ", format(round(df[3,"con3"], 3), nsmall = 3),
         " & ", format(round(df[4,"con3"], 3), nsmall = 3),
         " \\\\[0.2ex]  "),
  paste0(" & ", "(", format(round(df[1,"con3_sd"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df[2,"con3_sd"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df[3,"con3_sd"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df[4,"con3_sd"], 3), nsmall = 3), ")",
         " \\\\[0.5ex]  "),
  
  paste0("Weak: 1",
         " & ", format(round(df[1,"con4"], 3), nsmall = 3),
         " & ", format(round(df[2,"con4"], 3), nsmall = 3),
         " & ", format(round(df[3,"con4"], 3), nsmall = 3),
         " & ", format(round(df[4,"con4"], 3), nsmall = 3),
         " \\\\[0.2ex]  "),
  paste0(" & ", "(", format(round(df[1,"con4_sd"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df[2,"con4_sd"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df[3,"con4_sd"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df[4,"con4_sd"], 3), nsmall = 3), ")",
         " \\\\[0.5ex]  "),
  
  paste0("Weak: 2",
         " & ", format(round(df[1,"con5"], 3), nsmall = 3),
         " & ", format(round(df[2,"con5"], 3), nsmall = 3),
         " & ", format(round(df[3,"con5"], 3), nsmall = 3),
         " & ", format(round(df[4,"con5"], 3), nsmall = 3),
         " \\\\[0.2ex]  "),
  paste0(" & ", "(", format(round(df[1,"con5_sd"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df[2,"con5_sd"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df[3,"con5_sd"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df[4,"con5_sd"], 3), nsmall = 3), ")",
         " \\\\[0.5ex]  "),
  
  paste0("Weak: 3+",
         " & ", format(round(df[1,"con6"], 3), nsmall = 3),
         " & ", format(round(df[2,"con6"], 3), nsmall = 3),
         " & ", format(round(df[3,"con6"], 3), nsmall = 3),
         " & ", format(round(df[4,"con6"], 3), nsmall = 3),
         " \\\\[0.2ex]  "),
  paste0(" & ", "(", format(round(df[1,"con6_sd"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df[2,"con6_sd"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df[3,"con6_sd"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df[4,"con6_sd"], 3), nsmall = 3), ")",
         " \\\\[0.5ex]  "),
  
  paste0("Mixed (phantom/weak)",
         " & ", format(round(df[1,"con7"], 3), nsmall = 3),
         " & ", format(round(df[2,"con7"], 3), nsmall = 3),
         " & ", format(round(df[3,"con7"], 3), nsmall = 3),
         " & ", format(round(df[4,"con7"], 3), nsmall = 3),
         " \\\\[0.2ex]  "),
  paste0(" & ", "(", format(round(df[1,"con7_sd"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df[2,"con7_sd"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df[3,"con7_sd"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df[4,"con7_sd"], 3), nsmall = 3), ")",
         " \\\\[0.5ex]  "),
  
  paste0("Strong",
         " & ", format(round(df[1,"con8"], 3), nsmall = 3),
         " & ", format(round(df[2,"con8"], 3), nsmall = 3),
         " & ", format(round(df[3,"con8"], 3), nsmall = 3),
         " & ", format(round(df[4,"con8"], 3), nsmall = 3),
         " \\\\[0.2ex]  "),
  paste0(" & ", "(", format(round(df[1,"con8_sd"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df[2,"con8_sd"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df[3,"con8_sd"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df[4,"con8_sd"], 3), nsmall = 3), ")",
         " \\\\[0.5ex]  "),
  
  " \\hline \\\\[-1.8ex] ",
  
  paste0("Diff. weak-phantom: 1",
         " & ", format(round(df[1,"diff41"], 3), nsmall = 3),
         " & ", format(round(df[2,"diff41"], 3), nsmall = 3),
         " & ", format(round(df[3,"diff41"], 3), nsmall = 3),
         " & ", format(round(df[4,"diff41"], 3), nsmall = 3),
         " \\\\[+0.2ex]  "),
  paste0(" & ", "(", format(round(df[1,"diff41_sd"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df[2,"diff41_sd"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df[3,"diff41_sd"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df[4,"diff41_sd"], 3), nsmall = 3), ")",
         " \\\\[+0.5ex]  "),
  
  paste0("Diff. weak-phantom: 2",
         " & ", format(round(df[1,"diff52"], 3), digits = 4),
         " & ", format(round(df[2,"diff52"], 3), digits = 4),
         " & ", format(round(df[3,"diff52"], 3), digits = 4),
         " & ", format(round(df[4,"diff52"], 3), digits = 4),
         " \\\\[+0.2ex]  "),
  paste0(" & ", "(", format(round(df[1,"diff52_sd"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df[2,"diff52_sd"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df[3,"diff52_sd"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df[4,"diff52_sd"], 3), nsmall = 3), ")",
         " \\\\[+0.5ex]  "),
  
  paste0("Diff. weak-phantom: 3+",
         " & ", format(round(df[1,"diff63"], 3), digits = 4),
         " & ", format(round(df[2,"diff63"], 3), digits = 4),
         " & ", format(round(df[3,"diff63"], 3), digits = 4),
         " & ", format(round(df[4,"diff63"], 3), digits = 4),
         " \\\\[+0.2ex]  "),
  paste0(" & ", "(", format(round(df[1,"diff63_sd"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df[2,"diff63_sd"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df[3,"diff63_sd"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df[4,"diff63_sd"], 3), nsmall = 3), ")",
         " \\\\[+0.5ex]  "),
  
  " \\hline \\\\[-1.8ex] ",
  
  paste0("Observations",
         " & ", format(round(df[1,"obs"], 0), nsmall = 0, big.mark = ","),
         " & ", format(round(df[2,"obs"], 0), nsmall = 0, big.mark = ","),
         " & ", format(round(df[3,"obs"], 0), nsmall = 0, big.mark = ","),
         " & ", format(round(df[4,"obs"], 0), nsmall = 0, big.mark = ","),
         " \\\\[0.5ex]  "),
  
  file = filename, sep = "\n", append = FALSE)

print("Firm size employment table created successfully!")


##################################
### Table A4: balancing check  ###
##################################

df <- read.csv(paste0( output, "table_reg_balancing.csv"))


filename  <- paste0(tables, "table_reg_balancing_body.tex")
cat(
  " \\\\[-1.8ex] &
  \\multicolumn{1}{c}{Log distance} &
  \\multicolumn{1}{c}{Parent's industry}
  \\\\ ",
  " \\\\[-1.8ex] &
  \\multicolumn{1}{c}{(1)} &
  \\multicolumn{1}{c}{(2)}
  \\\\ ",
  "\\hline \\\\[+0.5ex] ",
  paste0( "Phantom connections" ,
          " & ",format(round(df[1,"con1"], 3), nsmall = 3),
          " & " ,format(round(df[2,"con1"], 3), nsmall = 3),
          " \\\\[0.2ex]  "),
  paste0(
    " & ", "(",format(round(df[1,"con1_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[2,"con1_sd"], 3), nsmall = 3),")",
    " \\\\[0.5ex]  "),
  paste0( "Weak connections" ,
          " & ",format(round(df[1,"con2"], 3), nsmall = 3),
          " & " ,format(round(df[2,"con2"], 3), nsmall = 3),
          " \\\\[0.2ex]  "),
  paste0(
    " & ", "(",format(round(df[1,"con2_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[2,"con2_sd"], 3), nsmall = 3),")",
    " \\\\[0.5ex]  "),
  paste0( "Other connections" ,
          " & ",format(round(df[1,"con3"], 3), nsmall = 3),
          " & " ,format(round(df[2,"con3"], 3), nsmall = 3),
          " \\\\[0.2ex]  "),
  paste0(
    " & ", "(",format(round(df[1,"con3_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[2,"con3_sd"], 3), nsmall = 3),")",
    " \\\\[+0.5ex]  "),
  
  " \\hline \\\\[-1.8ex] ",
  
  paste0( "Diff. weak-phantom" ,
          " & ",format(round(df[1,"diff21"], 3), nsmall = 3),
          " & ",format(round(df[2,"diff21"], 3), nsmall = 3),
          " \\\\[+0.2ex]  "),
  paste0(
    " & ", "(",format(round(df[1,"diff21_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[2,"diff21_sd"], 3), nsmall = 3),")",
    " \\\\[+0.5ex]  "),
  
  
  " \\hline \\\\[-1.8ex] ",
  
  paste0( "R0 (no connections)" ,
          " & ",format(round(df[1,"est0"], 3), nsmall = 3),
          " & ",format(round(df[2,"est0"], 3), nsmall = 3),
          " \\\\[+0.2ex]  "),
  paste0(
    " & ", "(",format(round(df[1,"est0_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[2,"est0_sd"], 3), nsmall = 3),")",
    " \\\\[+0.5ex]  "),
  paste0( "Ratio weak-phantom" ,
          " & ",format(round(df[1,"ratio21"], 3), nsmall = 3),
          " & ",format(round(df[2,"ratio21"], 3), nsmall = 3),
          " \\\\[+0.2ex]  "),
  paste0(
    " & ", "(",format(round(df[1,"ratio21_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[2,"ratio21_sd"], 3), nsmall = 3),")",
    " \\\\[+0.5ex]  "),
  " \\hline \\\\[-1.8ex] ",
  paste0( "Observations (firms x groups)" ,
          " & ",format(round(df[1,"obs"], 0), nsmall = 0, big.mark=","),
          " & ",format(round(df[2,"obs"], 0), nsmall = 0, big.mark=","),
          " \\\\[0.5ex]  "),
  paste0( "N firms" ,
          " & ",format(round(df[1,"firms"], 0), nsmall = 0, big.mark=","),
          " & ",format(round(df[2,"firms"], 0), nsmall = 0, big.mark=","),
          " \\\\[0.5ex]  "),
  paste0( "N groups" ,
          " & ",format(round(df[1,"groups"], 0), nsmall = 0, big.mark=","),
          " & ",format(round(df[2,"groups"], 0), nsmall = 0, big.mark=","),
          " \\\\[0.5ex]  "),
  paste0( "N workers" ,
          " & ",format(round(df[1,"workers"], 0), nsmall = 0, big.mark=","),
          " & ",format(round(df[2,"workers"], 0), nsmall = 0, big.mark=","),
          " \\\\[0.5ex]  "),
  # paste0( "N connections" ,
  #         " & ",format(round(df[1,"connections"], 0), nsmall = 0, big.mark=","),
  #         " & ",format(round(df[2,"connections"], 0), nsmall = 0, big.mark=","),
  #         " \\\\[0.5ex]  "),
  file=filename,sep="\n",append=FALSE)

########################################################################
### Table A5: effects of connections on employment: types of exits  ###
########################################################################

df <- read.csv(paste0( output, "table_reg_emp_con_exit.csv"))


filename  <- paste0(tables, "table_reg_emp_con_exit_body.tex")
cat(
  
  " \\\\[-1.8ex] &
  \\multicolumn{3}{c}{Employment}
  \\\\ ",
  " \\\\[-1.8ex] &
  \\multicolumn{1}{c}{(1)} &
  \\multicolumn{1}{c}{(2)} &
  \\multicolumn{1}{c}{(3)}
  \\\\ ",
  
  " \\\\[-1.8ex] Special connections: &
  \\multicolumn{1}{c}{Death} &
  \\multicolumn{1}{c}{Retirement} &
  \\multicolumn{1}{c}{Death or retirement}
  \\\\[+0.5ex] ",
  
  "\\hline \\\\[+0.2ex] ",
  
  paste0( "Phantom (D/R)" ,
          " & ",format(round(df[1,"con11"], 3), nsmall = 3),
          " & " ,format(round(df[2,"con11"], 3), nsmall = 3),
          " & " ,format(round(df[3,"con11"], 3), nsmall = 3),
          " \\\\[0.2ex]  "),
  paste0(
    " & ", "(",format(round(df[1,"con11_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[2,"con11_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[3,"con11_sd"], 3), nsmall = 3),")",
    " \\\\[0.5ex]  "),
  paste0( "Phantom (non-D/R)" ,
          " & ",format(round(df[1,"con10"], 3), nsmall = 3),
          " & " ,format(round(df[2,"con10"], 3), nsmall = 3),
          " & " ,format(round(df[3,"con10"], 3), nsmall = 3),
          " \\\\[0.2ex]  "),
  paste0(
    " & ", "(",format(round(df[1,"con10_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[2,"con10_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[3,"con10_sd"], 3), nsmall = 3),")",
    " \\\\[0.5ex]  "),
  paste0( "Weak (D/R)" ,
          " & ",format(round(df[1,"con21"], 3), nsmall = 3),
          " & " ,format(round(df[2,"con21"], 3), nsmall = 3),
          " & " ,format(round(df[3,"con21"], 3), nsmall = 3),
          " \\\\[0.2ex]  "),
  paste0(
    " & ", "(",format(round(df[1,"con21_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[2,"con21_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[3,"con21_sd"], 3), nsmall = 3),")",
    " \\\\[0.5ex]  "),
  paste0( "Weak (non-D/R)" ,
          " & ",format(round(df[1,"con20"], 3), nsmall = 3),
          " & " ,format(round(df[2,"con20"], 3), nsmall = 3),
          " & " ,format(round(df[3,"con20"], 3), nsmall = 3),
          " \\\\[0.2ex]  "),
  paste0(
    " & ", "(",format(round(df[1,"con20_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[2,"con20_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[3,"con20_sd"], 3), nsmall = 3),")",
    " \\\\[0.5ex]  "),
  paste0( "Other" ,
          " & ",format(round(df[1,"con3"], 3), nsmall = 3),
          " & " ,format(round(df[2,"con3"], 3), nsmall = 3),
          " & " ,format(round(df[3,"con3"], 3), nsmall = 3),
          " \\\\[0.2ex]  "),
  paste0(
    " & ", "(",format(round(df[1,"con3_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[2,"con3_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[3,"con3_sd"], 3), nsmall = 3),")",
    " \\\\[0.5ex]  "),
  " \\hline \\\\[-1.8ex] ",
  paste0( "R0 (no connections)" ,
          " & ",format(round(df[1,"est0"], 3), nsmall = 3),
          " & ",format(round(df[2,"est0"], 3), nsmall = 3),
          " & ",format(round(df[3,"est0"], 3), nsmall = 3),
          " \\\\[+0.2ex]  "),
  paste0(
    " & ", "(",format(round(df[1,"est0_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[2,"est0_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[3,"est0_sd"], 3), nsmall = 3),")",
    " \\\\[+0.5ex]  "),
  
  paste0( "Ratio weak-phantom (D/R)" ,
          " & ",format(round(df[1,"ratio211"], 3), nsmall = 3),
          " & ",format(round(df[2,"ratio211"], 3), nsmall = 3),
          " & ",format(round(df[3,"ratio211"], 3), nsmall = 3),
          " \\\\[+0.2ex]  "),
  paste0(
    " & ", "(",format(round(df[1,"ratio211_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[2,"ratio211_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[3,"ratio211_sd"], 3), nsmall = 3),")",
    " \\\\[+0.5ex]  "),
  paste0( "Ratio weak-phantom (non-D/R)" ,
          " & ",format(round(df[1,"ratio210"], 3), nsmall = 3),
          " & ",format(round(df[2,"ratio210"], 3), nsmall = 3),
          " & ",format(round(df[3,"ratio210"], 3), nsmall = 3),
          " \\\\[+0.2ex]  "),
  paste0(
    " & ", "(",format(round(df[1,"ratio210_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[2,"ratio210_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[3,"ratio210_sd"], 3), nsmall = 3),")",
    " \\\\[+0.5ex]  "),
  " \\hline \\\\[-1.8ex] ",
  paste0( "N connections: phantom (D/R)" ,
          " & ",format(round(df[1,"connections_11"], 0), nsmall = 0, big.mark=","),
          " & ",format(round(df[2,"connections_11"], 0), nsmall = 0, big.mark=","),
          " & ",format(round(df[3,"connections_11"], 0), nsmall = 0, big.mark=","),
          " \\\\[0.5ex]  "),
  paste0( "N connections: weak (D/R)" ,
          " & ",format(round(df[1,"connections_21"], 0), nsmall = 0, big.mark=","),
          " & ",format(round(df[2,"connections_21"], 0), nsmall = 0, big.mark=","),
          " & ",format(round(df[3,"connections_21"], 0), nsmall = 0, big.mark=","),
          " \\\\[0.5ex]  "),
  file=filename,sep="\n",append=FALSE)




######################################################################
### Table A6: effects of connections on employment : placebo test  ###
######################################################################
df <- read.csv(paste0( output, "table_reg_emp_con_placebo.csv"))


filename  <- paste0(tables, "table_reg_emp_con_placebo_body.tex")
cat(
  " \\\\[-1.8ex] &
  \\multicolumn{1}{c}{All} &
  \\multicolumn{1}{c}{Jews} &
  \\multicolumn{1}{c}{Arabs} &
  \\multicolumn{1}{c}{Males} &
  \\multicolumn{1}{c}{Females}
  \\\\ ",
  " \\\\[-1.8ex] &
  \\multicolumn{1}{c}{(1)} &
  \\multicolumn{1}{c}{(2)} &
  \\multicolumn{1}{c}{(3)} &
  \\multicolumn{1}{c}{(4)} &
  \\multicolumn{1}{c}{(5)}
  \\\\ ",
  "\\hline \\\\[+0.5ex] ",
  paste0( "Phantom connections" ,
          " & ",format(round(df[1,"con1"], 3), nsmall = 3),
          " & " ,format(round(df[2,"con1"], 3), nsmall = 3),
          " & " ,format(round(df[3,"con1"], 3), nsmall = 3),
          " & " ,format(round(df[4,"con1"], 3), nsmall = 3),
          " & " ,format(round(df[5,"con1"], 3), nsmall = 3),
          " \\\\[0.2ex]  "),
  paste0(
    " & ", "(",format(round(df[1,"con1_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[2,"con1_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[3,"con1_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[4,"con1_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[5,"con1_sd"], 3), nsmall = 3),")",
    " \\\\[0.5ex]  "),
  paste0( "Weak connections" ,
          " & ",format(round(df[1,"con2"], 3), nsmall = 3),
          " & " ,format(round(df[2,"con2"], 3), nsmall = 3),
          " & " ,format(round(df[3,"con2"], 3), nsmall = 3),
          " & " ,format(round(df[4,"con2"], 3), nsmall = 3),
          " & " ,format(round(df[5,"con2"], 3), nsmall = 3),
          " \\\\[0.2ex]  "),
  paste0(
    " & ", "(",format(round(df[1,"con2_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[2,"con2_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[3,"con2_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[4,"con2_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[5,"con2_sd"], 3), nsmall = 3),")",
    " \\\\[0.5ex]  "),
  paste0( "Other connections" ,
          " & ",format(round(df[1,"con3"], 3), nsmall = 3),
          " & " ,format(round(df[2,"con3"], 3), nsmall = 3),
          " & " ,format(round(df[3,"con3"], 3), nsmall = 3),
          " & " ,format(round(df[4,"con3"], 3), nsmall = 3),
          " & " ,format(round(df[5,"con3"], 3), nsmall = 3),
          " \\\\[0.2ex]  "),
  paste0(
    " & ", "(",format(round(df[1,"con3_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[2,"con3_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[3,"con3_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[4,"con3_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[5,"con3_sd"], 3), nsmall = 3),")",
    " \\\\[0.5ex]  "),
  
  " \\hline \\\\[-1.8ex] ",
  
  paste0( "Diff. weak-phantom" ,
          " & ",format(round(df[1,"diff21"], 3), nsmall = 3),
          " & ",format(round(df[2,"diff21"], 3), nsmall = 3),
          " & ",format(round(df[3,"diff21"], 3), nsmall = 3),
          " & ",format(round(df[4,"diff21"], 3), nsmall = 3),
          " & ",format(round(df[5,"diff21"], 3), nsmall = 3),
          " \\\\[+0.2ex]  "),
  paste0(
    " & ", "(",format(round(df[1,"diff21_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[2,"diff21_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[3,"diff21_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[4,"diff21_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[5,"diff21_sd"], 3), nsmall = 3),")",
    
    " \\\\[+0.5ex]  "),
  
  " \\hline \\\\[-1.8ex] ",
  paste0( "R0 (no connections)" ,
          " & ",format(round(df[1,"est0"], 3), nsmall = 3),
          " & ",format(round(df[2,"est0"], 3), nsmall = 3),
          " & ",format(round(df[3,"est0"], 3), nsmall = 3),
          " & ",format(round(df[4,"est0"], 3), nsmall = 3),
          " & ",format(round(df[5,"est0"], 3), nsmall = 3),
          " \\\\[+0.2ex]  "),
  paste0(
    " & ", "(",format(round(df[1,"est0_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[2,"est0_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[3,"est0_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[4,"est0_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[5,"est0_sd"], 3), nsmall = 3),")",
    " \\\\[+0.5ex]  "),

  paste0( "Ratio weak-phantom" ,
          " & ",format(round(df[1,"ratio21"], 3), nsmall = 3),
          " & ",format(round(df[2,"ratio21"], 3), nsmall = 3),
          " & ",format(round(df[3,"ratio21"], 3), nsmall = 3),
          " & ",format(round(df[4,"ratio21"], 3), nsmall = 3),
          " & ",format(round(df[5,"ratio21"], 3), nsmall = 3),
          " \\\\[+0.2ex]  "),
  paste0(
    " & ", "(",format(round(df[1,"ratio21_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[2,"ratio21_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[3,"ratio21_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[4,"ratio21_sd"], 3), nsmall = 3),")",
    " & ", "(",format(round(df[5,"ratio21_sd"], 3), nsmall = 3),")",
    " \\\\[+0.5ex]  "),
  " \\hline \\\\[-1.8ex] ",
  paste0( "Observations" ,
          " & ",format(round(df[1,"obs"], 0), nsmall = 0, big.mark=","),
          " & ",format(round(df[2,"obs"], 0), nsmall = 0, big.mark=","),
          " & ",format(round(df[3,"obs"], 0), nsmall = 0, big.mark=","),
          " & ",format(round(df[4,"obs"], 0), nsmall = 0, big.mark=","),
          " & ",format(round(df[5,"obs"], 0), nsmall = 0, big.mark=","),
          " \\\\[0.5ex]  "),
  paste0( "N firms" ,
          " & ",format(round(df[1,"firms"], 0), nsmall = 0, big.mark=","),
          " & ",format(round(df[2,"firms"], 0), nsmall = 0, big.mark=","),
          " & ",format(round(df[3,"firms"], 0), nsmall = 0, big.mark=","),
          " & ",format(round(df[4,"firms"], 0), nsmall = 0, big.mark=","),
          " & ",format(round(df[5,"firms"], 0), nsmall = 0, big.mark=","),
          " \\\\[0.5ex]  "),
  paste0( "N groups" ,
          " & ",format(round(df[1,"groups"], 0), nsmall = 0, big.mark=","),
          " & ",format(round(df[2,"groups"], 0), nsmall = 0, big.mark=","),
          " & ",format(round(df[3,"groups"], 0), nsmall = 0, big.mark=","),
          " & ",format(round(df[4,"groups"], 0), nsmall = 0, big.mark=","),
          " & ",format(round(df[5,"groups"], 0), nsmall = 0, big.mark=","),
          " \\\\[0.5ex]  "),
  paste0( "N workers" ,
          " & ",format(round(df[1,"workers"], 0), nsmall = 0, big.mark=","),
          " & ",format(round(df[2,"workers"], 0), nsmall = 0, big.mark=","),
          " & ",format(round(df[3,"workers"], 0), nsmall = 0, big.mark=","),
          " & ",format(round(df[4,"workers"], 0), nsmall = 0, big.mark=","),
          " & ",format(round(df[5,"workers"], 0), nsmall = 0, big.mark=","),
          " \\\\[0.5ex]  "),
  paste0( "N connections" ,
          " & ",format(round(df[1,"connections"], 0), nsmall = 0, big.mark=","),
          " & ",format(round(df[2,"connections"], 0), nsmall = 0, big.mark=","),
          " & ",format(round(df[3,"connections"], 0), nsmall = 0, big.mark=","),
          " & ",format(round(df[4,"connections"], 0), nsmall = 0, big.mark=","),
          " & ",format(round(df[5,"connections"], 0), nsmall = 0, big.mark=","),
          " \\\\[0.5ex]  "),
  file=filename,sep="\n",append=FALSE)

##################################################################
### Table A7: Effects on salary and duration by ethnicity  ###
##################################################################
df <- read.csv(paste0(output, "table_reg_salary_duration_con_multiple2.csv"))

df_jews <- df[df$fe == 2 & df$group1 == "jews", ]
df_arabs <- df[df$fe == 2 & df$group1 == "arabs", ]

df_jews_salary <- df_jews[df_jews$var == "log_salary", ]
df_jews_duration <- df_jews[df_jews$var == "duration_first_job", ]
df_jews_growth <- df_jews[df_jews$var == "salary_growth3", ]

df_arabs_salary <- df_arabs[df_arabs$var == "log_salary", ]
df_arabs_duration <- df_arabs[df_arabs$var == "duration_first_job", ]
df_arabs_growth <- df_arabs[df_arabs$var == "salary_growth3", ]

df_ethnicity <- rbind(df_jews_salary, df_arabs_salary,
                      df_jews_duration, df_arabs_duration,
                      df_jews_growth, df_arabs_growth)

filename <- paste0(tables, "table_reg_salary_duration_con_multiple2_ethnicity_body.tex")
cat(
  "\\\\[-1.8ex] &
  \\multicolumn{2}{c}{Log salary} &
  \\multicolumn{2}{c}{Job tenure} &
  \\multicolumn{2}{c}{Salary growth}  \\\\ ",
  " \\\\[-1.8ex] &
    \\multicolumn{1}{c}{Jews} &
    \\multicolumn{1}{c}{Arabs} &
    \\multicolumn{1}{c}{Jews} &
    \\multicolumn{1}{c}{Arabs} &
    \\multicolumn{1}{c}{Jews} &
    \\multicolumn{1}{c}{Arabs}
    \\\\ ",
  " \\\\[-1.8ex] &
    \\multicolumn{1}{c}{(1)} &
    \\multicolumn{1}{c}{(2)} &
    \\multicolumn{1}{c}{(3)} &
    \\multicolumn{1}{c}{(4)} &
    \\multicolumn{1}{c}{(5)} &
    \\multicolumn{1}{c}{(6)}
    \\\\ ",
  "\\hline \\\\[+0.5ex] ",
  paste0("Phantom: 1",
         " & ", format(round(df_ethnicity[1,"con1"], 3), nsmall = 3),
         " & ", format(round(df_ethnicity[2,"con1"], 3), nsmall = 3),
         " & ", format(round(df_ethnicity[3,"con1"], 3), nsmall = 3),
         " & ", format(round(df_ethnicity[4,"con1"], 3), nsmall = 3),
         " & ", format(round(df_ethnicity[5,"con1"], 3), nsmall = 3),
         " & ", format(round(df_ethnicity[6,"con1"], 3), nsmall = 3),
         " \\\\[0.2ex]  "),
  paste0(" & ", "(", format(round(df_ethnicity[1,"con1_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_ethnicity[2,"con1_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_ethnicity[3,"con1_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_ethnicity[4,"con1_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_ethnicity[5,"con1_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_ethnicity[6,"con1_se"], 3), nsmall = 3), ")",
         " \\\\[0.5ex]  "),
  
  paste0("Phantom: 2",
         " & ", format(round(df_ethnicity[1,"con2"], 3), nsmall = 3),
         " & ", format(round(df_ethnicity[2,"con2"], 3), nsmall = 3),
         " & ", format(round(df_ethnicity[3,"con2"], 3), nsmall = 3),
         " & ", format(round(df_ethnicity[4,"con2"], 3), nsmall = 3),
         " & ", format(round(df_ethnicity[5,"con2"], 3), nsmall = 3),
         " & ", format(round(df_ethnicity[6,"con2"], 3), nsmall = 3),
         " \\\\[0.2ex]  "),
  paste0(" & ", "(", format(round(df_ethnicity[1,"con2_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_ethnicity[2,"con2_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_ethnicity[3,"con2_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_ethnicity[4,"con2_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_ethnicity[5,"con2_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_ethnicity[6,"con2_se"], 3), nsmall = 3), ")",
         " \\\\[0.5ex]  "),
  
  paste0("Phantom: 3+",
         " & ", format(round(df_ethnicity[1,"con3"], 3), nsmall = 3),
         " & ", format(round(df_ethnicity[2,"con3"], 3), nsmall = 3),
         " & ", format(round(df_ethnicity[3,"con3"], 3), nsmall = 3),
         " & ", format(round(df_ethnicity[4,"con3"], 3), nsmall = 3),
         " & ", format(round(df_ethnicity[5,"con3"], 3), nsmall = 3),
         " & ", format(round(df_ethnicity[6,"con3"], 3), nsmall = 3),
         " \\\\[0.2ex]  "),
  paste0(" & ", "(", format(round(df_ethnicity[1,"con3_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_ethnicity[2,"con3_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_ethnicity[3,"con3_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_ethnicity[4,"con3_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_ethnicity[5,"con3_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_ethnicity[6,"con3_se"], 3), nsmall = 3), ")",
         " \\\\[0.5ex]  "),
  
  paste0("Weak: 1",
         " & ", format(round(df_ethnicity[1,"con4"], 3), nsmall = 3),
         " & ", format(round(df_ethnicity[2,"con4"], 3), nsmall = 3),
         " & ", format(round(df_ethnicity[3,"con4"], 3), nsmall = 3),
         " & ", format(round(df_ethnicity[4,"con4"], 3), nsmall = 3),
         " & ", format(round(df_ethnicity[5,"con4"], 3), nsmall = 3),
         " & ", format(round(df_ethnicity[6,"con4"], 3), nsmall = 3),
         " \\\\[0.2ex]  "),
  paste0(" & ", "(", format(round(df_ethnicity[1,"con4_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_ethnicity[2,"con4_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_ethnicity[3,"con4_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_ethnicity[4,"con4_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_ethnicity[5,"con4_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_ethnicity[6,"con4_se"], 3), nsmall = 3), ")",
         " \\\\[0.5ex]  "),
  
  paste0("Weak: 2",
         " & ", format(round(df_ethnicity[1,"con5"], 3), nsmall = 3),
         " & ", format(round(df_ethnicity[2,"con5"], 3), nsmall = 3),
         " & ", format(round(df_ethnicity[3,"con5"], 3), nsmall = 3),
         " & ", format(round(df_ethnicity[4,"con5"], 3), nsmall = 3),
         " & ", format(round(df_ethnicity[5,"con5"], 3), nsmall = 3),
         " & ", format(round(df_ethnicity[6,"con5"], 3), nsmall = 3),
         " \\\\[0.2ex]  "),
  paste0(" & ", "(", format(round(df_ethnicity[1,"con5_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_ethnicity[2,"con5_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_ethnicity[3,"con5_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_ethnicity[4,"con5_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_ethnicity[5,"con5_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_ethnicity[6,"con5_se"], 3), nsmall = 3), ")",
         " \\\\[0.5ex]  "),
  
  paste0("Weak: 3+",
         " & ", format(round(df_ethnicity[1,"con6"], 3), nsmall = 3),
         " & ", format(round(df_ethnicity[2,"con6"], 3), nsmall = 3),
         " & ", format(round(df_ethnicity[3,"con6"], 3), nsmall = 3),
         " & ", format(round(df_ethnicity[4,"con6"], 3), nsmall = 3),
         " & ", format(round(df_ethnicity[5,"con6"], 3), nsmall = 3),
         " & ", format(round(df_ethnicity[6,"con6"], 3), nsmall = 3),
         " \\\\[0.2ex]  "),
  paste0(" & ", "(", format(round(df_ethnicity[1,"con6_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_ethnicity[2,"con6_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_ethnicity[3,"con6_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_ethnicity[4,"con6_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_ethnicity[5,"con6_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_ethnicity[6,"con6_se"], 3), nsmall = 3), ")",
         " \\\\[0.5ex]  "),
  
  paste0("Mixed (phantom/weak)",
         " & ", format(round(df_ethnicity[1,"con7"], 3), nsmall = 3),
         " & ", format(round(df_ethnicity[2,"con7"], 3), nsmall = 3),
         " & ", format(round(df_ethnicity[3,"con7"], 3), nsmall = 3),
         " & ", format(round(df_ethnicity[4,"con7"], 3), nsmall = 3),
         " & ", format(round(df_ethnicity[5,"con7"], 3), nsmall = 3),
         " & ", format(round(df_ethnicity[6,"con7"], 3), nsmall = 3),
         " \\\\[0.2ex]  "),
  paste0(" & ", "(", format(round(df_ethnicity[1,"con7_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_ethnicity[2,"con7_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_ethnicity[3,"con7_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_ethnicity[4,"con7_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_ethnicity[5,"con7_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_ethnicity[6,"con7_se"], 3), nsmall = 3), ")",
         " \\\\[0.5ex]  "),
  
  paste0("Strong",
         " & ", format(round(df_ethnicity[1,"con8"], 3), nsmall = 3),
         " & ", format(round(df_ethnicity[2,"con8"], 3), nsmall = 3),
         " & ", format(round(df_ethnicity[3,"con8"], 3), nsmall = 3),
         " & ", format(round(df_ethnicity[4,"con8"], 3), nsmall = 3),
         " & ", format(round(df_ethnicity[5,"con8"], 3), nsmall = 3),
         " & ", format(round(df_ethnicity[6,"con8"], 3), nsmall = 3),
         " \\\\[0.2ex]  "),
  paste0(" & ", "(", format(round(df_ethnicity[1,"con8_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_ethnicity[2,"con8_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_ethnicity[3,"con8_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_ethnicity[4,"con8_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_ethnicity[5,"con8_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_ethnicity[6,"con8_se"], 3), nsmall = 3), ")",
         " \\\\[0.5ex]  "),
  
  " \\hline \\\\[-1.8ex] ",
  
  paste0("Diff. weak-phantom: 1",
         " & ", format(round(df_ethnicity[1,"diff41"], 3), nsmall = 3),
         " & ", format(round(df_ethnicity[2,"diff41"], 3), nsmall = 3),
         " & ", format(round(df_ethnicity[3,"diff41"], 3), nsmall = 3),
         " & ", format(round(df_ethnicity[4,"diff41"], 3), nsmall = 3),
         " & ", format(round(df_ethnicity[5,"diff41"], 3), nsmall = 3),
         " & ", format(round(df_ethnicity[6,"diff41"], 3), nsmall = 3),
         " \\\\[0.2ex]  "),
  paste0(" & ", "(", format(round(df_ethnicity[1,"diff41_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_ethnicity[2,"diff41_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_ethnicity[3,"diff41_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_ethnicity[4,"diff41_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_ethnicity[5,"diff41_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_ethnicity[6,"diff41_se"], 3), nsmall = 3), ")",
         " \\\\[0.5ex]  "),
  
  paste0("Diff. weak-phantom: 2",
         " & ", format(round(df_ethnicity[1,"diff52"], 3), nsmall = 3),
         " & ", format(round(df_ethnicity[2,"diff52"], 3), nsmall = 3),
         " & ", format(round(df_ethnicity[3,"diff52"], 3), nsmall = 3),
         " & ", format(round(df_ethnicity[4,"diff52"], 3), nsmall = 3),
         " & ", format(round(df_ethnicity[5,"diff52"], 3), nsmall = 3),
         " & ", format(round(df_ethnicity[6,"diff52"], 3), nsmall = 3),
         " \\\\[0.2ex]  "),
  paste0(" & ", "(", format(round(df_ethnicity[1,"diff52_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_ethnicity[2,"diff52_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_ethnicity[3,"diff52_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_ethnicity[4,"diff52_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_ethnicity[5,"diff52_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_ethnicity[6,"diff52_se"], 3), nsmall = 3), ")",
         " \\\\[0.5ex]  "),
  
  paste0("Diff. weak-phantom: 3+",
         " & ", format(round(df_ethnicity[1,"diff63"], 3), nsmall = 3),
         " & ", format(round(df_ethnicity[2,"diff63"], 3), nsmall = 3),
         " & ", format(round(df_ethnicity[3,"diff63"], 3), nsmall = 3),
         " & ", format(round(df_ethnicity[4,"diff63"], 3), nsmall = 3),
         " & ", format(round(df_ethnicity[5,"diff63"], 3), nsmall = 3),
         " & ", format(round(df_ethnicity[6,"diff63"], 3), nsmall = 3),
         " \\\\[0.2ex]  "),
  paste0(" & ", "(", format(round(df_ethnicity[1,"diff63_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_ethnicity[2,"diff63_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_ethnicity[3,"diff63_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_ethnicity[4,"diff63_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_ethnicity[5,"diff63_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_ethnicity[6,"diff63_se"], 3), nsmall = 3), ")",
         " \\\\[0.5ex]  "),
  
  " \\hline \\\\[-1.8ex] ",
  
  paste0("Mean (no connections)",
         " & ", format(round(df_ethnicity[1,"y0"], 3), nsmall = 3),
         " & ", format(round(df_ethnicity[2,"y0"], 3), nsmall = 3),
         " & ", format(round(df_ethnicity[3,"y0"], 3), nsmall = 3),
         " & ", format(round(df_ethnicity[4,"y0"], 3), nsmall = 3),
         " & ", format(round(df_ethnicity[5,"y0"], 3), nsmall = 3),
         " & ", format(round(df_ethnicity[6,"y0"], 3), nsmall = 3),
         " \\\\[+0.2ex]  "),
  
  paste0("Observations",
         " & ", format(round(df_ethnicity[1,"obs"], 0), nsmall = 0, big.mark = ","),
         " & ", format(round(df_ethnicity[2,"obs"], 0), nsmall = 0, big.mark = ","),
         " & ", format(round(df_ethnicity[3,"obs"], 0), nsmall = 0, big.mark = ","),
         " & ", format(round(df_ethnicity[4,"obs"], 0), nsmall = 0, big.mark = ","),
         " & ", format(round(df_ethnicity[5,"obs"], 0), nsmall = 0, big.mark = ","),
         " & ", format(round(df_ethnicity[6,"obs"], 0), nsmall = 0, big.mark = ","),
         " \\\\[0.5ex]  "),
  
  file = filename, sep = "\n", append = FALSE)

print("Ethnicity table created successfully!")


############################################################
### Table A8: Effects on salary and duration by gender  ###
############################################################

df <- read.csv(paste0(output, "table_reg_salary_duration_con_multiple2.csv"))

df_males <- df[df$fe == 2 & df$group1 == "males", ]
df_females <- df[df$fe == 2 & df$group1 == "females", ]

df_males_salary <- df_males[df_males$var == "log_salary", ]
df_males_duration <- df_males[df_males$var == "duration_first_job", ]
df_males_growth <- df_males[df_males$var == "salary_growth3", ]

df_females_salary <- df_females[df_females$var == "log_salary", ]
df_females_duration <- df_females[df_females$var == "duration_first_job", ]
df_females_growth <- df_females[df_females$var == "salary_growth3", ]

df_gender <- rbind(df_males_salary, df_females_salary, 
                   df_males_duration, df_females_duration,
                   df_males_growth, df_females_growth)

filename <- paste0(tables, "table_reg_salary_duration_con_multiple2_gender_body.tex")
cat(
  "\\\\[-1.8ex] &
  \\multicolumn{2}{c}{Log salary} &
  \\multicolumn{2}{c}{Job tenure} &
  \\multicolumn{2}{c}{Salary growth}  \\\\ ",
  " \\\\[-1.8ex] &
    \\multicolumn{1}{c}{Male} &
    \\multicolumn{1}{c}{Female} &
    \\multicolumn{1}{c}{Male} &
    \\multicolumn{1}{c}{Female} &
    \\multicolumn{1}{c}{Male} &
    \\multicolumn{1}{c}{Female}
    \\\\ ",
  " \\\\[-1.8ex] &
    \\multicolumn{1}{c}{(1)} &
    \\multicolumn{1}{c}{(2)} &
    \\multicolumn{1}{c}{(3)} &
    \\multicolumn{1}{c}{(4)} &
    \\multicolumn{1}{c}{(5)} &
    \\multicolumn{1}{c}{(6)}
    \\\\ ",
  "\\hline \\\\[+0.5ex] ",
  paste0("Phantom: 1",
         " & ", format(round(df_gender[1,"con1"], 3), nsmall = 3),
         " & ", format(round(df_gender[2,"con1"], 3), nsmall = 3),
         " & ", format(round(df_gender[3,"con1"], 3), nsmall = 3),
         " & ", format(round(df_gender[4,"con1"], 3), nsmall = 3),
         " & ", format(round(df_gender[5,"con1"], 3), nsmall = 3),
         " & ", format(round(df_gender[6,"con1"], 3), nsmall = 3),
         " \\\\[0.2ex]  "),
  paste0(" & ", "(", format(round(df_gender[1,"con1_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_gender[2,"con1_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_gender[3,"con1_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_gender[4,"con1_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_gender[5,"con1_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_gender[6,"con1_se"], 3), nsmall = 3), ")",
         " \\\\[0.5ex]  "),
  
  paste0("Phantom: 2",
         " & ", format(round(df_gender[1,"con2"], 3), nsmall = 3),
         " & ", format(round(df_gender[2,"con2"], 3), nsmall = 3),
         " & ", format(round(df_gender[3,"con2"], 3), nsmall = 3),
         " & ", format(round(df_gender[4,"con2"], 3), nsmall = 3),
         " & ", format(round(df_gender[5,"con2"], 3), nsmall = 3),
         " & ", format(round(df_gender[6,"con2"], 3), nsmall = 3),
         " \\\\[0.2ex]  "),
  paste0(" & ", "(", format(round(df_gender[1,"con2_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_gender[2,"con2_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_gender[3,"con2_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_gender[4,"con2_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_gender[5,"con2_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_gender[6,"con2_se"], 3), nsmall = 3), ")",
         " \\\\[0.5ex]  "),
  
  paste0("Phantom: 3+",
         " & ", format(round(df_gender[1,"con3"], 3), nsmall = 3),
         " & ", format(round(df_gender[2,"con3"], 3), nsmall = 3),
         " & ", format(round(df_gender[3,"con3"], 3), nsmall = 3),
         " & ", format(round(df_gender[4,"con3"], 3), nsmall = 3),
         " & ", format(round(df_gender[5,"con3"], 3), nsmall = 3),
         " & ", format(round(df_gender[6,"con3"], 3), nsmall = 3),
         " \\\\[0.2ex]  "),
  paste0(" & ", "(", format(round(df_gender[1,"con3_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_gender[2,"con3_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_gender[3,"con3_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_gender[4,"con3_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_gender[5,"con3_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_gender[6,"con3_se"], 3), nsmall = 3), ")",
         " \\\\[0.5ex]  "),
  
  paste0("Weak: 1",
         " & ", format(round(df_gender[1,"con4"], 3), nsmall = 3),
         " & ", format(round(df_gender[2,"con4"], 3), nsmall = 3),
         " & ", format(round(df_gender[3,"con4"], 3), nsmall = 3),
         " & ", format(round(df_gender[4,"con4"], 3), nsmall = 3),
         " & ", format(round(df_gender[5,"con4"], 3), nsmall = 3),
         " & ", format(round(df_gender[6,"con4"], 3), nsmall = 3),
         " \\\\[0.2ex]  "),
  paste0(" & ", "(", format(round(df_gender[1,"con4_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_gender[2,"con4_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_gender[3,"con4_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_gender[4,"con4_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_gender[5,"con4_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_gender[6,"con4_se"], 3), nsmall = 3), ")",
         " \\\\[0.5ex]  "),
  
  paste0("Weak: 2",
         " & ", format(round(df_gender[1,"con5"], 3), nsmall = 3),
         " & ", format(round(df_gender[2,"con5"], 3), nsmall = 3),
         " & ", format(round(df_gender[3,"con5"], 3), nsmall = 3),
         " & ", format(round(df_gender[4,"con5"], 3), nsmall = 3),
         " & ", format(round(df_gender[5,"con5"], 3), nsmall = 3),
         " & ", format(round(df_gender[6,"con5"], 3), nsmall = 3),
         " \\\\[0.2ex]  "),
  paste0(" & ", "(", format(round(df_gender[1,"con5_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_gender[2,"con5_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_gender[3,"con5_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_gender[4,"con5_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_gender[5,"con5_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_gender[6,"con5_se"], 3), nsmall = 3), ")",
         " \\\\[0.5ex]  "),
  
  paste0("Weak: 3+",
         " & ", format(round(df_gender[1,"con6"], 3), nsmall = 3),
         " & ", format(round(df_gender[2,"con6"], 3), nsmall = 3),
         " & ", format(round(df_gender[3,"con6"], 3), nsmall = 3),
         " & ", format(round(df_gender[4,"con6"], 3), nsmall = 3),
         " & ", format(round(df_gender[5,"con6"], 3), nsmall = 3),
         " & ", format(round(df_gender[6,"con6"], 3), nsmall = 3),
         " \\\\[0.2ex]  "),
  paste0(" & ", "(", format(round(df_gender[1,"con6_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_gender[2,"con6_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_gender[3,"con6_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_gender[4,"con6_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_gender[5,"con6_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_gender[6,"con6_se"], 3), nsmall = 3), ")",
         " \\\\[0.5ex]  "),
  
  paste0("Mixed (phantom/weak)",
         " & ", format(round(df_gender[1,"con7"], 3), nsmall = 3),
         " & ", format(round(df_gender[2,"con7"], 3), nsmall = 3),
         " & ", format(round(df_gender[3,"con7"], 3), nsmall = 3),
         " & ", format(round(df_gender[4,"con7"], 3), nsmall = 3),
         " & ", format(round(df_gender[5,"con7"], 3), nsmall = 3),
         " & ", format(round(df_gender[6,"con7"], 3), nsmall = 3),
         " \\\\[0.2ex]  "),
  paste0(" & ", "(", format(round(df_gender[1,"con7_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_gender[2,"con7_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_gender[3,"con7_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_gender[4,"con7_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_gender[5,"con7_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_gender[6,"con7_se"], 3), nsmall = 3), ")",
         " \\\\[0.5ex]  "),
  
  paste0("Strong",
         " & ", format(round(df_gender[1,"con8"], 3), nsmall = 3),
         " & ", format(round(df_gender[2,"con8"], 3), nsmall = 3),
         " & ", format(round(df_gender[3,"con8"], 3), nsmall = 3),
         " & ", format(round(df_gender[4,"con8"], 3), nsmall = 3),
         " & ", format(round(df_gender[5,"con8"], 3), nsmall = 3),
         " & ", format(round(df_gender[6,"con8"], 3), nsmall = 3),
         " \\\\[0.2ex]  "),
  paste0(" & ", "(", format(round(df_gender[1,"con8_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_gender[2,"con8_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_gender[3,"con8_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_gender[4,"con8_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_gender[5,"con8_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_gender[6,"con8_se"], 3), nsmall = 3), ")",
         " \\\\[0.5ex]  "),
  
  " \\hline \\\\[-1.8ex] ",
  
  paste0("Diff. weak-phantom: 1",
         " & ", format(round(df_gender[1,"diff41"], 3), nsmall = 3),
         " & ", format(round(df_gender[2,"diff41"], 3), nsmall = 3),
         " & ", format(round(df_gender[3,"diff41"], 3), nsmall = 3),
         " & ", format(round(df_gender[4,"diff41"], 3), nsmall = 3),
         " & ", format(round(df_gender[5,"diff41"], 3), nsmall = 3),
         " & ", format(round(df_gender[6,"diff41"], 3), nsmall = 3),
         " \\\\[0.2ex]  "),
  paste0(" & ", "(", format(round(df_gender[1,"diff41_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_gender[2,"diff41_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_gender[3,"diff41_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_gender[4,"diff41_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_gender[5,"diff41_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_gender[6,"diff41_se"], 3), nsmall = 3), ")",
         " \\\\[0.5ex]  "),
  
  paste0("Diff. weak-phantom: 2",
         " & ", format(round(df_gender[1,"diff52"], 3), nsmall = 3),
         " & ", format(round(df_gender[2,"diff52"], 3), nsmall = 3),
         " & ", format(round(df_gender[3,"diff52"], 3), nsmall = 3),
         " & ", format(round(df_gender[4,"diff52"], 3), nsmall = 3),
         " & ", format(round(df_gender[5,"diff52"], 3), nsmall = 3),
         " & ", format(round(df_gender[6,"diff52"], 3), nsmall = 3),
         " \\\\[0.2ex]  "),
  paste0(" & ", "(", format(round(df_gender[1,"diff52_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_gender[2,"diff52_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_gender[3,"diff52_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_gender[4,"diff52_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_gender[5,"diff52_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_gender[6,"diff52_se"], 3), nsmall = 3), ")",
         " \\\\[0.5ex]  "),
  
  paste0("Diff. weak-phantom: 3+",
         " & ", format(round(df_gender[1,"diff63"], 3), nsmall = 3),
         " & ", format(round(df_gender[2,"diff63"], 3), nsmall = 3),
         " & ", format(round(df_gender[3,"diff63"], 3), nsmall = 3),
         " & ", format(round(df_gender[4,"diff63"], 3), nsmall = 3),
         " & ", format(round(df_gender[5,"diff63"], 3), nsmall = 3),
         " & ", format(round(df_gender[6,"diff63"], 3), nsmall = 3),
         " \\\\[0.2ex]  "),
  paste0(" & ", "(", format(round(df_gender[1,"diff63_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_gender[2,"diff63_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_gender[3,"diff63_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_gender[4,"diff63_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_gender[5,"diff63_se"], 3), nsmall = 3), ")",
         " & ", "(", format(round(df_gender[6,"diff63_se"], 3), nsmall = 3), ")",
         " \\\\[0.5ex]  "),
  
  " \\hline \\\\[-1.8ex] ",
  
  paste0("Mean (no connections)",
         " & ", format(round(df_gender[1,"y0"], 3), nsmall = 3),
         " & ", format(round(df_gender[2,"y0"], 3), nsmall = 3),
         " & ", format(round(df_gender[3,"y0"], 3), nsmall = 3),
         " & ", format(round(df_gender[4,"y0"], 3), nsmall = 3),
         " & ", format(round(df_gender[5,"y0"], 3), nsmall = 3),
         " & ", format(round(df_gender[6,"y0"], 3), nsmall = 3),
         " \\\\[+0.2ex]  "),
  
  paste0("Observations",
         " & ", format(round(df_gender[1,"obs"], 0), nsmall = 0, big.mark = ","),
         " & ", format(round(df_gender[2,"obs"], 0), nsmall = 0, big.mark = ","),
         " & ", format(round(df_gender[3,"obs"], 0), nsmall = 0, big.mark = ","),
         " & ", format(round(df_gender[4,"obs"], 0), nsmall = 0, big.mark = ","),
         " & ", format(round(df_gender[5,"obs"], 0), nsmall = 0, big.mark = ","),
         " & ", format(round(df_gender[6,"obs"], 0), nsmall = 0, big.mark = ","),
         " \\\\[0.5ex]  "),
  
  file = filename, sep = "\n", append = FALSE)


