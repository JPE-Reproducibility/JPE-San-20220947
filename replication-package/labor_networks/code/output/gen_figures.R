#########################################################################
### Figure 1: connections per worker by groups of workers and firms  ###
#########################################################################

df <- read.csv(paste0( output, "d_xyc_multiple2.csv"))
df <- data.table(df)

df[,con := connections * workers * jobs]
df[,group := 1 * (worker_type == 5 | worker_type == 6 | worker_type == 7 |worker_type == 8)]

df_group <- df[,.(workers = sum(workers), con = sum(con)) , by = .(group,job_type, con_type, year)]
df_group[, con_worker := con/workers]
df_group <- df_group[, .(con_worker = mean(con_worker)) ,  by = .(group,job_type, con_type)]
df_group <- df_group[con_type == 4 | con_type == 8]
df_group <- df_group[, group1 := 'Jews']
df_group <- df_group[group==1,group1:= 'Arabs']

g1 <-   ggplot(data=df_group[con_type == 4], aes(x= job_type, y=con_worker, color=group1 )) +
  geom_line()+
  geom_point() +
  ggtitle("A. Weak connections by ethnicity") +
  scale_colour_manual("",
                      labels = c('Jews',
                                 'Arabs'),
                      breaks = c("Jews", "Arabs"),
                      values = c("darkblue", "darkred") ) +
  labs(
    x= "Firm type",
    y= "Avergae connections per worker",
    color = ""  )  +
  theme_bw() +
  theme(  legend.position = c(.18,.85),
          legend.title = element_blank(),
          legend.key = element_rect(fill = "white",colour = "white"),
          axis.text=element_text(size=12),
          axis.title=element_text(size=12),
          legend.text=element_text(size=12),
          plot.title = element_text(hjust = 0.5,size=12)
  ) +
  ylim_s(0,21)

g2 <-   ggplot(data=df_group[con_type == 8], aes(x= job_type, y=con_worker, color=group1 )) +
  geom_line()+
  geom_point() +
  ggtitle("B. Strong connections by ethnicity") +
  scale_colour_manual("",
                      labels = c('Jews',
                                 'Arabs'),
                      breaks = c("Jews", "Arabs"),
                      values = c("darkblue", "darkred") ) +
  labs(
    x= "Firm type",
    y= "Avergae connections per worker",
    color = ""  )  +
  theme_bw() +
  theme(  legend.position = c(.18,.85),
          legend.title = element_blank(),
          legend.key = element_rect(fill = "white",colour = "white"),
          axis.text=element_text(size=12),
          axis.title=element_text(size=12),
          legend.text=element_text(size=12),
          plot.title = element_text(hjust = 0.5,size=12)
  ) +
  ylim_s(0,1)


df <- read.csv(paste0( output, "d_xyc_multiple2.csv"))
df <- data.table(df)

df[,con := connections * workers * jobs]
df[,group := 1 * (worker_type == 2 | worker_type == 4 | worker_type == 6 |worker_type == 8)]

df_group <- df[,.(workers = sum(workers), con = sum(con)) , by = .(group,job_type, con_type, year)]
df_group[, con_worker := con/workers]
df_group <- df_group[, .(con_worker = mean(con_worker)) ,  by = .(group,job_type, con_type)]
df_group <- df_group[con_type == 4 | con_type == 8]
df_group <- df_group[, group1 := 'Males']
df_group <- df_group[group==1,group1:= 'Females']

g3 <-   ggplot(data=df_group[con_type == 4], aes(x= job_type, y=con_worker, color=group1 )) +
  geom_line()+
  geom_point() +
  ggtitle("C. Weak connections by gender") +
  scale_colour_manual("",
                      labels = c('Males',
                                 'Females'),
                      breaks = c("Males", "Females"),
                      values = c("darkblue", "darkred") ) +
  labs(
    x= "Firm type",
    y= "Avergae connections per worker",
    color = ""  )  +
  theme_bw() +
  theme(  legend.position = c(.18,.85),
          legend.title = element_blank(),
          legend.key = element_rect(fill = "white",colour = "white"),
          axis.text=element_text(size=12),
          axis.title=element_text(size=12),
          legend.text=element_text(size=12),
          plot.title = element_text(hjust = 0.5,size=12)
  ) +
  ylim_s(0,21)

g4 <-   ggplot(data=df_group[con_type == 8], aes(x= job_type, y=con_worker, color=group1 )) +
  geom_line()+
  geom_point() +
  ggtitle("D. Strong connections by gender") +
  scale_colour_manual("",
                      labels = c('Males',
                                 'Females'),
                      breaks = c("Males", "Females"),
                      values = c("darkblue", "darkred") ) +
  labs(
    x= "Firm type",
    y= "Avergae connections per worker",
    color = ""  )  +
  theme_bw() +
  theme(  legend.position = c(.18,.85),
          legend.title = element_blank(),
          legend.key = element_rect(fill = "white",colour = "white"),
          axis.text=element_text(size=12),
          axis.title=element_text(size=12),
          legend.text=element_text(size=12),
          plot.title = element_text(hjust = 0.5,size=12)
  ) +
  ylim_s(0,1)


df <- read.csv(paste0( output, "d_xyc_multiple2.csv"))
df <- data.table(df)

df[,con := connections * workers * jobs]
df[,group := 1 * (worker_type == 3 | worker_type == 4 | worker_type == 7 |worker_type == 8)]

df_group <- df[,.(workers = sum(workers), con = sum(con)) , by = .(group,job_type, con_type, year)]
df_group[, con_worker := con/workers]
df_group <- df_group[, .(con_worker = mean(con_worker)) ,  by = .(group,job_type, con_type)]
df_group <- df_group[con_type == 4 | con_type == 8]
df_group <- df_group[, group1 := 'No college']
df_group <- df_group[group==1,group1:= 'College']


g <- grid.arrange(g1 , g2 ,g3 , g4,
                  ncol=2)


ggsave(paste0( figures, "figure_con_group.pdf"),g, width=8, height=9)




#################################################################
### Figure 2: Event study: effects of connections on employment  ###
#################################################################

# employment
df <- read.csv(paste0( output, "figure_reg_emp_con_event.csv"))

df = as.matrix(df)
df <- df[1,]

