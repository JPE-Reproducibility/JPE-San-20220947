###########################################################################
## prepare_sector.R
##
## Attaches sector classification to each firm and writes firm_industry_sector.Rdata.
##
## Input:
##   - firm_industry.Rdata   (from prepare_industry.R): object `df` with
##       id_firm, industry   (industry == 2-digit anaf == ind2d)
##   - sectors.xlsx          (crosswalk) with sheets:
##       ind2d2sector        : ind2d, sector           (2-digit -> section letter)
##       sector2main_sector  : sector, sector1, main_sector
##       public              : ind2d, public
##
## Output:
##   - firm_industry_sector.Rdata : object `df` with
##       id_firm, industry, sector, sector1, main_sector, public
##
## Consumers (tables_firm_var_sector.R, tables_hist_con.R,
## functions_reg_emp_con_long.R) load this file and use `df` -> id_firm,
## main_sector (and sector1 / public as bin variables), so the saved object
## MUST be named `df`.
###########################################################################

## ---- 1. firm -> industry (one row per firm) ----
filename <- paste0(data, "firm_industry.Rdata")
load(filename)                                   # object: df (id_firm, industry)
df_firm <- df
rm(df)

## ---- 2. read the sector crosswalk sheets ----
filename            <- paste0(excel, "sectors.xlsx")
ind2d2sector        <- as.data.table(read_xlsx(filename, sheet = "ind2d2sector"))       # ind2d, sector
sector2main_sector  <- as.data.table(read_xlsx(filename, sheet = "sector2main_sector")) # sector, sector1, main_sector
public              <- as.data.table(read_xlsx(filename, sheet = "public"))             # ind2d, public

## ---- 3. join: industry(ind2d) -> sector letter -> sector1/main_sector; + public ----
df <- merge(df_firm, ind2d2sector,
            by.x = "industry", by.y = "ind2d", all.x = TRUE)
df <- merge(df, sector2main_sector, by = "sector", all.x = TRUE)
df <- merge(df, public,
            by.x = "industry", by.y = "ind2d", all.x = TRUE)

## keep a clean, one-row-per-firm table
df <- unique(df[, .(id_firm, industry, sector, sector1, main_sector, public)])

## ---- 4. save ----
filename <- paste0(data, "firm_industry_sector.Rdata")
save(df, file = filename)

cat("firm_industry_sector.Rdata:", nrow(df), "firms;",
    df[is.na(main_sector), .N], "with unmatched sector (NA)\n")
rm(df, df_firm, ind2d2sector, sector2main_sector, public, filename)
