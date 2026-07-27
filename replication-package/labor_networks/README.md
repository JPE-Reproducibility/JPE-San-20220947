# README — Replication package for "Timing is Everything: Parental Professional Connections and Labor Market Entry"

Shmuel San — Journal of Political Economy, 2026

This README follows the Social Science Data Editors template and the JPE Data and Code
Policy.

**Quick start:** open `master_all.R`, set `run_mode` (section 1) and `root` (section 2),
and run it. Those two lines are the only edits this package requires. To reproduce the
paper's exhibits with the **real numbers**, set `run_mode <- "B"` (≈ 2 minutes).

---

## 1. Data Availability Statement (DAS)

The core analysis uses **confidential administrative microdata from the Israel
Bituach Leumi (National Insurance) Institute (BTL)**, accessed in the BTL protected
research environment. These data **cannot be published** in the replication package due to
legal and confidentiality restrictions.

This package complies via the following:

- **All code** that transforms the raw data into analysis data and exhibits is included
  (Stages 1 and 2 below), even though the raw data are not.
- The **analysis data** — the aggregated, non-confidential CSV files that directly produce
  every table and figure with the paper's real numbers — **are included** in
  `output/csv_real/`. These contain no individual-level records and were cleared for
  release from the BTL environment.
- A **synthetic-data generator** (Stage 0 below) is included, which simulates raw files
  with the same schema as the confidential BTL data. This lets a replicator **run the
  entire pipeline end to end outside BTL** on non-confidential synthetic data, verifying
  that all code executes and produces every exhibit. The synthetic run reproduces the
  *code path and file structure*, not the paper's magnitudes or results.
- Reproducibility is therefore layered: Stage 2 on `output/csv_real/` is fully
  reproducible by anyone and returns the paper's numbers; Stages 0+1 (synthetic raw → CSV →
  exhibits) are fully runnable by anyone on synthetic data; Stage 1 on the *real* BTL
  microdata is reproducible only inside the BTL environment by researchers with approved
  access.

**Accessing the raw BTL data.** Access requires a formal application, institutional
affiliation, execution of a BTL data-use agreement, and physical attendance in the BTL
protected research environment in Jerusalem. The application process and associated costs
(monetary and time) are determined by the BTL and are subject to change. All details can
be found at:
https://www.btl.gov.il/Mediniyut/HadarMehkar/Pages/default.aspx

**Data included in this package**:

- `output/csv_real/*.csv` — the cleared analysis CSVs (real numbers) that produce every exhibit.
- `unemployment.csv` — World Bank, "Unemployment, total (% of total labor force)"
  (modeled ILO estimate), ILOSTAT; accessed 29 Sep 2022. Used for Figure A13.

**Data excluded** from the package, obtained through the BTL and covered by the same
confidentiality restrictions:

- Raw microdata (`data/raw/`): `all_population.dta`, `hardi.dta`, `limodim.dta`,
  `sachar/sachar_<year>.dta` (1991–2015), `ktovat/ktovet_<year>.dta` (2000–2015).
- Classification crosswalks (`data/input/excel/`): `birth_country.xlsx`,
  `educational_institutions_classification.xlsx`, `setl_mid_point.xlsx`, `sectors.xlsx`.

Their full schema — every file, sheet, variable, rename and reading script — is documented
in **§7 (Codebook)** below, and the synthetic generator in `code/simulate/` recreates
synthetic versions of exactly these files, so the pipeline runs end to end without them.

---

## 2. Description of the replication package

The pipeline has **three stages**.

```
STAGE 0  SIMULATION (any machine, synthetic data only)
  code/simulate/master_simulate.R
    -> simulates raw .dta + .xlsx with the BTL schema  -> data/raw/, data/input/excel/

STAGE 1  BTL / INTER PIPELINE (BTL server on real data; any machine on synthetic data)
  code/inter/master_inter.R
    -> code/inter/prepare_*.R  -> intermediate .Rdata   (data/inter/)
    -> code/inter/tables_*.R   -> analysis CSVs          (output/csv/)   ==cleared/ship==>

STAGE 2  FIGURES & TABLES (any machine)
  code/output/master_output.R
    -> code/output/gen_tables.R   -> output/tables/*.tex
    -> code/output/gen_figures.R  -> output/figures/*.pdf
    (reads the mode's CSV source folder + data/input/csv/unemployment.csv)
```