beta <- df[c(3:7,13:18)]
lb <- df[c(37:41,47:52)]
ub <- df[c(54:58,64:69)]
df <- data.table(t(rbind(beta,lb,ub)))
df[,t := -5:5]

ggplot(data=df, mapping=aes(x=t))+
  geom_vline(xintercept=-0.5,  color = "gray", size=.5)+
  geom_hline(yintercept=0,  color = "black", size=.5)+
  geom_ribbon(mapping=aes(ymin=ub, ymax=lb), fill='grey', alpha=0.5)+
  geom_point(mapping=aes(y=beta), col='#56B4E9', shape=16, size=2) +
  geom_line(mapping=aes(y=beta), col='#56B4E9') +
  labs(
    x= "Last year parent's coworker worked at the firm relative to child's labor-market entry year",
    y= "Employment probability difference"
  )+
  ylim_s(-0.01,0.08) +
  scale_x_continuous(breaks = -5:5, minor_breaks = NULL)+
theme_bw() +
  theme(axis.text=element_text(size=12),
        axis.title=element_text(size=12))

ggsave(paste0( figures, "figure_reg_emp_con_event.pdf"), width=8, height=4.5)



######################################################################
### Figure 3: effects of connections on employment : heterogeneity ###
######################################################################


myplots <- vector('list',18)

lables = c(
  "A. Parent's firm size",
  "B. Coworker's current firm size",
  "E. Parent's salary rank: overall",
  "F. Coworker's past salary rank: overall",
  "G. Parent's salary rank: firm",
  "H. Coworker's past salary rank: firm",
  "I. Parent-coworker rank difference: firm"
)
df1 <- read.csv(paste0( output, "figure_reg_emp_con_long1.csv"))
df1 = as.matrix(df1)

for ( k in 1:dim(df1)[1]){
  df <- df1[k,]
  bin_var = df[2]
  print(bin_var)
  beta <- as.numeric(df[3:12])
  lb <- as.numeric(df[23:32])
  ub <- as.numeric(df[33:42])
  df <- data.table(t(rbind(beta,lb,ub)))
  df[,bin := 1:10]
  
  myplots[[k]] <- ggplot(data=df, mapping=aes(x=bin))+
    geom_ribbon(mapping=aes(ymin=ub, ymax=lb), fill='grey', alpha=0.5)+
    geom_point(mapping=aes(y=beta), col='#56B4E9', shape=16, size=1) +
    geom_line(mapping=aes(y=beta), col='#56B4E9') +
    geom_hline(yintercept=0,  color = "black", size=.3)+
    labs(
      x= "Bin",
      y= ""
    )+
    scale_x_discrete(limits=c(1:10))+
    theme_bw() +
    ggtitle(lables[k]) +
    ylim_s(-0.03,0.3) +
    theme(axis.text=element_text(size=9),
          axis.title=element_text(size=9),
          plot.title = element_text(hjust = 0.5,size=9))
  
}


lables = c(
  "C. Length of co-working"
)
df1 <- read.csv(paste0( output, "figure_reg_emp_con_long2.csv"))
df1 = as.matrix(df1)

df <- df1[1,]
bin_var = df[2]
print(bin_var)
beta <- as.numeric(df[3:12])
lb <- as.numeric(df[23:32])
ub <- as.numeric(df[33:42])
df <- data.table(t(rbind(beta,lb,ub)))
df[,bin := 1:10]

myplots[[8]] <-  ggplot(data=df, mapping=aes(x=bin))+
  geom_ribbon(mapping=aes(ymin=ub, ymax=lb), fill='grey', alpha=0.5)+
  geom_point(mapping=aes(y=beta), col='#56B4E9', shape=16, size=1) +
  geom_line(mapping=aes(y=beta), col='#56B4E9') +
  geom_hline(yintercept=0,  color = "black", size=.3)+
  labs(
    x= "Years",
    y= ""
  )+
  scale_x_discrete(limits=c(1:10))+
  theme_bw() +
  ggtitle(lables[1]) +
  theme(axis.text=element_text(size=9),
        axis.title=element_text(size=9),
        plot.title = element_text(hjust = 0.5,size=9))


lables = c(
  "D. Time since co-working"
)
df1 <- read.csv(paste0( output, "figure_reg_emp_con_long3.csv"))
df1 = as.matrix(df1)

df <- df1[1,]
bin_var = df[2]
print(bin_var)
beta <- as.numeric(df[3:17])
lb <- as.numeric(df[33:47])
ub <- as.numeric(df[48:62])
df <- data.table(t(rbind(beta,lb,ub)))
df[,bin := 1:15]

myplots[[9]] <-  ggplot(data=df, mapping=aes(x=bin))+
  geom_ribbon(mapping=aes(ymin=ub, ymax=lb), fill='grey', alpha=0.5)+
  geom_point(mapping=aes(y=beta), col='#56B4E9', shape=16, size=1) +
  geom_line(mapping=aes(y=beta), col='#56B4E9') +
  geom_hline(yintercept=0,  color = "black", size=.3)+
  labs(
    x= "Years",
    y= ""
  )+
  ylim_s(-0.03,0.3) +
  scale_x_discrete(limits=c(1:15))+
  theme_bw() +
  ggtitle(lables[1]) +
  theme(axis.text=element_text(size=9),
        axis.title=element_text(size=9),
        plot.title = element_text(hjust = 0.5,size=9))


lables = c(
  "J. Child's gender",
  "K. Parent's gender",
  "L. Coworker's gender",
  "M. Child's ethnicity",
  "N. Coworker's ethnicity",
  "O. Child's education",
  "P. Gender child-parent",
  "Q. Gender child-coworker",
  "R. Ethnicity child-coworker"
)

bins_list <- list(
  c("Male", "Female"),
  c("Male", "Female"),
  c("Male", "Female"),
  c("Jew", "Arab"),
  c("Jew", "Arab"),
  c("No college", "College"),
  c("Different", "Same"),
  c("Different", "Same"),
  c("Different", "Same")
)

df1 <- read.csv(paste0( output, "figure_reg_emp_con_long4.csv"))
df1 = as.matrix(df1)

