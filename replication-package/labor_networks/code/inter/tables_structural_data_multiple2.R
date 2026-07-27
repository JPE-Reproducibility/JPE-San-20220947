
# load the children sample
filename <- paste0(data, "children_sample.Rdata")
load(filename)
df_children <- df
rm(df)


df_children <- df_children[,.(id,id_firm,year,age = year - birth_year, ethnicity,
                              education = 1*(education>0),sex)]

## get firm premium
filename <- paste0(data, "akm_firm.Rdata")
load(filename)
df_children <- merge(df_children,df[,.(id_firm,year,firm_rank)], by = c("id_firm","year"))
rm(df)

# define a unique job id
df_children[,id_job := 1:.N]


## get children types
df_children_types <- unique(df_children[,.(ethnicity,education,sex)])
setorder(df_children_types,ethnicity,education,sex)
df_children_types[,worker_type := 1:.N]
df_children <- merge(df_children,df_children_types, by = c("ethnicity","education","sex"))


# create jobs dataset
df_jobs <- df_children[,.(id_firm,id_job, year,firm_rank)]


## get job types
df_jobs[,firm_rank_bin := ceiling(rank(firm_rank)/.N *5)]
df_job_types <- unique(df_jobs[,.(firm_rank_bin)])
setorder(df_job_types,firm_rank_bin)
df_job_types[,job_type := 1:.N]
df_jobs <- merge(df_jobs,df_job_types, by = c("firm_rank_bin"))


# merge with df_children 
df_children <- merge(df_children,df_jobs[,.(id_job,year,job_type)], by = c("id_job","year"))


# load connections by id - id_firm 
filename <- paste0(data, "connections_type_multiple2.Rdata")
load(filename)
df_connections <- df[,.(id,id_firm,con_type)]
rm(df)
df_connections <- merge(df_connections,df_children[,.(id)], by = "id")


# merge df_children with df_connections
df_children <- merge(df_children,df_connections, by = c("id","id_firm"), all.x = TRUE)
df_children[is.na(con_type), con_type := 0]

# normelize the year
df_children[,year := year - min(year) + 1]
df_jobs[,year := year - min(year) + 1]

# create tables with number of obs by year, group and connection type
mu_txyc <- df_children[,.(obs = .N) ,
                       by = .(year,worker_type,job_type,con_type)]
mu_txyc[,workers := sum(obs), by =c("year","worker_type") ]
mu_txyc[,jobs := sum(obs), by =c("year","job_type") ]


## merge the connection data with the worker/job types
df_connections <- merge(df_connections,df_children[,.(id,year,worker_type)] , by = "id")
df_connections <- merge(df_connections,df_jobs[,.(id_job,id_firm,year,job_type)] , by = c("id_firm","year") , allow.cartesian=TRUE)

## get the number of connections by connection type, types and year
d_txyc <- df_connections[,.(connections = .N) , by = c("year","worker_type","job_type","con_type")]
d_txyc <- merge(mu_txyc ,d_txyc, by =  c("year","worker_type","job_type","con_type"), all = TRUE)
d_txyc[,workers := sum(obs,na.rm = TRUE), by  = c("year","worker_type")]
d_txyc[,jobs := sum(obs,na.rm = TRUE), by  = c("year","job_type")]

## get the number of workers/jobs with some connections
d_workers_txyc <- df_connections[,.(connections = .N) , by = c("id","year","worker_type","job_type","con_type")]
d_workers_txyc <- d_workers_txyc[,.(workers_con = .N) , by = c("year","worker_type","job_type","con_type")]

d_jobs_txyc <- df_connections[,.(connections = .N) , by = c("id_firm","year","worker_type","job_type","con_type")]
d_jobs_txyc <- d_jobs_txyc[,.(jobs_con = .N) , by = c("year","worker_type","job_type","con_type")]

d_txyc <- merge(d_txyc,d_workers_txyc , by= c("year","worker_type","job_type","con_type"), all.x = TRUE)
d_txyc[, workers_con := workers_con / workers]
d_txyc <- merge(d_txyc,d_jobs_txyc , by= c("year","worker_type","job_type","con_type"), all.x = TRUE)
d_txyc[, jobs_con := jobs_con / jobs]

# get the number of no-connections
d_txyc[,sum_d := sum(connections,na.rm = TRUE), by  = c("year","worker_type","job_type")]
d_txyc[con_type == 0, connections := workers*jobs - sum_d]
d_txyc[,connections := connections / ( workers*jobs)]
d_txyc[con_type == 0, workers_con := 1]
d_txyc[con_type == 0, jobs_con := 1]
d_txyc <- d_txyc[,.(year,worker_type,job_type,con_type,workers,jobs,connections)]

d_xyc = copy(d_txyc)
d_xyc[,connections := connections * workers*jobs]
d_xyc[,workers_jobs := workers*jobs]
d_xyc = d_xyc[,.(obs = sum(connections),
                 workers_jobs = sum(workers_jobs),
                 workers = mean(workers),
                 jobs = mean(jobs)), by = .( worker_type, job_type, con_type)]

d_xyc[,connections := obs/workers_jobs]




setorder(d_xyc,worker_type,job_type,con_type)
d_xyc <- d_xyc[obs>=10]
filename <- paste0(output, "d_xyc_multiple2.csv")
write.csv(d_txyc,filename,row.names = FALSE)