**`master_all.R` is the single entry point.** It is the only file that defines paths; it
creates any missing folders and runs the stages required by the chosen mode. The three
stage-masters inherit every path from it and each loads its own packages.

```r
run_mode <- "A"   # section 1 of master_all.R
root     <- "..." # section 2 of master_all.R
```

| mode | meaning | stages run | Stage-2 CSV source | numbers | where |
|---|---|---|---|---|---|
| **A** | synthetic | 0 → 1 → 2 | `output/csv/` (written by Stage 1) | synthetic | any machine |
| **B** | real CSVs | 2 only | `output/csv_real/` (shipped) | **the paper's** | any machine |
| **C** | real microdata | 1 → 2 | `output/csv/` (written by Stage 1) | **the paper's** | BTL only |

Package layout:

```
master_all.R                     single entry point: root, mode, all paths, folder creation
README.md   (this file)          LICENSE
code/
  simulate/  master_simulate.R + simulate_*.R                              Stage 0
  inter/     master_inter.R + prepare_*.R, tables_*.R, functions_*.R       Stage 1
  output/    master_output.R + gen_tables.R, gen_figures.R                 Stage 2
data/
  raw/          BTL .dta      [OMITTED; mode A writes synthetic, mode C reads real]
  input/excel/  crosswalk .xlsx   [OMITTED; mode A writes synthetic, mode C reads real]
  input/csv/    external input (unemployment.csv)   [INCLUDED]
  inter/        intermediate .Rdata written by Stage 1              [generated]
output/
  csv/          analysis CSVs written by Stage 1 (modes A and C)    [generated]
  csv_real/     analysis CSVs cleared from BTL — the real numbers   [INCLUDED]
  tables/       *.tex exhibits    [generated]
  figures/      *.pdf exhibits    [generated]
log/            run logs
```

**Note on the two CSV folders.** Stage 1 writes its analysis CSVs to `output/csv/`, which is
exactly where Stage 2 reads them in modes A and C.
`output/csv_real/` holds the same files with the **real** numbers, cleared out of the BTL
environment; mode B reads those. The two folders have identical file names and column
structure, so the same Stage-2 code produces the exhibits from either.

**Axis scaling.** `master_output.R` sets `SIMULATED <- identical(run_mode, "A")`. Modes B and
C (real numbers) use the published fixed axis limits; mode A auto-scales, because synthetic
magnitudes fall outside the published limits and would otherwise be clipped.

---

## 3. Reproducibility scope

- **Fully reproducible, no special access, real numbers:** every table and figure, via
  **mode B** on the included `output/csv_real/` CSVs.
- **Fully runnable end-to-end on synthetic data, no special access:** **mode A**
  (Stages 0→1→2) executes every `simulate_*`, `prepare_*` and `tables_*` script and produces
  all exhibits from simulated data — a check that the *code* runs and the file wiring is
  correct. Magnitudes are not meaningful.
- **Reproducible with the real numbers only in the BTL environment:** **mode C** (Stage 1 on
  the real `.dta`, ≈ 48 hours). Code is provided; execution requires approved BTL access.

---

## 4. Instructions to replicators

**The only edits required are `root` and `run_mode`, both at the top of `master_all.R`.**
`master_all.R` derives every other path from `root`, creates any missing folders, checks the
mode's preconditions, and runs the stages. Do not set paths anywhere else; no other file
needs editing.

Install R 4.x and the packages listed in §5. Each stage-master loads and checks its own
packages and stops with a clear message if one is missing.

### Mode A — run everything on synthetic data (any machine)

1. In `master_all.R`: set `root`; set `run_mode <- "A"`.
2. Run `master_all.R`. It runs Stage 0 (simulate raw data → `data/raw/`), Stage 1 (build
   CSVs → `output/csv/`), then Stage 2 (build exhibits).
