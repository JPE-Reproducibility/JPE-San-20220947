###########################################################################
## simulate_education.R
## Synthetic raw limodim.dta. Parameters from master_simulate.R.
###########################################################################
library(data.table); library(haven)

if (!exists("raw"))            raw            <- "./data/raw/"
if (!exists("sim_seed"))       sim_seed       <- 12345
if (!exists("n_institutions")) n_institutions <- 50
if (!exists("edu_share"))      edu_share      <- 0.60
if (!exists("kid_birth_min"))  kid_birth_min  <- 1978
set.seed(sim_seed)

pop <- as.data.table(read_dta(paste0(raw, "all_population.dta")))
pop <- pop[, .(tz, birth_year = yy_leda)]

young <- pop[birth_year >= kid_birth_min]
edu   <- young[runif(.N) < edu_share]

edu[, start_age := sample(18:22, .N, replace = TRUE)]
edu[, dur_years := sample(3:5,   .N, replace = TRUE)]
edu[, mtar_lim  := as.Date(paste0(birth_year + start_age,             "-10-01"))]
edu[, adtar_lim := as.Date(paste0(birth_year + start_age + dur_years, "-06-30"))]
edu[, kod_mosad := sample(1:n_institutions, .N, replace = TRUE)]

out <- edu[, .(tz, mtar_lim, adtar_lim, kod_mosad)]
write_dta(out, paste0(raw, "limodim.dta"))
message(sprintf("Wrote limodim.dta: %d study spells, institutions 1:%d.", nrow(out), n_institutions))