for ( k in 1:dim(df1)[1]){
  df <- df1[k,]
  bin_var = df[2]
  print(bin_var)
  beta <- as.numeric(df[3:4])
  lb <- as.numeric(df[7:8])
  ub <- as.numeric(df[9:10])
  df <- data.table(t(rbind(beta,lb,ub)))
  df[,bin := bins_list[k]]
  
  
  myplots[[k+9]] = ggplot(data = df) +
    geom_bar( aes(x=bin, y=beta), stat="identity", fill='#56B4E9', alpha=0.7) +
    geom_errorbar( aes(x=bin, ymin=lb, ymax=ub), width=0.2, colour="black", alpha=0.9, size=0.3)+
    labs(
      x= "",
      y= ""
    ) +
    theme_bw() +
    ggtitle(lables[k]) +
    ylim_s(0,0.3) +
    geom_hline(yintercept=0,  color = "black", size=.2)+
    theme(axis.text=element_text(size=9),
          axis.title=element_text(size=9),
          plot.title = element_text(hjust = 0.5,size=9))
  
}



# combine everything

left_title <- textGrob("Diff. weak-phantom",
                       rot=90,
                       gp = gpar(fontsize = 12, col="black"))

g <- grid.arrange(myplots[[1]], myplots[[2]],myplots[[8]],
                  myplots[[9]],myplots[[3]],myplots[[4]] ,
                  myplots[[5]], myplots[[6]],myplots[[7]],myplots[[10]], myplots[[11]],
                  myplots[[12]],
                  myplots[[13]],myplots[[14]] ,
                  myplots[[15]], myplots[[16]],
                  myplots[[17]],myplots[[18]],ncol=3,
                  left = left_title)


ggsave(paste0( figures, "figure_reg_emp_con_het.pdf"),g, width=8, height=9)



###################################################################################################################
### Figure 4: effects of connections on employment :  Heterogeneity by firm and match characteristics ###
###################################################################################################################
# Create list to store plots
myplots <- vector('list', 6)

# Labels for each subplot
lables <- c(
  "A. Mean match duration (bins)",
  "B. Mean match duration (sectors)",
  "C. SD of match duration (bins)", 
  "D. SD of match duration (sectors)",
  "E. Match effect (bins)",
  "F. Match effect (sectors)"
)

# Read first CSV file (duration_mean, duration_sd, akm_res)
df1 <- read.csv(paste0(output, "figure_reg_emp_con_long_firm.csv"))
df1 <- as.matrix(df1)

# LEFT COLUMN: Process first 3 variables from file 1 (bin plots)
for (k in 1:3) {
  # Each variable is 61 rows, starting at row (k-1)*61 + 1
  start_row <- (k - 1) * 61 + 1
  
  # Extract the section for this variable
  df_section <- df1[start_row:(start_row + 60), ]
  
  # Extract coefficients and bounds
  beta <- numeric(10)
  lb <- numeric(10)
  ub <- numeric(10)
  
  for (i in 1:10) {
    diff_name <- paste0("diff", i)
    lb_name <- paste0("diff", i, "_lb")
    ub_name <- paste0("diff", i, "_ub")
    
    beta[i] <- as.numeric(df_section[df_section[, 1] == diff_name, 2])
    lb[i] <- as.numeric(df_section[df_section[, 1] == lb_name, 2])
    ub[i] <- as.numeric(df_section[df_section[, 1] == ub_name, 2])
  }
  
  # Create data frame
  df <- data.table(beta = beta, lb = lb, ub = ub)
  df[, bin := 1:10]
  
  # Store in positions 1, 3, 5 (left column: A, C, E)
  plot_index <- (k - 1) * 2 + 1
  
  # Create plot
  myplots[[plot_index]] <- ggplot(data = df, mapping = aes(x = bin)) +
    geom_ribbon(mapping = aes(ymin = ub, ymax = lb), fill = 'grey', alpha = 0.5) +
    geom_point(mapping = aes(y = beta), col = '#56B4E9', shape = 16, size = 1) +
    geom_line(mapping = aes(y = beta), col = '#56B4E9') +
    geom_hline(yintercept = 0, color = "black", size = .3) +
    labs(
      x = "Bin",
      y = ""
    ) +
    scale_x_discrete(limits = c(1:10)) +
    theme_bw() +
    ggtitle(lables[plot_index]) +
    theme(
      axis.text = element_text(size = 9),
      axis.title = element_text(size = 9),
      plot.title = element_text(hjust = 0.5, size = 9)
    )
}

# Read sector-level means
sector_means <- read.csv(paste0(output, "table_firm_var_sector.csv"))
sector_means <- data.table(sector_means)

# Extract main_sector effects (first section, rows 1-61)
df_section <- df1[1:61, ]

# Extract coefficients for diff1-diff10 (the 10 sectors)
sector_effects <- numeric(10)
for (i in 1:10) {
  diff_name <- paste0("diff", i)
  sector_effects[i] <- as.numeric(df_section[df_section[, 1] == diff_name, 2])
}

# Create data frame combining effects and means
df_sector <- data.table(
  sector = 1:10,
  effect = sector_effects,
  duration_mean = sector_means$duration_mean,
  duration_sd = sector_means$duration_sd,
  duration_akm_res = sector_means$duration_akm_res
)

# Drop Mining (sector 2) and Other (sector 10)
df_sector <- df_sector[!(sector %in% c(2, 10))]

# Create three correlation plots for right column
# Plot B: Mean match duration (sectors)
myplots[[2]] <- ggplot(df_sector, aes(x = duration_mean, y = effect)) +
  geom_point(col = '#56B4E9', size = 3) +
  geom_smooth(method = "lm", se = FALSE, col = '#56B4E9') +
  labs(
    x = "Sector mean",
    y = ""
  ) +
  theme_bw() +
  ggtitle(lables[2]) +
  theme(
    axis.text = element_text(size = 9),
    axis.title = element_text(size = 9),
    plot.title = element_text(hjust = 0.5, size = 9)
  )

# Plot D: SD of match duration (sectors)
myplots[[4]] <- ggplot(df_sector, aes(x = duration_sd, y = effect)) +
  geom_point(col = '#56B4E9', size = 3) +
  geom_smooth(method = "lm", se = FALSE, col = '#56B4E9') +
  labs(
    x = "Sector mean",
    y = ""
  ) +
  theme_bw() +
  ggtitle(lables[4]) +
  theme(
    axis.text = element_text(size = 9),
    axis.title = element_text(size = 9),
    plot.title = element_text(hjust = 0.5, size = 9)
  )

