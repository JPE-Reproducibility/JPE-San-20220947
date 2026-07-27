###########################################################################
## simulate_location.R
## Synthetic raw ktovat/ktovet_<year>.dta (one per year), year-suffixed cols.
## Parameters from master_simulate.R.
###########################################################################
library(data.table); library(haven)

if (!exists("raw"))             raw             <- "./data/raw/"
if (!exists("sim_seed"))        sim_seed        <- 12345
if (!exists("years_addr"))      years_addr      <- 2000:2015
if (!exists("n_cities"))        n_cities        <- 100
if (!exists("n_districts"))     n_districts     <- 7
if (!exists("n_subdistricts"))  n_subdistricts  <- 15
if (!exists("n_neighborhoods")) n_neighborhoods <- 500
dir.create(paste0(raw, "ktovat/"), recursive = TRUE, showWarnings = FALSE)
set.seed(sim_seed)

pop <- as.data.table(read_dta(paste0(raw, "all_population.dta")))
ids <- pop[!is.na(tz), tz]

loc <- data.table(
  tz          = ids,
  city        = sample(1:n_cities,        length(ids), replace = TRUE),
  district    = sample(1:n_districts,     length(ids), replace = TRUE),
  subdistrict = sample(1:n_subdistricts,  length(ids), replace = TRUE),
  neighborhood= sample(1:n_neighborhoods, length(ids), replace = TRUE)
)

for (k in years_addr) {
  out <- copy(loc)
  setnames(out, c("district","subdistrict","city","neighborhood"),
    paste0(c("ktov_machoz_","ktov_nafa_","ktov_semel_yshuv_","ktov_ezor_stat_"), k))
  write_dta(out, paste0(raw, "ktovat/ktovet_", k, ".dta"))
}
message(sprintf("Wrote %d yearly ktovet files (%d-%d) for %d persons, cities 1:%d.",
                length(years_addr), min(years_addr), max(years_addr), length(ids), n_cities))
