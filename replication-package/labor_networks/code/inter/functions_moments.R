# calculate moments

get.moments <- function(sdata) {


  table_temp <- sdata[,.(mu = .N, w = mean(y1)) , by = c("year", "con_type")]
d <- CJ(year = 1:T,con_type=0:C)
table_temp <- merge(table_temp,d,by = c("year","con_type"),all = TRUE)
table_temp[is.na(mu), mu := 0]
table_temp[is.na(w), w := 0]

table_temp[con_type == 0,w_temp := w]
table_temp[,w_0 := mean(w_temp,na.rm = TRUE), by =  c("year")]

table_temp1 <- sdata[,.(mu_t = .N) , by = c("year")]

table_temp <- merge(table_temp,table_temp1, by = "year")

table_temp <- table_temp[con_type > 0]

table_temp[,moments1 := mu/mu_t]
table_temp[,moments2 := w - w_0]
moments1 <- table_temp[,mean(moments1), by = "con_type"]
setorder(moments1,con_type)
moments1 <- moments1[,V1]
moments2 <- table_temp[,mean(moments2), by = "con_type"]
setorder(moments2,con_type)
moments2 <- moments2[,V1]

# matches by ethnithity-y groups
table_temp <- sdata[,.(mu = .N) ,
                      by = c( "year","ethnicity", "job_type")]
d <- CJ( year = 1:T, ethnicity=0:1, job_type=1:Y)
table_temp <- merge(table_temp,d,by = c("year","ethnicity", "job_type"),all = TRUE)
table_temp[is.na(mu), mu := 0]

table_temp1 <- sdata[,.(mu_t = .N) ,
                   by = c( "year","ethnicity")]

table_temp <- merge(table_temp,table_temp1, by =  c( "year","ethnicity") )

table_temp <- table_temp[ethnicity == 1 & job_type > 1]

table_temp[,moments_temp := mu/mu_t]

moments_temp <- table_temp[,mean(moments_temp), by = c( "job_type")]
setorder(moments_temp,job_type)
moments3_1 <- moments_temp[,V1]

# matches by education-y groups
table_temp <- sdata[,.(mu = .N) ,
                   by = c( "year","education", "job_type")]
d <- CJ( year = 1:T, education=0:1, job_type=1:Y)
table_temp <- merge(table_temp,d,by = c("year","education", "job_type"),all = TRUE)
table_temp[is.na(mu), mu := 0]

table_temp1 <- sdata[,.(mu_t = .N) ,
                  by = c( "year","education")]

table_temp <- merge(table_temp,table_temp1, by =  c( "year","education") )

table_temp <- table_temp[education == 1 & job_type > 1]

table_temp[,moments_temp := mu/mu_t]

moments_temp <- table_temp[,mean(moments_temp), by = c( "job_type")]
setorder(moments_temp,job_type)
moments3_2 <- moments_temp[,V1]

# matches by sex-y groups
table_temp <- sdata[,.(mu = .N) ,
                   by = c( "year","sex", "job_type")]
d <- CJ( year = 1:T, sex=0:1, job_type=1:Y)
table_temp <- merge(table_temp,d,by = c("year","sex", "job_type"),all = TRUE)
table_temp[is.na(mu), mu := 0]

table_temp1 <- sdata[,.(mu_t = .N) ,
                  by = c( "year","sex")]

table_temp <- merge(table_temp,table_temp1, by =  c( "year","sex") )

table_temp <- table_temp[sex == 1 & job_type > 1]

table_temp[,moments_temp := mu/mu_t]

moments_temp <- table_temp[,mean(moments_temp), by = c( "job_type")]
setorder(moments_temp,job_type)
moments3_3 <- moments_temp[,V1]

# merge them togather
moments3 <- c(moments3_1,moments3_2,moments3_3)

# matches by ethnithity-c groups
table_temp <- sdata[,.(mu = .N) ,
                   by = c( "year","ethnicity", "con_type")]
d <- CJ( year = 1:T, ethnicity=0:1, con_type=0:C)
table_temp <- merge(table_temp,d,by = c("year","ethnicity", "con_type"),all = TRUE)
table_temp[is.na(mu), mu := 0]

table_temp1 <- sdata[,.(mu_t = .N) ,
                  by = c( "year","ethnicity")]

table_temp <- merge(table_temp,table_temp1, by =  c( "year","ethnicity") )

table_temp <- table_temp[ethnicity == 1 & con_type > 0]

table_temp[,moments_temp := mu/mu_t]

moments_temp <- table_temp[,mean(moments_temp), by = c( "con_type")]
setorder(moments_temp,con_type)
moments4_1 <- moments_temp[,V1]

# matches by education-c groups
table_temp <- sdata[,.(mu = .N) ,
                   by = c( "year","education", "con_type")]
d <- CJ( year = 1:T, education=0:1, con_type=0:C)
table_temp <- merge(table_temp,d,by = c("year","education", "con_type"),all = TRUE)
table_temp[is.na(mu), mu := 0]

table_temp1 <- sdata[,.(mu_t = .N) ,
                  by = c( "year","education")]

table_temp <- merge(table_temp,table_temp1, by =  c( "year","education") )

table_temp <- table_temp[education == 1 & con_type > 0]

table_temp[,moments_temp := mu/mu_t]

moments_temp <- table_temp[,mean(moments_temp), by = c( "con_type")]
setorder(moments_temp,con_type)
moments4_2 <- moments_temp[,V1]

# matches by sex-c groups
table_temp <- sdata[,.(mu = .N) ,
                   by = c( "year","sex", "con_type")]
d <- CJ( year = 1:T, sex=0:1, con_type=0:C)
table_temp <- merge(table_temp,d,by = c("year","sex", "con_type"),all = TRUE)
table_temp[is.na(mu), mu := 0]

table_temp1 <- sdata[,.(mu_t = .N) ,
                  by = c( "year","sex")]

table_temp <- merge(table_temp,table_temp1, by =  c( "year","sex") )

table_temp <- table_temp[sex == 1 & con_type > 0]

table_temp[,moments_temp := mu/mu_t]

moments_temp <- table_temp[,mean(moments_temp), by = c( "con_type")]
setorder(moments_temp,con_type)
moments4_3 <- moments_temp[,V1]

# merge them togather
moments4 <- c(moments4_1,moments4_2,moments4_3)

# matches by y-c groups
table_temp <- sdata[,.(mu = .N) ,
                   by = c( "year","job_type", "con_type")]
d <- CJ( year = 1:T, job_type=1:Y, con_type=0:C)
table_temp <- merge(table_temp,d,by = c("year","job_type", "con_type"),all = TRUE)
table_temp[is.na(mu), mu := 0]

table_temp1 <- sdata[,.(mu_t = .N) ,
                  by = c( "year","job_type")]

table_temp <- merge(table_temp,table_temp1, by =  c( "year","job_type") )

table_temp <- table_temp[job_type > 1 & con_type > 0]

table_temp[,moments_temp := mu/mu_t]

moments_temp <- table_temp[,mean(moments_temp), by = c("job_type", "con_type")]
setorder(moments_temp,job_type,con_type)
moments5 <- moments_temp[,V1]

# wages by ethnicity groups
table_temp <- sdata[,.(w = mean(y1)) , by = c("year", "ethnicity")]
table_temp[ethnicity == 0,w_temp := w]
table_temp[,w_0 := mean(w_temp,na.rm = TRUE), by =  c("year")]
table_temp[,moments_temp :=w - w_0]
table_temp <- table_temp[ethnicity == 1]
moments6_1 <- table_temp[,mean(moments_temp)]

# wages by education groups
table_temp <- sdata[,.(w = mean(y1)) , by = c("year", "education")]
table_temp[education == 0,w_temp := w]
table_temp[,w_0 := mean(w_temp,na.rm = TRUE), by =  c("year")]
table_temp[,moments_temp :=w - w_0]
table_temp <- table_temp[education == 1]
moments6_2 <- table_temp[,mean(moments_temp)]

# wages by sex groups
table_temp <- sdata[,.(w = mean(y1)) , by = c("year", "sex")]
table_temp[sex == 0,w_temp := w]
table_temp[,w_0 := mean(w_temp,na.rm = TRUE), by =  c("year")]
table_temp[,moments_temp :=w - w_0]
table_temp <- table_temp[sex == 1]
moments6_3 <- table_temp[,mean(moments_temp)]

# merge them togather
moments6 <- c(moments6_1,moments6_2,moments6_3)

# wages by y groups
table_temp <- sdata[,.(w = mean(y1)) , by = c("year", "job_type")]
table_temp[job_type == 1,w_temp := w]
table_temp[,w_0 := mean(w_temp,na.rm = TRUE), by =  c("year")]
table_temp[,moments_temp :=w - w_0]
table_temp <- table_temp[job_type > 1]
moments_temp <- table_temp[,mean(moments_temp), by = c("job_type")]
setorder(moments_temp,job_type)
moments7 <- moments_temp[,V1]

# std of wages

sd_table <- sdata[,.(sd_w = sd(y1)),by = "year"]
moments8 <- sd_table[,mean(sd_w)]


## 9. relative wages by gy groups

# wages by ethnicity groups
table_temp <- sdata[ethnicity == 1,.(w = mean(y1)) , by = c("year", "job_type")]
table_temp[job_type == 1,w_temp := w]
table_temp[,w_0 := mean(w_temp,na.rm = TRUE), by =  c("year")]
table_temp[,moments_temp :=w - w_0]
table_temp <- table_temp[job_type > 1]
moments_temp <- table_temp[,mean(moments_temp), by =  c("job_type")]
setorder(moments_temp,job_type)
moments9_1 <- moments_temp[,V1]

# wages by education groups
table_temp <- sdata[education == 1,.(w = mean(y1)) , by = c("year", "job_type")]
table_temp[job_type == 1,w_temp := w]
table_temp[,w_0 := mean(w_temp,na.rm = TRUE), by =  c("year")]
table_temp[,moments_temp :=w - w_0]
table_temp <- table_temp[job_type > 1]
moments_temp <- table_temp[,mean(moments_temp), by =  c("job_type")]
setorder(moments_temp,job_type)
moments9_2 <- moments_temp[,V1]

# wages by sex groups
table_temp <- sdata[sex == 1,.(w = mean(y1)) , by = c("year", "job_type")]
table_temp[job_type == 1,w_temp := w]
table_temp[,w_0 := mean(w_temp,na.rm = TRUE), by =  c("year")]
table_temp[,moments_temp :=w - w_0]
table_temp <- table_temp[job_type > 1]
moments_temp <- table_temp[,mean(moments_temp), by =  c("job_type")]
setorder(moments_temp,job_type)
moments9_3 <- moments_temp[,V1]

# merge them togather
moments9 <- c(moments9_1,moments9_2,moments9_3)


## 10. relative wages by gc groups

# wages by ethnicity groups
table_temp <- sdata[ethnicity == 1,.(w = mean(y1)) , by = c("year", "con_type")]
table_temp[con_type == 0,w_temp := w]
table_temp[,w_0 := mean(w_temp,na.rm = TRUE), by =  c("year")]
table_temp[,moments_temp :=w - w_0]
table_temp <- table_temp[con_type > 0]
moments_temp <- table_temp[,mean(moments_temp), by =  c("con_type")]
setorder(moments_temp,con_type)
moments10_1 <- moments_temp[,V1]

# wages by education groups
table_temp <- sdata[education == 1,.(w = mean(y1)) , by = c("year", "con_type")]
table_temp[con_type == 0,w_temp := w]
table_temp[,w_0 := mean(w_temp,na.rm = TRUE), by =  c("year")]
table_temp[,moments_temp :=w - w_0]
table_temp <- table_temp[con_type > 0]
moments_temp <- table_temp[,mean(moments_temp), by =  c("con_type")]
setorder(moments_temp,con_type)
moments10_2 <- moments_temp[,V1]

# wages by sex groups
table_temp <- sdata[sex == 1,.(w = mean(y1)) , by = c("year", "con_type")]
table_temp[con_type == 0,w_temp := w]
table_temp[,w_0 := mean(w_temp,na.rm = TRUE), by =  c("year")]
table_temp[,moments_temp :=w - w_0]
table_temp <- table_temp[con_type > 0]
moments_temp <- table_temp[,mean(moments_temp), by =  c("con_type")]
setorder(moments_temp,con_type)
moments10_3 <- moments_temp[,V1]

# merge them togather
moments10 <- c(moments10_1,moments10_2,moments10_3)


## 11. relative wages by yc groups

table_temp <- sdata[job_type > 1,.(w = mean(y1)) , by = c("year","job_type", "con_type")]
table_temp[con_type == 0,w_temp := w]
table_temp[,w_0 := mean(w_temp,na.rm = TRUE), by =  c("year","job_type")]
table_temp[,moments_temp :=w - w_0]
table_temp <- table_temp[con_type > 0]
moments_temp <- table_temp[,mean(moments_temp), by =  c("job_type","con_type")]
setorder(moments_temp,job_type,con_type)
moments11 <- moments_temp[,V1]

moments <- c(moments1,moments2,moments3,moments4,moments5,moments6,moments7,moments8,moments9,moments10,moments11)

return(moments)
}