# Plot F: Match effect (sectors)
myplots[[6]] <- ggplot(df_sector, aes(x = duration_akm_res, y = effect)) +
  geom_point(col = '#56B4E9', size = 3) +
  geom_smooth(method = "lm", se = FALSE, col = '#56B4E9') +
  labs(
    x = "Sector mean",
    y = ""
  ) +
  theme_bw() +
  ggtitle(lables[6]) +
  theme(
    axis.text = element_text(size = 9),
    axis.title = element_text(size = 9),
    plot.title = element_text(hjust = 0.5, size = 9)
  )

# Add common y-axis label
left_title <- textGrob("Diff. weak-phantom",
                       rot = 90,
                       gp = gpar(fontsize = 9, col = "black"))

# Arrange plots in 3x2 grid (3 rows, 2 columns)
# Row 1: A (bins) and B (sectors) - Mean match duration
# Row 2: C (bins) and D (sectors) - SD of match duration  
# Row 3: E (bins) and F (sectors) - Match effect
g <- grid.arrange(myplots[[1]], myplots[[2]],
                  myplots[[3]], myplots[[4]],
                  myplots[[5]], myplots[[6]],
                  ncol = 2,
                  left = left_title)

# Save the combined figure
ggsave(paste0(figures, "figure_reg_emp_con_long_firm.pdf"), g, width = 8, height = 8)

##########################################################
### Figure 5: Event study: effects of connections on salary  ###
##########################################################

df <- read.csv(paste0( output, "table_reg_salary_duration_con_event.csv"))

df = as.matrix(df)
df <- df[2,]

beta <- as.numeric(df[c(3:7,13:18)])
sd <-  as.numeric(df[c(20:24,30:35)])
lb <- beta - 1.96*sd
ub <-  beta + 1.96*sd
df <- data.table(t(rbind(beta,lb,ub)))
df[,t := -5:5]

ggplot(data=df, mapping=aes(x=t))+
  geom_vline(xintercept=-0.5,  color = "gray", size=.5)+
  geom_hline(yintercept=0,  color = "black", size=.5)+
  geom_ribbon(mapping=aes(ymin=ub, ymax=lb), fill='grey', alpha=0.5)+
  geom_point(mapping=aes(y=beta), col='#56B4E9', shape=16, size=2) +
  geom_line(mapping=aes(y=beta), col='#56B4E9') +
  labs(
    x= "Last year parent's coworker worked at the firm relative to child's labor-market entry year",
    y= "Log salary difference"
  )+     
  scale_x_continuous(breaks = -5:5, minor_breaks = NULL)+
  theme_bw() +
  theme(axis.text=element_text(size=12),
        axis.title=element_text(size=12))

ggsave(paste0( figures, "figure_reg_salary_con_event.pdf"), width=8, height=4.5)



##############################################
### Figure 6: Effect on wage and tenure: panel data  ###
##############################################

myplots <- vector('list',2)

lables = c(
  "A. Log salary",
  "B. Retention"
)

df1 = read.csv(paste0( output, "figure_children_panel.csv"))
df1 = as.data.table(df1)
df1 = df1[c(2,10)]



for (k in 1:nrow(df1)){
  print(k)
  df = data.table(t(df1[k,32:36]),t(df1[k,37:41]))
  setnames(df,c("diff","diff_se"))
  
  df[,diff_lb := diff - qnorm(0.975) * diff_se]
  df[,diff_ub := diff + qnorm(0.975) * diff_se]
  
  df[,p := 0:4]
  
  
  myplots[[k]] <- ggplot(data=df, mapping=aes(x=p))+
    geom_vline(xintercept=-0.5,  color = "gray", size=.5)+
    geom_hline(yintercept=0,  color = "black", size=.5)+
    geom_ribbon(mapping=aes(ymin=diff_ub, ymax=diff_lb), fill='grey', alpha=0.5)+
    geom_point(mapping=aes(y=diff), col='#56B4E9', shape=16, size=2) +
    geom_line(mapping=aes(y=diff), col='#56B4E9') +
    labs(
      x= NULL,
      y= NULL
    )+
    scale_x_continuous(breaks = 0:4, labels = as.character(0:4), expand = c(0.01, 0)) +
    coord_cartesian(xlim = c(-0.1, 4.1)) +
    theme_bw() +
    theme(axis.text=element_text(size= 12),
          axis.title=element_text(size= 12),
          plot.title = element_text(hjust = 0.5,size= 12))+
    ggtitle(lables[k]) 
}

bottom_title <- textGrob("Years after labor-market entry year",
                         gp = gpar(fontsize = 12, col="black"))

left_title <- textGrob("Diff. weak-phantom",
                       rot=90,
                       gp = gpar(fontsize = 12, col="black"))

g <- grid.arrange(myplots[[1]], myplots[[2]] ,
                  ncol=1,
                  left = left_title,
                  bottom = bottom_title)
ggsave(paste0(figures, "figure_wage_panel.pdf"), g, width=8, height=6)




#########################################
### Figure A1: histogram- group size ###
#########################################
# Read histogram data
df <- read.csv(paste0(output, "table_hist_group_size.csv"))
df <- data.table(df)
df[, workers := obs]

# Create two plots
myplots <- vector('list', 2)

# Panel A: Frequency of groups
myplots[[1]] <- ggplot(df, aes(x = mids, y = groups)) +
  geom_bar(stat = "identity", fill = '#56B4E9', color = "black", width = 0.45, size = 0.3) +
  labs(
    x = "Group size (log)",
    y = "Frequency"
  ) +
  ggtitle("A. Number of groups") +
  scale_y_continuous(expand = c(0, 0), limits = c(0, max(df$groups) * 1.05)) +
  theme_bw() +
  theme(
    axis.text = element_text(size = 12),
    axis.title = element_text(size = 12),
    plot.title = element_text(hjust = 0.5, size = 12),
    panel.grid.major = element_line(color = "gray90", size = 0.3),
    panel.grid.minor = element_blank(),
    panel.border = element_rect(color = "black", fill = NA, size = 0.5),
    axis.ticks = element_line(color = "black")
  )

