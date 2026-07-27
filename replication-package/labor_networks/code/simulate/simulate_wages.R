###########################################################################
## simulate_wages.R
## Synthetic raw sachar/sachar_<year>.dta (one per year), RAW column names.
## Firms + co-workers are created here. Parameters from master_simulate.R.
##
## Firm sizes are CONTINUOUS: each firm gets a size weight (lognormal), and
## workers are assigned to firms with probability proportional to that weight.
## => a smooth size distribution: many small firms (single child-hire per year,
##    but still >1 worker so a contact exists) and some large firms (multi-hire,
##    dense co-working). A per-firm-year floor guarantees every firm-year that
##    exists has at least `min_firm_size` workers (so a hired child has a contact).
###########################################################################
library(data.table); library(haven)

if (!exists("raw"))           raw           <- "./data/raw/"
if (!exists("sim_seed"))      sim_seed      <- 12345
if (!exists("n_firms"))       n_firms       <- 200
if (!exists("n_industries"))  n_industries  <- 20
if (!exists("years_wage"))    years_wage    <- 1991:2015
if (!exists("stay_prob"))     stay_prob     <- 0.92
if (!exists("age_lo"))        age_lo        <- 19
if (!exists("age_hi"))        age_hi        <- 69
if (!exists("salary_lmean"))  salary_lmean  <- 11.5
if (!exists("salary_lsd"))    salary_lsd    <- 0.5
if (!exists("firm_size_lsd")) firm_size_lsd <- 1.1   # spread of firm sizes (lognormal sd of the weight)
if (!exists("min_firm_size")) min_firm_size <- 3     # min workers per firm-year (child + >=1 contact)
dir.create(paste0(raw, "sachar/"), recursive = TRUE, showWarnings = FALSE)
set.seed(sim_seed)

## person universe from the synthetic population
pop <- as.data.table(read_dta(paste0(raw, "all_population.dta")))
pop <- pop[, .(id = tz, birth_year = yy_leda)]
pop <- pop[!is.na(id) & !is.na(birth_year)]

## firm universe: fixed industry + a CONTINUOUS size weight (lognormal).
## The weight is truncated at the top so no firm becomes a giant, and the small
## end is handled by the min_firm_size floor below -> most firms land in the
## middle. firm_size_lsd controls the spread (smaller => tighter around the mean).
firms <- data.table(id_firm  = 1:n_firms,
                    industry = sample(1:n_industries, n_firms, replace = TRUE),
                    weight   = exp(rnorm(n_firms, mean = 0, sd = firm_size_lsd)))
## cap the upper tail: no firm gets more than max_weight_q times the median weight
max_weight_mult <- if (exists("max_firm_size_mult")) max_firm_size_mult else 4
firms[, weight := pmin(weight, median(weight) * max_weight_mult)]
firm_prob <- firms$weight / sum(firms$weight)

## person-year records over the working ages, with a per-person career-start
## delay so people don't all begin working at their first eligible year -> the
## year of the FIRST job (min year) varies -> entry ages spread across 19,20,21...
delay_probs <- if (exists("entry_delay_probs")) entry_delay_probs else c(.45,.30,.15,.07,.03)
delay_probs <- delay_probs / sum(delay_probs)
pop[, start_delay := sample(0:(length(delay_probs)-1), .N, replace = TRUE, prob = delay_probs)]

## per-person RETIREMENT age: people stop working at a retirement age drawn
## around the low-to-mid 60s (truncated at age_hi), so the last working age
## spreads into a realistic retirement hump instead of everyone censoring at the
## panel end. ret_mean/ret_sd are tunable (fall back to sensible defaults).
ret_mean <- if (exists("retire_age_mean")) retire_age_mean else 63
ret_sd   <- if (exists("retire_age_sd"))   retire_age_sd   else 3
pop[, retire_age := pmin(age_hi, pmax(age_lo + 25L,
                                      as.integer(round(rnorm(.N, mean = ret_mean, sd = ret_sd)))))]

py <- pop[, {
  yrs <- years_wage[years_wage - birth_year >= age_lo + start_delay &
                      years_wage - birth_year <= pmin(age_hi, retire_age)]
  if (length(yrs) == 0) NULL else .(year = yrs)
}, by = .(id, birth_year, start_delay, retire_age)]
py[, c("birth_year", "start_delay", "retire_age") := NULL]

## assign a firm to each person-year, weighted by firm size, with persistence
setorder(py, id, year)
py[, firm_draw := sample(n_firms, .N, replace = TRUE, prob = firm_prob)]
py[, switch := c(1L, as.integer(runif(.N - 1) > stay_prob)), by = id]
py[, id_firm := firm_draw]
py[, id_firm := id_firm[cummax(seq_len(.N) * switch)], by = id]
py[, c("firm_draw", "switch") := NULL]

## floor: drop firm-year cells that ended up smaller than min_firm_size
## (so every firm-year that remains can host a hired child AND a contact)
py[, fy_n := .N, by = .(id_firm, year)]
py <- py[fy_n >= min_firm_size]
py[, fy_n := NULL]

## attach industry + a positive salary
py <- merge(py, firms[, .(id_firm, industry)], by = "id_firm")
py[, yearly_salary := round(exp(rnorm(.N, mean = salary_lmean, sd = salary_lsd)), 2)]

## worked all 12 months (keeps month02==1, months=12)
month_names <- sprintf("sah_hs%02d", 1:12)
py[, (month_names) := 1L]

## write one raw .dta per year (raw column names)
setnames(py, c("id","id_firm","industry","yearly_salary"),
         c("tz","id_maavid","anaf","s_total"))
for (t in years_wage) {
  out <- py[year == t, c("tz","s_total","id_maavid","anaf", month_names, "year"), with = FALSE]
  write_dta(out, paste0(raw, "sachar/sachar_", t, ".dta"))
}
message(sprintf("Wrote %d yearly sachar files (%d-%d), %d firms, %d person-year rows.",
                length(years_wage), min(years_wage), max(years_wage), n_firms, nrow(py)))