########################
########################
########################

# bootstrap initial weighting matrix

bootstrap.initial.W <- function(sdata,B) {

moments_B = vector()
for (b in 1:B) {
  print(b)
sdata_b <- sdata[sample(.N, I,replace = TRUE)]
moments_b <- get.moments(sdata_b)  
moments_B = rbind(moments_B,moments_b)  
}

W <- 1/diag((cov(moments_B)))
return(W)
}


########################
########################
########################

# bootstrap se for mu, av. wage and se wage by txyc group

bootstrap.sd.mu.w <- function(sdata,B) {

    groups_all <- sdata[,.(obs = .N, w_mean = mean(y1), w_sd = sd(y1)) ,
                  by = .(year,worker_type,job_type,con_type)]
  groups_all <- groups_all[obs >= 10]
  groups_all <- groups_all[,.(year,worker_type,job_type,con_type)]
  setorder(groups_all,year,worker_type,job_type,con_type)
  
  obs_sd = vector()
  salary_mean_sd = vector()
  salary_sd_sd = vector()
  salary_obs_mean_sd = vector()
  salary_obs_sd_sd = vector()
  for (b in 1:B) {
    print(b)
    sdata_b <- sdata[sample(.N, I,replace = TRUE)]
    mu_w <- sdata_b[,.(obs = .N, salary_mean = mean(y1), salary_sd = sd(y1)) ,
                           by = .(year,worker_type,job_type,con_type)]
    mu_w <- mu_w[, salary_obs_mean := salary_mean * obs ]
    mu_w <- mu_w[, salary_obs_sd := salary_sd * obs ]
    
    mu_w <- merge(groups_all,mu_w, by = c("year","worker_type","job_type","con_type"), all.x = TRUE)
    setorder(mu_w,year,worker_type,job_type,con_type)
    obs_sd = rbind(obs_sd,mu_w[,obs])  
    salary_mean_sd = rbind(salary_mean_sd,mu_w[,salary_mean])  
    salary_sd_sd = rbind(salary_sd_sd,mu_w[,salary_sd])  
    salary_obs_mean_sd = rbind(salary_obs_mean_sd,mu_w[,salary_obs_mean])  
    salary_obs_sd_sd = rbind(salary_obs_sd_sd,mu_w[,salary_obs_sd])  
    
  }
  obs_sd <- data.table(obs_sd)
  obs_sd <- obs_sd[,lapply(.SD,sd,na.rm = TRUE)]
  obs_sd <- as.vector(t(obs_sd))
  
  salary_mean_sd <- data.table(salary_mean_sd)
  salary_mean_sd <- salary_mean_sd[,lapply(.SD,sd,na.rm = TRUE)]
  salary_mean_sd <- as.vector(t(salary_mean_sd))
  
  salary_sd_sd <- data.table(salary_sd_sd)
  salary_sd_sd <- salary_sd_sd[,lapply(.SD,sd,na.rm = TRUE)]
  salary_sd_sd <- as.vector(t(salary_sd_sd))
  
  salary_obs_mean_sd <- data.table(salary_obs_mean_sd)
  salary_obs_mean_sd <- salary_obs_mean_sd[,lapply(.SD,sd,na.rm = TRUE)]
  salary_obs_mean_sd <- as.vector(t(salary_obs_mean_sd))
  
  salary_obs_sd_sd <- data.table(salary_obs_sd_sd)
  salary_obs_sd_sd <- salary_obs_sd_sd[,lapply(.SD,sd,na.rm = TRUE)]
  salary_obs_sd_sd <- as.vector(t(salary_obs_sd_sd))
  
  sd_mu_w <- cbind(groups_all,obs_sd,salary_mean_sd,salary_sd_sd,salary_obs_mean_sd,salary_obs_sd_sd)
  return(sd_mu_w)
}