3. Outputs: `output/tables/*.tex`, `output/figures/*.pdf`. **Numbers are synthetic** — this
   mode verifies that the code runs, not the paper's results.
4. Run time ≈ 48 hours (dominated by Stage 1); Stage 0 ≈ 2 minutes, Stage 2 ≈ 2 minutes.

### Mode B — reproduce the paper's exhibits from the included real CSVs (any machine)

1. In `master_all.R`: set `root`; set `run_mode <- "B"`.
2. Run `master_all.R`. It skips Stages 0 and 1 and runs Stage 2 on `output/csv_real/`.
3. Outputs: `output/tables/*.tex`, `output/figures/*.pdf` — **the paper's exhibits with the
   real numbers**. Run time ≈ 2 minutes.

### Mode C — Stage 1 on the real BTL microdata (BTL environment only)

1. Place the raw BTL files under `data/raw/` and the crosswalk `.xlsx` files under
   `data/input/excel/`, using the names and variables documented in §7 (Codebook).
2. In `master_all.R`: set `root`; set `run_mode <- "C"`.
3. Run `master_all.R`. It **skips Stage 0**, runs Stage 1 → real analysis CSVs in `output/csv/`, then Stage 2 → exhibits.
   Run time ≈ 48 hours.
4. Clear the CSVs in `output/csv/` through the BTL disclosure-control process. The cleared
   files are what ship as `output/csv_real/` for mode B.

---

## 5. Computational requirements

- Software: R version 4.5.2 (2025-10-31). Package versions (from `sessionInfo()`):
  - Stage 0: data.table 1.18.2.1, haven 2.5.5, writexl 1.5.4
  - Stage 1: readxl 1.4.5, data.table 1.18.2.1, ggplot2 4.0.2, haven 2.5.5, lfe 3.1.1,
    stargazer 5.2.3, stringr 1.6.0, lubridate 1.9.5, survival 3.8-3, plotrix 3.8-14
  - Stage 2: ggplot2 4.0.2, readxl 1.4.5, data.table 1.18.2.1, ggpubr 0.6.3, xtable 1.8-4,
    stargazer 5.2.3, gridExtra 2.3, RColorBrewer 1.1-3, ggrastr 1.0.2, gridtext 0.1.6,
    lfe 3.1.1, lubridate 1.9.5, scales 1.4.0
- Operating system / hardware used by the author: macOS Monterey 12.7.6, platform
  aarch64-apple-darwin20 (Apple silicon, 64-bit), with 8 GB of RAM and 50 GB of free disk space.
- Approximate run time: Stage 0: 2 minutes; Stage 1: 48 hours; Stage 2: 2 minutes.
  Mode B therefore reproduces every exhibit in ≈ 2 minutes.
- Random seeds: the synthetic generator sets `sim_seed` (in `code/simulate/master_simulate.R`);
  the bootstrap table scripts set `set.seed(12345)` at the beginning of each `tables_*.R`
  script (so they can also be run separately).

---

## 6. List of exhibits and how code maps to them

Every paper exhibit, the file it is written to, the script that builds it, and the analysis
CSV(s) it reads. Input CSVs are read from the mode's CSV source folder (`output/csv_real/` in
mode B, `output/csv/` in modes A and C). Summary:

