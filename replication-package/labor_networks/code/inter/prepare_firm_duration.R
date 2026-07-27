filename <- paste0(data, "employment_history.Rdata")								
load(filename)	
employment_history = df
rm(df)

filename <- paste0(data, "children_sample.Rdata")								
load(filename)	
children_sample = df
rm(df)


# drop the children from the data
employment_history = merge(employment_history,children_sample[,.(id,temp=1)], by = "id", all.x = T)
employment_history = employment_history[is.na(temp)]

# calculate the mean and sd duration in the years [t-4,t] by firm (but combine all years together)
employment_history = employment_history[real == 1]
employment_history[,first_year_worker_firm := min(year), by = .(id,id_firm)]
employment_history[,last_year_firm := max(year), by = .(id_firm)]

employment_history = employment_history[year <= first_year_worker_firm + 4 ]
employment_history = employment_history[ last_year_firm>=first_year_worker_firm+4]
employment_history = employment_history[ first_year_worker_firm>=2002]

worker_firm = employment_history[,.(duration =.N), by = .(id,id_firm)]

firms = worker_firm[,.(obs = .N,
                              duration_mean =  mean(duration),
                      duration_sd = sd(duration)), by = .(id_firm)]

firms = firms[obs>=5]

firms[,bin_duration_mean := ceiling((rank(duration_mean)/.N)*10)]
firms[,bin_duration_sd := ceiling((rank(duration_sd)/.N)*10)]

# save

df = firms
filename <- paste0(data, "firms_duration_bins.Rdata")
save(df, file = filename)
rm(df,firms,employment_history,worker_firm,children_sample)

