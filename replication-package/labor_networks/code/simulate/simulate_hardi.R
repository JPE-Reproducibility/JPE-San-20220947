###########################################################################
## simulate_hardi.R
## Synthetic raw hardi.dta. Parameters from master_simulate.R.
###########################################################################
library(data.table); library(haven)

if (!exists("raw"))         raw         <- "./data/raw/"
if (!exists("sim_seed"))    sim_seed    <- 12345
if (!exists("hardi_share")) hardi_share <- 0.10
set.seed(sim_seed)

pop <- as.data.table(read_dta(paste0(raw, "all_population.dta")))
ids <- pop[!is.na(tz), tz]

hardi <- data.table(tz = ids[runif(length(ids)) < hardi_share], hardi = 1L)
write_dta(hardi, paste0(raw, "hardi.dta"))
message(sprintf("Wrote hardi.dta: %d ultra-orthodox individuals.", nrow(hardi)))
