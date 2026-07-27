############################################################################
## master_all.R  --  single entry point for the labor-networks replication
##
## The ONLY file you edit: the root (section 2) and the mode (section 1).
## This is also the only file that defines paths and creates folders; the three
## stage-masters (master_simulate / master_inter / master_output) inherit every
## path from here as ordinary R objects.
##
##   MODE A ("synthetic")  -- run EVERYTHING on synthetic data, any machine
##       Stage 0 SIMULATION       code/simulate/master_simulate.R  -> data/raw/
##       Stage 1 BTL / INTER      code/inter/master_inter.R        -> output/csv/
##       Stage 2 FIGURES & TABLES code/output/master_output.R      -> .tex, .pdf
##     Verifies the whole code path. Magnitudes are NOT the paper's.
##
##   MODE B ("real CSVs")  -- Stage 2 ONLY, any machine
##       Skips simulation + BTL. Stage 2 reads the cleared real-number CSVs in
##       output/csv_real/ and reproduces the paper's exhibits in ~2 minutes.
##
##   MODE C ("real microdata") -- Stages 1 -> 2, BTL environment only
##       Assumes the REAL raw files are already in data/raw/ and data/input/excel/.
##       Stage 0 is skipped on purpose: it would overwrite the real raw data with
##       synthetic files. Stage 1 writes the real analysis CSVs to output/csv/;
##       Stage 2 then builds the exhibits from them.
##
## How config flows: this file defines root + every path as plain objects and
## sources the stage-masters. 
############################################################################
rm(list = ls())
closeAllConnections()

## ==========================================================================
## 1. CHOOSE THE MODE
##      "A" = synthetic, all stages          (any machine)
##      "B" = real CSVs, Stage 2 only        (any machine)
##      "C" = real microdata, Stages 1 -> 2  (BTL environment)
## ==========================================================================
run_mode <- "A"

## ==========================================================================
## 2. ROOT  --  the one place to point at the package
## ==========================================================================
root <- "/PATH/TO/FILES/"  # <-- EDIT THIS LINE ONLY"
if (!grepl("/$", root)) root <- paste0(root, "/")

## ==========================================================================
## 3. ALL PATHS  --  single source of truth (edit folder names here only)
## ==========================================================================
if (!run_mode %in% c("A", "B", "C"))
  stop("run_mode must be 'A' (synthetic, all stages), 'B' (real CSVs, Stage 2 only), ",
       "or 'C' (real microdata, Stages 1-2).")

## -- code folders (one stage-master lives in each) --
process_simulate <- paste0(root, "code/simulate/")  # master_simulate.R + simulate_*.R
process          <- paste0(root, "code/inter/")     # master_inter.R + prepare_*/tables_*/functions_*
process_output   <- paste0(root, "code/output/")    # master_output.R + gen_tables.R + gen_figures.R

## -- data / input folders (read by Stage 0 and Stage 1) --
raw       <- paste0(root, "data/raw/")          # .dta  (mode A: Stage 0 writes | mode C: real data)
excel     <- paste0(root, "data/input/excel/")  # .xlsx crosswalks
input_csv <- paste0(root, "data/input/csv/")    # unemployment.csv etc. (Stage 2 reads)
data      <- paste0(root, "data/inter/")        # intermediate .Rdata (Stage 1 writes)

## -- output folders --
figures <- paste0(root, "output/figures/")      # Stage 2 .pdf
tables  <- paste0(root, "output/tables/")       # Stage 2 .tex
log     <- paste0(root, "log/")                 # stage logs

## -- Stage-2 CSV source depends on the mode --
##    A: synthetic CSVs written by Stage 1 | C: REAL CSVs written by Stage 1
##    B: real CSVs shipped with the package
output <- if (run_mode == "B") paste0(root, "output/csv_real/") else paste0(root, "output/csv/")

## ==========================================================================
## 4. CREATE FOLDERS IF THEY DO NOT EXIST + MODE-SPECIFIC CHECKS
## ==========================================================================
for (d in c(raw, excel, input_csv, data, figures, tables, log)) {
  if (!dir.exists(d)) dir.create(d, recursive = TRUE)
}

if (run_mode == "B") {
  ## the real CSVs ship with the package; fail early and clearly if missing
  if (!dir.exists(output))
    stop("Mode B needs the real CSVs in: ", output, " -- folder not found.")
  if (length(list.files(output, pattern = "\\.csv$")) == 0)
    stop("Mode B needs the real CSVs in: ", output, " -- folder is empty.")
} else {
  if (!dir.exists(output)) dir.create(output, recursive = TRUE)
}

if (run_mode == "C") {
  ## mode C expects the real microdata to be in place already
  if (length(list.files(raw, recursive = TRUE)) == 0)
    stop("Mode C expects the real raw microdata in: ", raw, " -- folder is empty.\n",
         "Place the BTL files there (see docs/codebook_raw_variables.csv). ",
         "Do NOT run mode A first: Stage 0 would overwrite them with synthetic files.")
  if (length(list.files(excel, pattern = "\\.xlsx$")) == 0)
    stop("Mode C expects the crosswalk .xlsx files in: ", excel, " -- none found.")
}

## ==========================================================================
## 5. RUN THE STAGES
## ==========================================================================
message("\n###### MODE ", run_mode, " ######")

## -- Stage 0: synthetic raw data (mode A only) --
if (run_mode == "A") {
  message("\n== STAGE 0: SIMULATION (synthetic raw data) ==")
  source(paste0(process_simulate, "master_simulate.R"))
} else if (run_mode == "C") {
  message("\n== STAGE 0: SKIPPED -- using the real microdata already in ", raw)
}
closeAllConnections()
## -- Stage 1: raw -> intermediates -> analysis CSVs (modes A and C) --
if (run_mode %in% c("A", "C")) {
  message("\n== STAGE 1: BTL / INTER PIPELINE ==")
  source(paste0(process, "master_inter.R"))
} else {
  message("\n== STAGES 0-1: SKIPPED -- Stage 2 reads the shipped real CSVs from ", output)
}
closeAllConnections()
## -- Stage 2: analysis CSVs -> exhibits (all modes) --
message("\n== STAGE 2: FIGURES & TABLES ==")
source(paste0(process_output, "master_output.R"))

message("\n###### PIPELINE COMPLETE (mode ", run_mode, ") ######")