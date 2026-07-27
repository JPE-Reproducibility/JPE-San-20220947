
first_year <- 2006
last_year <- 2015

first_birth_year <- 1979
last_birth_year <- 1993


# load the employment_history file
filename <- paste0(data, "employment_history.Rdata")
load(filename)
employment_history <- df
rm(df)

employment_history <- employment_history[,firm_size := .N , by= .(id_firm,year) ]
employment_history <- employment_history[,rank_firm := rank(salary)/firm_size , by= .(id_firm,year) ]
colnames(employment_history)[colnames(employment_history) == "salary_rank"] <- "rank_total"
employment_history[, c("salary","real") := NULL]


# load the children sample
filename <- paste0(data, "children_sample.Rdata")
load(filename)
df_children1 <- df
rm(df)

# load children-parents link
filename <- paste0(data, "df_parents.Rdata")
load(filename)
df_parents <- df
rm(df)

# load the population file
filename <- paste0(data, "population.Rdata")
load(filename)
df_population = df[,.(id,sex,ethnicity)]
rm(df)

######
for (t in first_year:last_year){
  count = 0
  for (b in first_birth_year:last_birth_year){
    if (t-b >= 22 & t-b <= 27){
      
      
      print(t)
      print(b)
      
      
      df_children <- df_children1[year == t & birth_year == b]
      
      # get children-parent links for children from the sample
      df_connections <- merge(df_children[,.(id)],
                              df_parents, by.x = "id",
                              by.y = "id1")
      
      rm(df_children)
      
      print("merge1")
      
      
      
      
      # get children-past parent firms link (10 years before the the child is 21)
      df_connections <- merge(df_connections, 
                              employment_history, by.x = "id2",
                              by.y = "id", allow.cartesian=TRUE)[year-b <= 21
                                                                 & year-b >= 12]
      print("merge2")
      
      colnames(df_connections)[colnames(df_connections) == "id"] <- "id_child"
      colnames(df_connections)[colnames(df_connections) == "id2"] <- "id_parent"
      colnames(df_connections)[colnames(df_connections) == "rank_firm"] <- "rank_firm_parent"
      colnames(df_connections)[colnames(df_connections) == "rank_total"] <- "rank_total_parent"
      colnames(df_connections)[colnames(df_connections) == "firm_size"] <- "firm_size_past"
      
      # get all parent past coworkers linked to children
      df_connections <- merge(df_connections, 
                              employment_history, by = c("year","id_firm"),
                              allow.cartesian=TRUE)
      
      print("merge3")
      
      colnames(df_connections)[colnames(df_connections) == "id"] <- "id_pco"
      colnames(df_connections)[colnames(df_connections) == "rank_firm"] <- "rank_firm_pco_past"
      colnames(df_connections)[colnames(df_connections) == "rank_total"] <- "rank_total_pco_past"
      colnames(df_connections)[colnames(df_connections) == "id_firm"] <- "id_firm_past"
      colnames(df_connections)[colnames(df_connections) == "year"] <- "year_past"
      
      df_connections[,firm_size := NULL]
      
      # collapse by id_child,id_pco, id_parent
      df_connections <- df_connections[, .(duration_past = .N,
                                           rank_total_parent=  mean(rank_total_parent),
                                           rank_firm_parent=  mean(rank_firm_parent),
                                           rank_total_pco_past=  mean(rank_total_pco_past),
                                           rank_firm_pco_past=  mean(rank_firm_pco_past),
                                           min_year_past = min(year_past),
                                           max_year_past = max(year_past),
                                           firm_size_past = mean(firm_size_past)),
                                       by = .(id_child,id_pco,id_parent)]  
      
      
      # get the connections between children and firms by year
      df_connections <- merge(df_connections, 
                              employment_history, by.x = "id_pco",
                              by.y = "id", allow.cartesian=TRUE)
      
      print("merge4")
      
      colnames(df_connections)[colnames(df_connections) == "firm_size"] <- "firm_size_current"
      colnames(df_connections)[colnames(df_connections) == "rank_firm"] <- "rank_firm_pco_current"
      colnames(df_connections)[colnames(df_connections) == "rank_total"] <- "rank_total_pco_current"
      colnames(df_connections)[colnames(df_connections) == "id_child"] <- "id"
      
      # keep only connections in [t-5,t+5]
      df_connections[,lag := year - t]
      df_connections <- df_connections[ lag >=-5 & lag <= 5]
      
      # get the duration, year of last cowork, and average (firm_size_past, parent_rank, rank_pco_past)
      # by id, id_parent, id_pco , id_firm (id_pco is 1:1 with id_firm)
      df_connections <- df_connections[,
                                       .(duration_past = mean(duration_past),
                                         max_year_past = max(max_year_past),
                                         log_firm_size_past = mean(log(firm_size_past)),
                                         rank_firm_parent = mean(rank_firm_parent),
                                         rank_total_parent = mean(rank_total_parent),
                                         rank_firm_pco_past = mean(rank_firm_pco_past),
                                         rank_total_pco_past = mean(rank_total_pco_past),
                                         rank_firm_pco_current = mean(rank_firm_pco_current),
                                         rank_total_pco_current = mean(rank_total_pco_current),
                                         log_firm_size_current = mean(log(firm_size_current)) 
                                       ),
                                       by = .(id,id_parent,id_pco,id_firm)]      
      
      # the the lag between current year and last year of connections
      df_connections[, lag_past := t - max_year_past]
      
      # merge with information on child. parent, pco, from the population file (birth_year, sex, ethnicity)
      df_connections <- merge(df_connections,df_population, by = "id", all.x = TRUE)
      colnames(df_connections)[colnames(df_connections) == "sex"] <- "sex_child"
      colnames(df_connections)[colnames(df_connections) == "ethnicity"] <- "ethnicity_child"
      
      df_connections <- merge(df_connections,df_children1[,.(id,education = 1 *(education >0))], by = "id", all.x = TRUE)
      colnames(df_connections)[colnames(df_connections) == "education"] <- "education_child"
      
      
      df_connections <- merge(df_connections,df_population, by.x = "id_parent", by.y = "id", all.x = TRUE)
      colnames(df_connections)[colnames(df_connections) == "sex"] <- "sex_parent"
      colnames(df_connections)[colnames(df_connections) == "ethnicity"] <- "ethnicity_parent"
      
      df_connections <- merge(df_connections,df_population, by.x = "id_pco", by.y = "id", all.x = TRUE)
      colnames(df_connections)[colnames(df_connections) == "sex"] <- "sex_pco"
      colnames(df_connections)[colnames(df_connections) == "ethnicity"] <- "ethnicity_pco"
      
      # create vars for: same_sex, same_ethnicity, rank_diff for child-parent, parent-pco, child_pco
      df_connections <- df_connections[,same_sex_child_parent := 1 * (sex_child == sex_parent)]
      df_connections <- df_connections[,same_sex_child_pco := 1 * (sex_child == sex_pco)]
      df_connections <- df_connections[,same_sex_parent_pco := 1 * (sex_parent == sex_pco)]
      
      df_connections <- df_connections[,same_ethnicity_child_pco := 1 * (ethnicity_child == ethnicity_pco)]
      
      df_connections <- df_connections[,rank_firm_diff_parent_pco := 1 * abs(rank_firm_parent - rank_firm_pco_past)]
      
      
      # get the sum of con_measure, number of different contacts, and average of all other vars
      
      df_connections <- df_connections[,
                                       .(duration_past = mean(duration_past ),
                                         lag_past = mean(lag_past ),
                                         log_firm_size_past = mean(log_firm_size_past ),
                                         rank_total_parent = mean(rank_total_parent ),
                                         rank_firm_parent = mean(rank_firm_parent ),
                                         rank_total_pco_past = mean(rank_total_pco_past ),
                                         rank_firm_pco_past = mean(rank_firm_pco_past ),
                                         log_firm_size_current = mean(log_firm_size_current ),
                                         sex_child = mean(sex_child ),
                                         sex_parent = mean(sex_parent ),
                                         sex_pco = mean(sex_pco ),
                                         ethnicity_child = mean(ethnicity_child ),
                                         ethnicity_pco = mean(ethnicity_pco ),
                                         education_child = mean(education_child ),
                                         same_sex_child_parent = mean(same_sex_child_parent ),
                                         same_sex_child_pco = mean(same_sex_child_pco ),
                                         same_ethnicity_child_pco = mean(same_ethnicity_child_pco ),
                                         rank_firm_diff_parent_pco = mean(rank_firm_diff_parent_pco )
                                       ),
                                       by = .(id,id_firm)]
      
      
      
      #  append the data
      
      if (count == 0) {
        df_all <- df_connections
      } else {
        df_all <- rbind(df_all,df_connections)
      }
      count = count + 1
      rm(df_connections)
    }
  }
  
  #  save the data (for each year separately)
  df <- df_all
  filename <- paste0(data, "connections_long_",t,".Rdata")
  save(df, file = filename)
  rm(df,df_all)
}


rm(df_population,df_children1,df_parents,employment_history)