| Exhibit | Output file | Built by | Input CSV(s) |
|---|---|---|---|
| Table 1 | table_summary_children_body.tex | gen_tables.R | table_summary_children_multiple2.csv |
| Table 2 | table_reg_emp_con_multiple2_body.tex | gen_tables.R | table_reg_emp_con_multiple2.csv |
| Table 3 | table_reg_employment_panel_body.tex | gen_tables.R | table_reg_children_panel_employment.csv |
| Table 4 | table_reg_salary_duration_con_multiple2_body.tex | gen_tables.R | table_reg_salary_duration_con_multiple2.csv |
| Table 5 | table_reg_salary_subs_5years_multiple2_body.tex | gen_tables.R | table_reg_panel_total_5years_multiple2.csv |
| Table A1 | table_summary_firms_body.tex | gen_tables.R | table_summary_firms.csv |
| Table A2 | table_reg_emp_con_event_full_body.tex | gen_tables.R | figure_reg_emp_con_event.csv |
| Table A3 | table_reg_emp_con_multiple2_firm_size_body.tex | gen_tables.R | table_reg_emp_con_multiple2_firm_size.csv |
| Table A4 | table_reg_balancing_body.tex | gen_tables.R | table_reg_balancing.csv |
| Table A5 | table_reg_emp_con_exit_body.tex | gen_tables.R | table_reg_emp_con_exit.csv |
| Table A6 | table_reg_emp_con_placebo_body.tex | gen_tables.R | table_reg_emp_con_placebo.csv |
| Table A7 | table_reg_salary_duration_con_multiple2_ethnicity_body.tex | gen_tables.R | table_reg_salary_duration_con_multiple2.csv |
| Table A8 | table_reg_salary_duration_con_multiple2_gender_body.tex | gen_tables.R | table_reg_salary_duration_con_multiple2.csv |
| Figure 1 | figure_con_group.pdf | gen_figures.R | d_xyc_multiple2.csv |
| Figure 2 | figure_reg_emp_con_event.pdf | gen_figures.R | figure_reg_emp_con_event.csv |
| Figure 3 | figure_reg_emp_con_het.pdf | gen_figures.R | figure_reg_emp_con_long1.csv … long4.csv |
| Figure 4 | figure_reg_emp_con_long_firm.pdf | gen_figures.R | figure_reg_emp_con_long_firm.csv; table_firm_var_sector.csv |
| Figure 5 | figure_reg_salary_con_event.pdf | gen_figures.R | table_reg_salary_duration_con_event.csv |
| Figure 6 | figure_wage_panel.pdf | gen_figures.R | figure_children_panel.csv |
| Figure A1 | figure_hist_group_size.pdf | gen_figures.R | table_hist_group_size.csv |
| Figure A2 | figure_hist_con_worker.pdf | gen_figures.R | table_hist_con_worker.csv |
| Figure A3 | figure_hist_con_past_firmsize_multiple2.pdf | gen_figures.R | table_hist_con_past_firmsize_multiple2.csv |
| Figure A4 | figure_hist_con_current_firmsize_multiple2.pdf | gen_figures.R | table_hist_con_current_firmsize_multiple2.csv |
| Figure A5 | figure_raw_emp_con.pdf | gen_figures.R | table_raw_emp_con.csv |
| Figure A6 | figure_reg_emp_con_event_group.pdf | gen_figures.R | figure_reg_emp_con_event.csv |
| Figure A7 | figure_reg_emp_con_event_extensive.pdf | gen_figures.R | figure_reg_emp_con_event_25/grad1/1927.csv |
| Figure A8 | figure_reg_emp_con_entry_age.pdf | gen_figures.R | table_reg_emp_con_1927_entry_age.csv |
| Figure A9 | figure_reg_emp_con_event_jobs.pdf | gen_figures.R | figure_reg_emp_con_event_one_job.csv; …_multiple_jobs.csv |
| Figure A10 | figure_reg_emp_con_placebo_event.pdf | gen_figures.R | figure_reg_emp_con_placebo_event.csv |
| Figure A11 | figure_retirement_age.pdf | gen_figures.R | table_retirement.csv |
| Figure A12 | figure_reg_emp_con_long_sector_sex.pdf | gen_figures.R | figure_reg_emp_con_long_sector_sex.csv |
| Figure A13 | figure_emp_con_unemp.pdf | gen_figures.R | figure_reg_emp_con_long_year.csv; unemployment.csv |

---

## 7. Codebook: raw source files and variables

The BTL raw microdata and the BTL classification crosswalks are **not included** (see §1).
This codebook documents their schema so a replicator with approved BTL access can place the
files correctly for mode C, and so the structure of the synthetic files written by Stage 0
is fully specified. Variables are listed under the file they come from, with the name the
pipeline renames them to.

**`all_population.dta`** — folder `data/raw/`, Stata .dta  
*Read by:* prepare_population.R

