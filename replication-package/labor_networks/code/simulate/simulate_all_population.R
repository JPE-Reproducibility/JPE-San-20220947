###########################################################################
## simulate_all_population.R
## Synthetic raw all_population.dta with RAW column names for prepare_population.R.
## All parameters come from master_simulate.R (fallback defaults below).
###########################################################################
suppressMessages({library(data.table); library(haven)})

if (!exists("raw"))             raw             <- "./data/raw/"
if (!exists("sim_seed"))        sim_seed        <- 12345
if (!exists("n_families"))      n_families      <- 4000
if (!exists("extra_adults"))    extra_adults    <- 6000
if (!exists("par_birth_min"))   par_birth_min   <- 1950
if (!exists("par_birth_max"))   par_birth_max   <- 1968
if (!exists("kid_gap_min"))     kid_gap_min     <- 24
if (!exists("kid_gap_max"))     kid_gap_max     <- 40
if (!exists("kid_birth_min"))   kid_birth_min   <- 1978
if (!exists("kid_birth_max"))   kid_birth_max   <- 1993
if (!exists("adult_birth_min")) adult_birth_min <- 1950
if (!exists("adult_birth_max")) adult_birth_max <- 1970
if (!exists("kids_base"))       kids_base       <- 2L
if (!exists("kids_max"))        kids_max        <- 6L
if (!exists("kid_p"))           kid_p           <- c(.9,.8,.5,.3)
if (!exists("immig_share"))     immig_share     <- 0.25
if (!exists("death_share"))     death_share     <- 0.10
if (!exists("n_foreign_countries")) n_foreign_countries <- 10
if (!dir.exists(raw)) dir.create(raw, recursive = TRUE)
set.seed(sim_seed)

## ---- 1. Parents: one father + one mother per family ----
n_par  <- 2 * n_families
par_id <- 100000001:(100000000 + n_par)
dad_id <- par_id[seq(1, n_par, by = 2)]
mom_id <- par_id[seq(2, n_par, by = 2)]
dad_by <- sample(par_birth_min:par_birth_max, n_families, replace = TRUE)
mom_by <- dad_by + sample(-3:3, n_families, replace = TRUE)

parents <- data.table(
  tz      = c(dad_id, mom_id),
  zav     = NA_real_,
  zem     = NA_real_,
  min1    = c(rep(1L, n_families), rep(2L, n_families)),   # 1 male, 2 female
  yy_leda = c(dad_by, mom_by)
)

## ---- 2. Children: linked to a father & mother ----
kbern <- rowSums(sapply(kid_p, function(p) rbinom(n_families, 1, p)))
n_kids_fam <- pmin(kids_max, as.integer(kids_base) + as.integer(kbern))
kid_dad <- rep(dad_id, n_kids_fam)
kid_mom <- rep(mom_id, n_kids_fam)
kid_dby <- rep(dad_by, n_kids_fam)
n_kids  <- length(kid_dad)
kid_by  <- pmin(kid_birth_max, pmax(kid_birth_min,
              kid_dby + sample(kid_gap_min:kid_gap_max, n_kids, replace = TRUE)))
kid_id  <- (200000001):(200000000 + n_kids)

children <- data.table(
  tz      = kid_id,
  zav     = kid_dad,
  zem     = kid_mom,
  min1    = sample(1:2, n_kids, replace = TRUE),
  yy_leda = kid_by
)

## ---- 3. Extra adults (co-worker pool) ----
ea_id <- (300000001):(300000000 + extra_adults)
extra <- data.table(
  tz      = ea_id,
  zav     = NA_real_,
  zem     = NA_real_,
  min1    = sample(1:2, extra_adults, replace = TRUE),
  yy_leda = sample(adult_birth_min:adult_birth_max, extra_adults, replace = TRUE)
)

## ---- 4. Stack and add remaining registry fields ----
df <- rbindlist(list(parents, children, extra), use.names = TRUE)
setorder(df, tz)
N <- nrow(df)

df[, mm_leda := sample(1:12, N, replace = TRUE)]
df[, leom2 := sample(c(0L,1L,2L,3L,4L,NA_integer_), N, replace = TRUE,
                     prob = c(.80,.08,.05,.03,.02,.02))]

## birth_country (ealia): 0 = Israel-born (native). foreign codes 101:(100+n).
## birth_country.xlsx MUST map ealia==0 -> birth_region1==4 and foreign -> != 4.
foreign_codes <- 101:(100 + n_foreign_countries)
is_immig <- runif(N) < immig_share
df[, ealia := ifelse(is_immig, sample(foreign_codes, N, replace = TRUE), 0L)]
df[, immig := is_immig]
df[immig == TRUE,  yy_alia := pmin(2015L, yy_leda + sample(0:30, .N, replace = TRUE))]
df[immig == FALSE, yy_alia := NA_integer_]
df[, mm_alia := ifelse(is.na(yy_alia), NA_integer_, sample(1:12, N, replace = TRUE))]
df[, immig := NULL]

df[, dead := (yy_leda <= par_birth_max) & (runif(N) < death_share)]
df[dead == TRUE,  yy_ptira := pmin(2015L, pmax(yy_leda + 55L, yy_leda + sample(55:75, .N, replace = TRUE)))]
df[dead == FALSE, yy_ptira := NA_integer_]
df[, mm_ptira := ifelse(is.na(yy_ptira), NA_integer_, sample(1:12, N, replace = TRUE))]
df[, dead := NULL]

## ---- 5. Order like the raw registry and write ----
setcolorder(df, c("tz","zav","zem","leom2","ealia",
                  "yy_leda","mm_leda","yy_alia","mm_alia",
                  "yy_ptira","mm_ptira","min1"))
write_dta(df, paste0(raw, "all_population.dta"))
message(sprintf("Wrote all_population.dta : %d persons (%d parents, %d children, %d extra adults)",
                N, n_par, n_kids, extra_adults))