# Panel B: Frequency of workers
myplots[[2]] <- ggplot(df, aes(x = mids, y = workers)) +
  geom_bar(stat = "identity", fill = '#56B4E9', color = "black", width = 0.45, size = 0.3) +
  labs(
    x = "Group size (log)",
    y = "Frequency"
  ) +
  ggtitle("B. Number of workers") +
  scale_y_continuous(expand = c(0, 0), limits = c(0, max(df$workers) * 1.05)) +
  theme_bw() +
  theme(
    axis.text = element_text(size = 12),
    axis.title = element_text(size = 12),
    plot.title = element_text(hjust = 0.5, size = 12),
    panel.grid.major = element_line(color = "gray90", size = 0.3),
    panel.grid.minor = element_blank(),
    panel.border = element_rect(color = "black", fill = NA, size = 0.5),
    axis.ticks = element_line(color = "black")
  )

# Arrange both plots side by side
g <- grid.arrange(myplots[[1]], myplots[[2]], ncol = 2)

# Save the figure
ggsave(paste0(figures, "figure_hist_group_size.pdf"), g, width = 10, height = 4.5)

##################################################################
### Figure A2: histogram of # connected firms per worker by type ###
##################################################################

df <- fread(paste0(output, "table_hist_con_worker.csv"))

df <- df[sex == -1 & ethnicity == -1]

if("V1" %in% names(df)) {
  df[, V1 := NULL]
}

con_type_labels <- c(
  "1" = "A. Phantom: 1",
  "2" = "B. Phantom: 2", 
  "3" = "C. Phantom: 3+",
  "4" = "D. Weak: 1",
  "5" = "E. Weak: 2",
  "6" = "F. Weak: 3+",
  "7" = "G. Mixed (phantom/weak)",
  "8" = "H. Strong"
)

myplots <- vector('list', 8)

for(k in 1:8) {
  df_subset <- df[con_type == k]
  
  df_subset <- df_subset[order(mins)]
  
  # For panels E (5), F (6), and H (8), use discrete x-axis
  if(k %in% c(5, 6, 8)) {
    # Use ceiling to convert to integer labels
    df_subset[, x_val := factor(ceiling(mins), levels = ceiling(mins))]
    
    myplots[[k]] <- ggplot(data = df_subset, aes(x = x_val, y = obs)) +
      geom_col(fill = '#56B4E9', alpha = 0.7, color = "black", width = 0.9, size = 0.3) +
      theme_bw() +
      labs(title = con_type_labels[as.character(k)],
           x = "",
           y = "") +
      theme(
        axis.text.x = element_text(size = 8),
        axis.text.y = element_text(size = 9),
        axis.title = element_text(size = 9),
        plot.title = element_text(hjust = 0.5, size = 9)
      ) +
      scale_y_continuous(labels = scales::comma)
  } else {
    # For other panels, use continuous x-axis with variable width
    df_subset[, bin_width := c(diff(mins), 2*(mids[.N] - mins[.N]))]
    
    myplots[[k]] <- ggplot(data = df_subset, aes(x = mins, y = obs, width = bin_width)) +
      geom_col(fill = '#56B4E9', alpha = 0.7, color = "black", size = 0.3) +
      theme_bw() +
      labs(title = con_type_labels[as.character(k)],
           x = "",
           y = "") +
      theme(
        axis.text.x = element_text(size = 8),
        axis.text.y = element_text(size = 9),
        axis.title = element_text(size = 9),
        plot.title = element_text(hjust = 0.5, size = 9)
      ) +
      scale_x_continuous(breaks = function(x) {
        pretty_breaks <- pretty(x, n = 5)
        unique(floor(pretty_breaks))
      }) +
      scale_y_continuous(labels = scales::comma)
  }
}

# Create axis labels
bottom_title <- textGrob("Number of connected firms per worker",
                         gp = gpar(fontsize = 12, col = "black"))

left_title <- textGrob("Count",
                       rot = 90,
                       gp = gpar(fontsize = 12, col = "black"))

# Arrange plots in 4x2 grid
g <- grid.arrange(
  myplots[[1]], myplots[[2]], 
  myplots[[3]], myplots[[4]],
  myplots[[5]], myplots[[6]], 
  myplots[[7]], myplots[[8]],
  ncol = 2,
  left = left_title,
  bottom = bottom_title
)

ggsave(paste0(figures, "figure_hist_con_worker.pdf"), g, width = 8, height = 8)

##################################################################
### Figure A3: histogram of fpast irm size by connection type  ###
##################################################################

df <- fread(paste0(output, "table_hist_con_past_firmsize_multiple2.csv"))

df[, V1 := NULL]

bin_width <- df[con_type == 1]$mids[2] - df[con_type == 1]$mids[1]

myplots <- vector('list', 8)

for(k in 1:8) {
  df_subset <- df[con_type == k]
  
  myplots[[k]] <- ggplot(data = df_subset, aes(x = mids, y = obs)) +
    geom_col(fill = '#56B4E9', alpha = 0.7, color = "black", width = bin_width, size = 0.3) +
    theme_bw() +
    labs(title = con_type_labels[as.character(k)],
         x = "",
         y = "") +
    theme(
      axis.text.x = element_text(size = 8),
      axis.text.y = element_text(size = 9),
      axis.title = element_text(size = 9),
      plot.title = element_text(hjust = 0.5, size = 9)
    ) +
    scale_y_continuous(labels = scales::comma)
}

# Create axis labels
bottom_title <- textGrob("Log past firm size",
                         gp = gpar(fontsize = 12, col = "black"))

left_title <- textGrob("Count",
                       rot = 90,
                       gp = gpar(fontsize = 12, col = "black"))

g <- grid.arrange(
  myplots[[1]], myplots[[2]], 
  myplots[[3]], myplots[[4]],
  myplots[[5]], myplots[[6]], 
  myplots[[7]], myplots[[8]],
  ncol = 2,
  left = left_title,
  bottom = bottom_title
)

ggsave(paste0(figures, "figure_hist_con_past_firmsize_multiple2.pdf"), g, width = 8, height = 8)

##################################################################
### Figure A4: histogram of current firm size by connection type  ###
##################################################################

# Read the CSV file
df <- fread(paste0(output, "table_hist_con_current_firmsize_multiple2.csv"))

# Remove the first column (row numbers from CSV)
df[, V1 := NULL]

# Calculate bin width
bin_width <- df[con_type == 1]$mids[2] - df[con_type == 1]$mids[1]