| original variable | renamed to | notes |
|---|---|---|
| `tz` | id | national ID (teudat zehut) |
| `zav` | id_father | father's ID |
| `zem` | id_mother | mother's ID |
| `leom2` | nation | nationality/ethnic-group code (le'om) |
| `ealia` | birth_country | birth-country code |
| `yy_leda` | birth_year | year of birth (leda) |
| `mm_leda` | birth_month | month of birth (leda) |
| `yy_alia` | immigration_year | year of immigration (aliya) |
| `mm_alia` | immigration_month | month of immigration (aliya) |
| `yy_ptira` | death_year | year of death (ptira) |
| `mm_ptira` | death_month | month of death (ptira) |
| `min1` | sex | sex (min); recoded to sex-1 |

**`hardi.dta`** — folder `data/raw/`, Stata .dta  
*Read by:* prepare_population.R

| original variable | renamed to | notes |
|---|---|---|
| `tz` | id | national ID |
| `hardi` | ultraorthodox | ultra-orthodox indicator (haredi) |

**`limodim.dta`** — folder `data/raw/`, Stata .dta  
*Read by:* prepare_education.R

| original variable | renamed to | notes |
|---|---|---|
| `tz` | id | national ID |
| `mtar_lim` | start_date | study start date (me'tarich limudim) |
| `adtar_lim` | end_date | study end date (ad-tarich limudim) |
| `kod_mosad` | institution_id | institution code (kod mosad) |

**`sachar/sachar_<year>.dta`** — folder `data/raw/`, Stata .dta, years 1991-2015  
*Read by:* prepare_wages.R; prepare_wages_total.R; prepare_wages_1927.R; prepare_industry.R; tables_retirement.R

| original variable | renamed to | notes |
|---|---|---|
| `tz` | id | national ID |
| `s_total` | yearly_salary | total annual wage (sachar total) |
| `id_maavid` | id_firm | employer ID (maavid) |
| `anaf` | industry | industry/branch (anaf) |
| `sah_hs01` | month01 | worked-in-month indicator Jan |
| `sah_hs02` | month02 | worked-in-month indicator Feb |
| `sah_hs03` | month03 | worked-in-month indicator Mar |
| `sah_hs04` | month04 | worked-in-month indicator Apr |
| `sah_hs05` | month05 | worked-in-month indicator May |
| `sah_hs06` | month06 | worked-in-month indicator Jun |
| `sah_hs07` | month07 | worked-in-month indicator Jul |
| `sah_hs08` | month08 | worked-in-month indicator Aug |
| `sah_hs09` | month09 | worked-in-month indicator Sep |
| `sah_hs10` | month10 | worked-in-month indicator Oct |
| `sah_hs11` | month11 | worked-in-month indicator Nov |
| `sah_hs12` | month12 | worked-in-month indicator Dec |
| `year` | (dropped) | present in raw; set to NULL during cleaning |

**`ktovat/ktovet_<year>.dta`** — folder `data/raw/`, Stata .dta, years 2000-2015  
*Read by:* prepare_location.R

| original variable | renamed to | notes |
|---|---|---|
| `tz` | id | national ID |
| `ktov_machoz_<year>` | district | address district (machoz); column has year suffix |
| `ktov_nafa_<year>` | subdistrict | address sub-district (nafa); column has year suffix |
| `ktov_semel_yshuv_<year>` | city | locality code (semel yishuv); column has year suffix |
| `ktov_ezor_stat_<year>` | neighborhood | statistical area (ezor stat); column has year suffix |

**`birth_country.xlsx`** — folder `data/input/excel/`, Excel (sheet 'data')  
*Read by:* prepare_population.R

| original variable | renamed to | notes |
|---|---|---|
| `birth_country` | birth_country | join key to population 'ealia' |
| `birth_country_heb` | (dropped) | Hebrew country name; set to NULL |
| `birth_region1` | birth_region1 | region code used to define 'native' |

**`educational_institutions_classification.xlsx`** — folder `data/input/excel/`, Excel  
*Read by:* prepare_education.R

| original variable | renamed to | notes |
|---|---|---|
| `institution_id` | institution_id | join key to limodim 'kod_mosad' |
| `F` | F | drop-flag (F==1 => religious/high-school/art/unknown dropped) |

**`setl_mid_point.xlsx`** — folder `data/input/excel/`, Excel  
*Read by:* prepare_location.R

| original variable | renamed to | notes |
|---|---|---|
| `setl_code` | setl_code | locality code; join key to 'city' |
| `setl_name_ltn` | setl_name_ltn | locality name (Latin) |
| `X` | X | locality centroid X coord |
| `Y` | Y | locality centroid Y coord |

**`sectors.xlsx (sheet: sectors)`** — folder `data/input/excel/`, Excel  
*Read by:* prepare_sector.R

| original variable | renamed to | notes |
|---|---|---|
| `sector` | sector (letter A-U) | CBS 1-digit industry section letter |
| `sector_des_heb` | (Hebrew description) | Hebrew name of the section |
| `sector1` | sector1 | fine sector code 1-21 (used as a bin var in the long figures) |

**`sectors.xlsx (sheet: main_sectors)`** — folder `data/input/excel/`, Excel  
*Read by:* prepare_sector.R

| original variable | renamed to | notes |
|---|---|---|
| `main_sector` | main_sector | coarse sector code 1-10 |
| `main_sector_name` | main_sector_name | English label: 1 Agriculture,2 Mining,3 Construction,4 Manufacturing,5 Transport/Comm/Utilities,6 Wholesale&Retail,7 Finance,8 Services,9 Public,10 Other |

**`sectors.xlsx (sheet: ind2d2sector)`** — folder `data/input/excel/`, Excel  
*Read by:* prepare_sector.R

| original variable | renamed to | notes |
|---|---|---|
| `ind2d` | ind2d | 2-digit industry code (matches 'anaf'/industry from sachar); maps to sector letter |
| `sector` | sector | section letter for each ind2d |

**`sectors.xlsx (sheet: sector2main_sector)`** — folder `data/input/excel/`, Excel  
*Read by:* prepare_sector.R

| original variable | renamed to | notes |
|---|---|---|
| `sector; sector1; main_sector` | (crosswalk) | maps section letter -> sector1 -> main_sector |

**`sectors.xlsx (sheet: public)`** — folder `data/input/excel/`, Excel  
*Read by:* prepare_sector.R

| original variable | renamed to | notes |
|---|---|---|
| `ind2d; public` | public | 0/1 public-sector flag by 2-digit industry |

---

## 8. Data and code citations

- Israel Bituach Leumi (National Insurance) Institute. Administrative microdata accessed in
  the BTL protected research environment. Wage data originate with the
  Tax Authority; demographics, ultra-orthodox status and location with the Population and
  Immigration Authority; education data with the BTL.
- World Bank. Unemployment, total (% of total labor force) (modeled ILO estimate).
  International Labour Organization, ILOSTAT. Accessed 29 Sep 2022.

---

## 9. License

The entire package — code, data, and documentation — is licensed under **CC BY 4.0**
(Creative Commons Attribution 4.0 International). See the `LICENSE` file at the package
root. This permits unrestricted access to every file in the deposit and use of the package
for replication by researchers unconnected to the authors.

**Not covered:** the confidential BTL microdata are not included and not licensed here;
rights rest with the data providers and access is governed by the BTL data-use agreement
(§1). `unemployment.csv` is reused from the World Bank / ILOSTAT under CC BY 4.0
(attribution in §8).

---

## 10. Omissions

The BTL raw `.dta` microdata and the BTL classification crosswalks (`.xlsx`) are omitted
under a confidentiality exemption. As a result, Stage 1 on the real data (mode C)
is not independently reproducible outside the BTL environment. To mitigate this, the package
provides (a) the cleared analysis CSVs in `output/csv_real/`, so all paper/appendix exhibits
are fully reproducible in Stage 2 with the real numbers (mode B), and (b) a synthetic-data
generator (`code/simulate/`) so the full Stage 0→1→2 code path is runnable end-to-end on
non-confidential data (mode A).