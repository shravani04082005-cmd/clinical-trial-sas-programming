# Clinical trial SAS programming: DXHTN-201

> All data is synthetic (randomly generated for portfolio use). No real patients or products are involved. Effect sizes are simulated and are not findings.

## Study
Fictional Phase II, randomised, placebo-controlled study of Drug X in hypertension: 150 subjects across 5 sites, 12 weeks of treatment. See `docs/study_spec.md`.

## Project stages
- [ ] 1. Import and inspect raw data
- [ ] 2. Clean and validate
- [ ] 3. Derive and combine
- [ ] 4. Analyse
- [ ] 5. Tables and QC
- [ ] 6. SDTM, ADaM, TLFs

## Tools
SAS OnDemand for Academics (SAS Studio)

## Repository layout
```
data/raw/    raw CSV files (never edited)
data/clean/  cleaned datasets
sas/         SAS programs
docs/        study spec, cleaning log, notes
output/      tables and figures
```