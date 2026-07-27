###########################################################################
## simulate_crosswalks.R
## Four synthetic input crosswalks (.xlsx) with codes covering the raw data.
## Parameters from master_simulate.R.
###########################################################################
library(data.table); library(writexl)

if (!exists("excel"))               excel               <- "./data/input/excel/"
if (!exists("sim_seed"))            sim_seed            <- 12345
if (!exists("n_cities"))            n_cities            <- 100
if (!exists("n_institutions"))      n_institutions      <- 50
if (!exists("n_industries"))        n_industries        <- 20
if (!exists("n_foreign_countries")) n_foreign_countries <- 10
if (!exists("inst_drop_share"))     inst_drop_share     <- 0.20
dir.create(excel, recursive = TRUE, showWarnings = FALSE)
set.seed(sim_seed)

## ---- 1. birth_country.xlsx (sheet "data") ----
## 0 = Israel -> region 4 (native); foreign codes 101:(100+n) -> region 1:3
foreign_codes <- 101:(100 + n_foreign_countries)
birth_country <- data.table(
  birth_country     = c(0L, foreign_codes),
  birth_country_heb = c("Israel", paste0("Country_", foreign_codes)),
  birth_region1     = c(4L, sample(1:3, n_foreign_countries, replace = TRUE))
)
write_xlsx(list(data = as.data.frame(birth_country)),
           paste0(excel, "birth_country.xlsx"))

## ---- 2. educational_institutions_classification.xlsx (institution_id, F) ----
institutions <- data.table(
  institution_id = 1:n_institutions,
  F              = as.integer(runif(n_institutions) < inst_drop_share)
)
write_xlsx(list(institutions = as.data.frame(institutions)),
           paste0(excel, "educational_institutions_classification.xlsx"))

## ---- 3. setl_mid_point.xlsx (X, Y, setl_name_ltn, setl_code) ----
setl <- data.table(
  X            = round(runif(n_cities, 120000, 210000)),
  Y            = round(runif(n_cities, 380000, 780000)),
  setl_name_ltn= paste0("Locality_", 1:n_cities),
  setl_code    = 1:n_cities
)
write_xlsx(list(setl = as.data.frame(setl)),
           paste0(excel, "setl_mid_point.xlsx"))

## ---- 4. sectors.xlsx (covers ind2d = 1:n_industries) ----
ind2d       <- 1:n_industries
main_sector <- ((ind2d - 1) %% 10) + 1
sector_let  <- LETTERS[main_sector]

ind2d2sector       <- data.table(ind2d = ind2d, sector = sector_let)
sector2main_sector <- data.table(sector = LETTERS[1:10], sector1 = 1:10, main_sector = 1:10)
main_sectors       <- data.table(main_sector = 1:10, main_sector_name = paste0("Sector_", 1:10))
sectors_sheet      <- data.table(sector = LETTERS[1:10], sector_des_heb = "", sector1 = 1:10)
public_sheet       <- data.table(ind2d = ind2d, public = as.integer(ind2d %in% c(9,10,19,20)))

write_xlsx(list(sectors            = as.data.frame(sectors_sheet),
                main_sectors       = as.data.frame(main_sectors),
                ind2d2sector       = as.data.frame(ind2d2sector),
                sector2main_sector = as.data.frame(sector2main_sector),
                public             = as.data.frame(public_sheet)),
           paste0(excel, "sectors.xlsx"))

message("Wrote crosswalks: birth_country.xlsx, educational_institutions_classification.xlsx, ",
        "setl_mid_point.xlsx, sectors.xlsx")
