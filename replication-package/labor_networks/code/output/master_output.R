############################################################################
## master_output.R  --  STAGE 2 driver (analysis CSVs -> figures & tables)
##
## Reads the analysis CSVs and writes the paper's tables (.tex) and figures
## (.pdf). The CSV source folder is `output`, set by master_all.R per mode:
##   mode A -> output/csv/       (synthetic CSVs written by Stage 1)
##   mode B -> output/csv_real/  (real-number CSVs shipped with the package)
##   mode C -> output/csv/       (REAL CSVs written by Stage 1 inside BTL)
##
## Paths (process_output, output, input_csv, figures, tables) are inherited
## from master_all.R. This file does NOT rm(list=ls()), so it can be sourced
## by master_all without wiping the driver's objects.
############################################################################

## ---- 0. Guard: paths must come from master_all.R ----
if (!exists("process_output") || !exists("output") || !exists("figures") || !exists("tables"))
  stop("Run this via master_all.R (it defines root and all paths).")
if (!dir.exists(output))
  stop("CSV source folder not found: ", output)

## ---- 1. Packages for this stage ----
output_pkgs <- c("ggplot2", "readxl", "data.table", "ggpubr", "xtable",
                 "stargazer", "gridExtra", "RColorBrewer", "ggrastr",
                 "grid", "gridtext", "lfe", "lubridate", "scales")
for (p in output_pkgs) {
  if (!requireNamespace(p, quietly = TRUE))
    stop("Missing required package: ", p, ". Install it, then re-run.")
  library(p, character.only = TRUE)
}

## ---- 2. Aliases for the CSV source ----
## the gen scripts refer to the CSV folder as `output` (and, historically, as
## `csv_btl`); define both so either name resolves to the mode's folder.
csv_btl <- output

## ---- 3. Axis scaling ----
## Real numbers (modes B and C) use the published fixed axes. Synthetic values
## (mode A) fall outside those limits and would be clipped, so they auto-scale.
SIMULATED <- identical(run_mode, "A")
ylim_s   <- function(lo, hi) if (SIMULATED) NULL else ggplot2::ylim(lo, hi)
ylim_c_s <- function(lo, hi) if (SIMULATED) ggplot2::scale_y_continuous() else
  ggplot2::scale_y_continuous(limits = c(lo, hi))

## ---- 4. Build tables, then figures ----
message("== Building tables  (CSV source: ", output, ") ==")
source(paste0(process_output, "gen_tables.R"))

message("== Building figures (SIMULATED = ", SIMULATED, ") ==")
source(paste0(process_output, "gen_figures.R"))

## ---- 5. Close anything the gen scripts left open ----
while (sink.number() > 0) sink()
closeAllConnections()

message("Stage 2 complete. Tables -> ", tables, " | Figures -> ", figures)