# Connection type labels matching gen_figures.R style
con_type_labels <- c(
  "1" = "A. Phantom: 1",
  "2" = "B. Phantom: 2", 
  "3" = "C. Phantom: 3+",
  "4" = "D. Weak: 1",
  "5" = "E. Weak: 2",
  "6" = "F. Weak: 3+",
  "7" = "G. Mixed (phantom/weak)",
  "8" = "H. Strong"
)

# Create list to store plots
myplots <- vector('list', 8)

# Generate histograms for each connection type
for(k in 1:8) {
  df_subset <- df[con_type == k]
  
  myplots[[k]] <- ggplot(data = df_subset, aes(x = mids, y = obs)) +
    geom_col(fill = '#56B4E9', alpha = 0.7, color = "black", width = bin_width, size = 0.3) +
    theme_bw() +
    labs(title = con_type_labels[as.character(k)],
         x = "",
         y = "") +
    theme(
      axis.text.x = element_text(size = 8),
      axis.text.y = element_text(size = 9),
      axis.title = element_text(size = 9),
      plot.title = element_text(hjust = 0.5, size = 9)
    ) +
    scale_y_continuous(labels = scales::comma)
}

# Create axis labels
bottom_title <- textGrob("Log current firm size",
                         gp = gpar(fontsize = 12, col = "black"))

left_title <- textGrob("Count",
                       rot = 90,
                       gp = gpar(fontsize = 12, col = "black"))

# Arrange plots in 4x2 grid
g <- grid.arrange(
  myplots[[1]], myplots[[2]], 
  myplots[[3]], myplots[[4]],
  myplots[[5]], myplots[[6]], 
  myplots[[7]], myplots[[8]],
  ncol = 2,
  left = left_title,
  bottom = bottom_title
)

# Save the figure
ggsave(paste0(figures, "figure_hist_con_current_firmsize_multiple2.pdf"), g, width = 8, height = 8)



#########################################################
### Figure A5: raw data: mean employment by max_lag ###
#########################################################
df <- read.csv(paste0( output, "figure_raw_emp_con.csv"))


df <-  as.data.table(df)
df <- df[(con_type == 1 & max_lag <0) | con_type == 2 ]
df <- df[,.(max_lag,employment )]
df <- df[order(max_lag),]
df <- df[,employment := 100 * employment]

# employment figure
ggplot(data=df, mapping=aes(x=max_lag))+
  geom_vline(xintercept=-0.5,  color = "gray", size=.5)+
  geom_hline(yintercept=0,  color = "black", size=.5)+
  geom_point(mapping=aes(y=employment), col='#56B4E9', shape=16, size=2) +
  geom_line(mapping=aes(y=employment),  col='#56B4E9') +
  labs(
    x= "Last year parent's coworker worked at the firm relative to child's labor-market entry year",
    y= "Probability of working at the firm"
  )+
  scale_x_continuous(breaks = -5:5, minor_breaks = NULL)+
  ylim_s(0,0.16) +
  theme_bw()
ggsave(paste0( figures, "figure_raw_emp_con.pdf"), width=8, height=4.5)



###################################################################
### Figure A6: Event study: effects of connections on employment by group  ###
###################################################################

# employment

myplots <- vector('list',4)

lables = c(
  "A. Jews",
  "B. Arabs",
  "C. Males",
  "D. Females"
)

df1 <- read.csv(paste0( output, "figure_reg_emp_con_event.csv"))

df1 = as.matrix(df1)

df1 <- df1[2:5,]

for ( k in 1:dim(df1)[1]){
  df <- df1[k,]
  
  beta <- df[c(3:7,13:18)]
  lb <- df[c(37:41,47:52)]
  ub <- df[c(54:58,64:69)]
  df <- data.table(t(rbind(beta,lb,ub)))
  df[,t := -5:5]
  
  
  
  
  myplots[[k]] <- ggplot(data=df, mapping=aes(x=t))+
    geom_vline(xintercept=-0.5,  color = "gray", size=.5)+
    geom_hline(yintercept=0,  color = "black", size=.5)+
    geom_ribbon(mapping=aes(ymin=ub, ymax=lb), fill='grey', alpha=0.5)+
    geom_point(mapping=aes(y=beta), col='#56B4E9', shape=16, size=2) +
    geom_line(mapping=aes(y=beta), col='#56B4E9') +
    labs(
      x= NULL,
      y= NULL
    )+
    scale_x_continuous(breaks = -5:5, minor_breaks = NULL)+
  theme_bw() +
    theme(axis.text=element_text(size= 12),
          axis.title=element_text(size= 12),
          plot.title = element_text(hjust = 0.5,size= 12))+
    ggtitle(lables[k]) 
  
}

bottom_title <- textGrob("Last year parent's coworker worked at the firm relative to child's labor-market entry year",
                         gp = gpar(fontsize = 12, col="black"))

left_title <- textGrob("Employment probability difference",
                       rot=90,
                       gp = gpar(fontsize = 12, col="black"))

g <- grid.arrange(myplots[[1]], myplots[[2]],myplots[[3]],myplots[[4]] ,
                  ncol=2,
                  left = left_title,
                  bottom = bottom_title)

ggsave(paste0( figures, "figure_reg_emp_con_event_group.pdf"), g, width=8, height=4.5)




#####################################################################
### Figure A7: Event study: effects of connections on employment: extensive  ###
#####################################################################

# employment

myplots <- vector('list',3)

lables = c(
  "A. Employment at age 25",
  "B. Employment one year after graduation",
  "C. First stable job in ages 19-27"
)

df1 <- read.csv(paste0( output, "figure_reg_emp_con_event_25.csv"))
df2 <- read.csv(paste0( output, "figure_reg_emp_con_event_grad1.csv"))
df3 <- read.csv(paste0( output, "figure_reg_emp_con_event_1927.csv"))

df1 = as.matrix(df1)
df2 = as.matrix(df2)
df3 = as.matrix(df3)

df1 <- rbind( df1[1,],df2[1,],df3[1,])

