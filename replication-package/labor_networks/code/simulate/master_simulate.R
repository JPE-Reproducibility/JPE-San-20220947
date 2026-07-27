###########################################################################
## master_simulate.R  --  STAGE 0 driver (synthetic raw data)
##
## Generates the SYNTHETIC raw dataset: fake CBS files (.dta) + input
## crosswalks (.xlsx), written to <raw>/ and <excel>/, so the real Stage-1
## pipeline (prepare_* -> tables_*) can run end-to-end on non-confidential
## data. Purpose is only to make the code RUN without 0-obs merges -- NOT to
## match the confidential data or the paper's results.
##
## Paths are inherited from master_all.R via env vars; run standalone and it
## falls back to the root default below. Does NOT rm(list=ls()) so it can be
## sourced by master_all without wiping the driver's objects.
##
## >>> ALL tunable simulation parameters live in section 3. This is the only
##     file you edit to change the synthetic data. <<<
###########################################################################

## ---- 1. Packages for this stage ----
sim_pkgs <- c("data.table", "haven", "writexl")
for (p in sim_pkgs) {
  if (!requireNamespace(p, quietly = TRUE))
    stop("Missing required package: ", p, ". Install it, then re-run.")
  library(p, character.only = TRUE)
}

## =========================================================================
## ---- 2. SIMULATION PARAMETERS  (the ONLY place to edit) -----------------
## =========================================================================
sim_seed        <- 12345

## -- sizes (denser => more co-workers / fuller connection categories) --
n_families      <- 60000    # families with linked children (parent-child links)
extra_adults    <- 60000    # unrelated adults (parents' co-worker pool)
n_firms         <- 3000     # firm universe (more firms -> full small..large range)
n_industries    <- 20       # firm industry codes 1:n_industries (sectors.xlsx must cover)
n_cities        <- 100      # locality codes (setl_mid_point.xlsx must cover)
n_institutions  <- 50       # education institution codes (crosswalk must cover)

## -- year ranges --
years_wage      <- 1991:2015
years_addr      <- 2000:2015

## -- cohorts / ages --
par_birth_min   <- 1930     # parents' birth-year range (older -> more 50+ workers for retirement fig)
par_birth_max   <- 1968
kid_gap_min     <- 24       # child born this many years after the father ...
kid_gap_max     <- 40
kid_birth_min   <- 1978     # ... then clamped into this child cohort
kid_birth_max   <- 1993
adult_birth_min <- 1930     # extra-adult birth-year range (older -> populate retirement ages)
adult_birth_max <- 1970
kids_base       <- 2L       # kids/family = kids_base + sum of Bernoulli(kid_p), capped at kids_max
kids_max        <- 6L
kid_p           <- c(.9, .8, .5, .3)

## -- employment / co-working density --
stay_prob       <- 0.92     # prob. a worker stays at the same firm next year
age_lo          <- 19       # working-age window kept in the wage files (1927 variant = 19)
age_hi          <- 80
salary_lmean    <- 11.5     # yearly wage ~ round(exp(rnorm(mean = salary_lmean, sd = salary_lsd)))
salary_lsd      <- 0.5
firm_size_lsd   <- 1.0      # WIDE spread -> genuine small (<5) and large (>500) firms
min_firm_size   <- 2        # allow genuinely small firms (child + 1 contact)
max_firm_size_mult <- 60    # loose cap -> large firms can exceed 500
entry_delay_probs <- c(.22,.18,.15,.12,.10,.09,.07,.04,.03)  # P(career starts 0..8 yrs after
# first eligible age) -> first-job ages span 19..27
retire_age_mean <- 63       # mean retirement age
retire_age_sd   <- 8        # sd of retirement age -> fatter lower tail reaches ages 50-52

## -- population shares --
immig_share     <- 0.25     # share of immigrants (ealia > 0, immigration year set)
death_share     <- 0.25     # share of older adults with a death year (higher -> real panel exits)
edu_share       <- 0.60     # share of young cohort with a study spell
hardi_share     <- 0.10     # share flagged ultra-orthodox
inst_drop_share <- 0.20     # share of institutions flagged F==1 (dropped downstream)

## -- geography granularity --
n_districts     <- 7
n_subdistricts  <- 15
n_neighborhoods <- 500
n_foreign_countries <- 10   # foreign birth-country codes 101:(100 + n_foreign_countries)
## =========================================================================

## ---- 3. Generate the synthetic raw files, in dependency order ----
## (population first: the other generators read it back to keep the id universe
##  consistent.)  Each generator runs in its OWN environment so it cannot delete
##  master variables; ALL parameters/paths are copied in explicitly via shared_vars.
shared_vars <- c("raw","excel","data","sim_seed",
                 "n_families","extra_adults","n_firms","n_industries","n_cities","n_institutions",
                 "years_wage","years_addr",
                 "par_birth_min","par_birth_max","kid_gap_min","kid_gap_max",
                 "kid_birth_min","kid_birth_max","adult_birth_min","adult_birth_max",
                 "kids_base","kids_max","kid_p",
                 "stay_prob","age_lo","age_hi","salary_lmean","salary_lsd","firm_size_lsd",
                 "min_firm_size","max_firm_size_mult","entry_delay_probs","retire_age_mean","retire_age_sd",
                 "immig_share","death_share","edu_share","hardi_share","inst_drop_share",
                 "n_districts","n_subdistricts","n_neighborhoods","n_foreign_countries")


message("== [1/6] all_population.dta ==");            source(paste0(process_simulate, "simulate_all_population.R"))
message("== [2/6] hardi.dta ==");                     source(paste0(process_simulate, "simulate_hardi.R"))
message("== [3/6] sachar/sachar_<year>.dta ==");      source(paste0(process_simulate, "simulate_wages.R"))
message("== [4/6] ktovat/ktovet_<year>.dta ==");      source(paste0(process_simulate, "simulate_location.R"))
message("== [5/6] limodim.dta ==");                   source(paste0(process_simulate, "simulate_education.R"))
message("== [6/6] excel crosswalks (birth_country, institutions, setl_mid_point, sectors) =="); source(paste0(process_simulate, "simulate_crosswalks.R"))

message("Synthetic raw data written under: ", raw, " and ", excel)