for ( k in 1:dim(df1)[1]){
  df <- df1[k,]
  
  beta <- df[c(3:7,13:18)]
  lb <- df[c(37:41,47:52)]
  ub <- df[c(54:58,64:69)]
  df <- data.table(t(rbind(beta,lb,ub)))
  df[,t := -5:5]
  
  myplots[[k]] <- ggplot(data=df, mapping=aes(x=t))+
    geom_vline(xintercept=-0.5,  color = "gray", size=.5)+
    geom_hline(yintercept=0,  color = "black", size=.5)+
    geom_ribbon(mapping=aes(ymin=ub, ymax=lb), fill='grey', alpha=0.5)+
    geom_point(mapping=aes(y=beta), col='#56B4E9', shape=16, size=2) +
    geom_line(mapping=aes(y=beta), col='#56B4E9') +
    labs(
      x= NULL,
      y= NULL
    )+
    scale_x_continuous(breaks = -5:5, minor_breaks = NULL)+
  ylim_c_s(-0.01,0.08)+
    theme_bw() +
    theme(axis.text=element_text(size= 12),
          axis.title=element_text(size= 12),
          plot.title = element_text(hjust = 0.5,size= 12))+
    ggtitle(lables[k]) 
  
}

bottom_title <- textGrob("Last year parent's coworker worked at the firm relative to child's labor-market entry year",
                         gp = gpar(fontsize = 12, col="black"))

left_title <- textGrob("Employment probability difference",
                       rot=90,
                       gp = gpar(fontsize = 12, col="black"))

g <- grid.arrange(myplots[[1]], myplots[[2]], myplots[[3]],
                  ncol=1,
                  left = left_title,
                  bottom = bottom_title)

ggsave(paste0( figures, "figure_reg_emp_con_event_extensive.pdf"), g, width=8, height=8)




############################################################################
### Figure A8: Ratio weak-phantom by age at first job and ethnicity     ###
############################################################################

df <- read.csv(paste0( output, "table_reg_emp_con_1927_entry_age.csv"))
df <- data.table(df)

# 5 subgroups stacked per age, in the canonical order used throughout:
# 1 All, 2 Jews, 3 Arabs, 4 Males, 5 Females
df[, sub := 1:.N, by = a]

myplots <- vector('list',3)

lables = c(
  "A. All",
  "B. Jews",
  "C. Arabs"
)

for ( k in 1:3){
  
  dfk <- df[sub == k]
  
  myplots[[k]] <- ggplot(data=dfk, mapping=aes(x=a))+
    geom_ribbon(mapping=aes(ymin=ratio21_lb, ymax=ratio21_ub), fill='grey', alpha=0.5)+
    geom_point(mapping=aes(y=ratio21), col='#56B4E9', shape=16, size=2) +
    geom_line(mapping=aes(y=ratio21), col='#56B4E9') +
    labs(
      x= NULL,
      y= NULL
    )+
    scale_x_continuous(breaks = 19:27)+
    ylim_c_s(0,10)+
    theme_bw() +
    theme(axis.text=element_text(size= 12),
          axis.title=element_text(size= 12),
          plot.title = element_text(hjust = 0.5,size= 12))+
    ggtitle(lables[k])
}

bottom_title <- textGrob("Age at first job",
                         gp = gpar(fontsize = 12, col="black"))

left_title <- textGrob("Ratio weak-phantom",
                       rot=90,
                       gp = gpar(fontsize = 12, col="black"))

g <- grid.arrange(myplots[[1]], myplots[[2]], myplots[[3]],
                  ncol=1,
                  left = left_title,
                  bottom = bottom_title)

ggsave(paste0( figures, "figure_reg_emp_con_entry_age.pdf"), g, width=8, height=8)
##########################################################################
### Figure A9: Event study: effects of connections on employment: number of jobs  ###
##########################################################################

myplots <- vector('list',2)

lables = c(
  "A. Firms with a single hire",
  "B. Firms with multiple hires")

df1 <- read.csv(paste0( output, "figure_reg_emp_con_event_one_job.csv"))
df2 <- read.csv(paste0( output, "figure_reg_emp_con_event_multiple_jobs.csv"))

df1 = as.matrix(df1)
df2 = as.matrix(df2)

df1 <- rbind( df1[1,],df2[1,])

for ( k in 1:dim(df1)[1]){
  df <- df1[k,]
  
  beta <- df[c(3:7,13:18)]
  lb <- df[c(37:41,47:52)]
  ub <- df[c(54:58,64:69)]
  df <- data.table(t(rbind(beta,lb,ub)))
  df[,t := -5:5]
  
  myplots[[k]] <- ggplot(data=df, mapping=aes(x=t))+
    geom_vline(xintercept=-0.5,  color = "gray", size=.5)+
    geom_hline(yintercept=0,  color = "black", size=.5)+
    geom_ribbon(mapping=aes(ymin=ub, ymax=lb), fill='grey', alpha=0.5)+
    geom_point(mapping=aes(y=beta), col='#56B4E9', shape=16, size=2) +
    geom_line(mapping=aes(y=beta), col='#56B4E9') +
    labs(
      x= NULL,
      y= NULL
    )+
    scale_x_continuous(breaks = -5:5, minor_breaks = NULL)+
    ylim_c_s(0,0.1)+
    theme_bw() +
    theme(axis.text=element_text(size= 12),
          axis.title=element_text(size= 12),
          plot.title = element_text(hjust = 0.5,size= 12))+
    ggtitle(lables[k]) 
  
}

bottom_title <- textGrob("Last year parent's coworker worked at the firm relative to child's labor-market entry year",
                         gp = gpar(fontsize = 12, col="black"))

left_title <- textGrob("Employment probability difference",
                       rot=90,
                       gp = gpar(fontsize = 12, col="black"))

g <- grid.arrange(myplots[[1]], myplots[[2]],
                  ncol=1,
                  left = left_title,
                  bottom = bottom_title)

ggsave(paste0( figures, "figure_reg_emp_con_event_jobs.pdf"), g, width=8, height=6)



##########################################################
### Figure A10: Placebo: effects of connections on employment  ###
##########################################################

# employment
df <- read.csv(paste0( output, "figure_reg_emp_con_placebo_event.csv"))

df = as.matrix(df)
df <- df[1,]

beta <- df[c(3:7,13:18)]
lb <- df[c(37:41,47:52)]
ub <- df[c(54:58,64:69)]
df <- data.table(t(rbind(beta,lb,ub)))
df[,t := -5:5]

ggplot(data=df, mapping=aes(x=t))+
  geom_vline(xintercept=-0.5,  color = "gray", size=.5)+
  geom_hline(yintercept=0,  color = "black", size=.5)+
  geom_ribbon(mapping=aes(ymin=ub, ymax=lb), fill='grey', alpha=0.5)+
  geom_point(mapping=aes(y=beta), col='#56B4E9', shape=16, size=2) +
  geom_line(mapping=aes(y=beta), col='#56B4E9') +
  labs(
    x= "Last year parent's coworker worked at the firm relative to child's labor-market entry year",
    y= "Employment probability difference"
  )+
  ylim_s(-0.01,0.08) +
  scale_x_continuous(breaks = -5:5, minor_breaks = NULL)+
  theme_bw() +
  theme(axis.text=element_text(size=12),
        axis.title=element_text(size=12))

ggsave(paste0( figures, "figure_reg_emp_con_placebo_event.pdf"), width=8, height=4.5)


#######################
### Figure A11: retirement age  ###
#######################

# employment
df <- read.csv(paste0( output, "table_retirement.csv"))
df <- data.table(df)
df[,sex1 := "Males"]
df[sex == 1,sex1 := "Females"]

df <- df[last_age >= 50]
df[, Frequency := N/sum(N), by = "sex"]

g1 <- ggplot(data=df[sex == 0], mapping=aes(x=last_age))+
  geom_point(mapping=aes(y=Frequency), col='#56B4E9', shape=16,size=3) +
  ggtitle("A. Males") +
  
  labs(
    x= "Age",
    y= "Frequency ",
    color = ""  )  +
  theme_bw() +
  theme(axis.text=element_text(size=12),
        axis.title=element_text(size=12),
        plot.title = element_text(hjust = 0.5,size=12))

g2 = ggplot(data=df[sex == 1], mapping=aes(x=last_age))+
  geom_point(mapping=aes(y=Frequency), col='#56B4E9', shape=16,size=3) +
  ggtitle("B. Females") +
  
  labs(
    x= "Age",
    y= "Frequency ",
    color = ""  )  +
  theme_bw() +
  theme(axis.text=element_text(size=12),
        axis.title=element_text(size=12),
        plot.title = element_text(hjust = 0.5,size=12))

g <- grid.arrange(g1,g2,
                  ncol=1)


ggsave(paste0( figures, "figure_retirement_age.pdf"),g, width=8, height=6)


###################################################
### Figure A12: Heterogeneity: effect by gender and sector ###
##################################################

df1 <- read.csv(paste0( output, "figure_reg_emp_con_long_sector_sex.csv"))
df1 <- as.matrix(df1)

beta <- numeric(20)
lb <- numeric(20)
ub <- numeric(20)

for (i in 1:20) {

    diff_name <- paste0("diff", i)
  lb_name <- paste0("diff", i, "_lb")
  ub_name <- paste0("diff", i, "_ub")
  
  beta[i] <- as.numeric(df1[df1[,1] == diff_name, 2])
  lb[i] <- as.numeric(df1[df1[,1] == lb_name, 2])
  ub[i] <- as.numeric(df1[df1[,1] == ub_name, 2])
}


sector_labels <- c(
  "Agriculture",
  "Mining",
  "Construction",
  "Manufacturing",
  "Transport/Comm/Utilities",
  "Wholesale/Retail",
  "Finance",
  "Services",
  "Public",
  "Other"
)

df_male <- data.table(
  beta = beta[1:10], 
  lb = lb[1:10], 
  ub = ub[1:10],
  sector = sector_labels,
  gender = "Male"
)

df_female <- data.table(
  beta = beta[11:20], 
  lb = lb[11:20], 
  ub = ub[11:20],
  sector = sector_labels,
  gender = "Female"
)

df <- rbind(df_male, df_female)

df <- df[!(sector %in% c("Mining", "Other"))]

sector_labels_filtered <- c(
  "Agriculture",
  "Construction",
  "Manufacturing",
  "Transport/Comm/Utilities",
  "Wholesale/Retail",
  "Finance",
  "Services",
  "Public"
)

df[, sector := factor(sector, levels = sector_labels_filtered)]

ggplot(data = df, aes(x = sector, y = beta, fill = gender)) +
  geom_bar(stat = "identity", position = position_dodge(0.8), alpha = 0.7, width = 0.7) +
  geom_errorbar(aes(ymin = lb, ymax = ub), 
                position = position_dodge(0.8), 
                width = 0.2, 
                colour = "black", 
                alpha = 0.9, 
                size = 0.3) +
  scale_fill_manual(values = c("Male" = "#56B4E9", "Female" = "#E9566A")) +
  labs(
    x = "",
    y = "Diff. weak-phantom",
    fill = ""
  ) +
  theme_bw() +
  geom_hline(yintercept = 0, color = "black", size = .2) +
  theme(
    axis.text = element_text(size = 9),
    axis.text.x = element_text(angle = 45, hjust = 1),
    axis.title = element_text(size = 9),
    plot.title = element_text(hjust = 0.5, size = 9),
    legend.position = c(0.9, 0.85),
    legend.key = element_rect(fill = "white", colour = "white")
  )


ggsave(paste0( figures, "figure_reg_emp_con_long_sector_sex.pdf"), width=8, height=4.5)

###########################################################
### Figure A13: Heterogeneity: effect by year and unemployment rate ###
###########################################################

df1 <- read.csv(paste0( output, "figure_reg_emp_con_long_year.csv"))
df1 <-  as.data.table(df1)
df1 <- df1[bin_var == "year" & type == "diff", .(year = bin_lable, beta,lb,ub)]

df2 <- read.csv(paste0( input_csv, "unemployment.csv"))
df2 <-  as.data.table(df2)
df2[,unemployment_rate := unemployment_rate/100]
df <- merge(df1,df2, by = "year")
df[,yaer := as.character(year)]

ggplot(df, aes(x=unemployment_rate, y=beta)) + 
  geom_point() +
  geom_smooth(method=lm, col='#56B4E9') +
labs(
  x= "Unemployment rate",
  y= "Diff. weak-phantom"
) + 
  geom_text(aes(label=year), size = 3, position = position_dodge(width = 0),
     vjust = -0.5, size = 2
  )

summary(felm(beta~unemployment_rate | 0 | 0 | year ,df))
df[,cor(unemployment_rate,beta)]
ggsave(paste0( figures, "figure_emp_con_unemp.pdf"), width=8, height=4.5)

