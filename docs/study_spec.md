# DXHTN-201: study specification (fictional)

**All data in this project is synthetic and randomly generated for portfolio use. No real patients, sponsor or product are involved.**

## 1. Study overview

| Item | Detail |
|---|---|
| Title | A randomised, double-blind, placebo-controlled Phase II study of Drug X in adults with essential hypertension |
| Study ID | DXHTN-201 |
| Design | 1:1 randomisation, Drug X vs placebo, 12 weeks of treatment |
| Sample size | 150 randomised (75 per arm) across 5 sites (101 to 105) |
| Population | Adults aged 18 to 80 with seated systolic blood pressure (SBP) of 140 mmHg or higher at baseline |

## 2. Schedule of assessments

| Visit | VISITNUM | Target day (relative to first dose) | Vital signs | Labs | AE collection |
|---|---|---|---|---|---|
| SCREENING | 1 | Day -14 to -7 | Yes | No | Yes |
| BASELINE | 2 | Day 1 (first dose) | Yes | Yes | Yes |
| WEEK 2 | 3 | Day 14 | Yes | No | Yes |
| WEEK 4 | 4 | Day 28 | Yes | Yes | Yes |
| WEEK 8 | 5 | Day 56 | Yes | No | Yes |
| WEEK 12 | 6 | Day 84 | Yes | Yes | Yes |

Visit windows (for your own windowing rules): Week 2 ±3 days, Week 4 ±4 days, Week 8 ±5 days, Week 12 ±7 days.

## 3. Endpoints

- **Primary:** change from baseline in seated SBP (mmHg) at Week 12, Drug X vs placebo.
- **Secondary:** change from baseline in seated DBP at Week 12; proportion of subjects with SBP below 140 mmHg at Week 12.
- **Safety:** treatment-emergent adverse events (TEAEs), serious AEs, and change from baseline in ALT, AST, creatinine and potassium.

## 4. Conventions you should follow (state any deviation in your documentation)

- **Baseline value:** the BASELINE visit value. If it is missing, use the SCREENING value and flag that you did so.
- **Treatment-emergent AE:** an AE whose start date is on or after the first dose date (RFSTDTC in DM).
- **Analysis populations:** *Randomised* = all subjects in DM. *Safety* = randomised subjects who received at least one dose (assume everyone in DM). Decide and document how you handle subjects with no Week 12 value.
- **Dates:** the raw files store dates as text. The intended format is YYYY-MM-DD.
- **Units:** SBP/DBP in mmHg, HR in beats/min, weight in kg, lab units as in LBORRESU (conversion may be needed).

## 5. Data dictionary

### dm.csv (one row per subject)
| Variable | Description |
|---|---|
| STUDYID | Study identifier |
| USUBJID | Unique subject ID (STUDYID-SITEID-number) |
| SITEID | Site number |
| AGE | Age in years at screening |
| SEX | M or F |
| RACE | Reported race category |
| ARM | Randomised treatment: DRUG X or PLACEBO |
| SCRNDT | Screening date |
| RFSTDTC | Date of first dose |
| EOSSTT | End-of-study status: COMPLETED or DISCONTINUED |
| EOSDT | End-of-study date |
| DISCREAS | Discontinuation reason (blank if completed) |

### vs.csv (one row per subject per visit)
| Variable | Description |
|---|---|
| USUBJID, VISIT, VISITNUM | Subject and visit |
| VSDT | Date of assessment |
| SBP, DBP | Seated systolic and diastolic blood pressure, mmHg |
| HR | Heart rate, beats/min |
| WEIGHT | Body weight, kg |

### lb.csv (one row per subject per visit per test)
| Variable | Description |
|---|---|
| USUBJID, VISIT, LBDT | Subject, visit, sample date |
| LBTESTCD, LBTEST | Test code (ALT, AST, CREAT, K) and name |
| LBORRES, LBORRESU | Result and its unit as reported |
| LBNRLO, LBNRHI | Normal range lower and upper limits, in the reported unit |
| LBSTAT | NOT DONE if the test was not performed |

### ae.csv (one row per adverse event)
| Variable | Description |
|---|---|
| USUBJID, AESEQ | Subject and AE sequence number |
| AETERM | Verbatim AE term as reported |
| AESTDT, AEENDT | Start and end dates (blank end = ongoing) |
| AESEV | MILD, MODERATE or SEVERE |
| AESER | Serious AE flag, Y or N |
| AEREL | Relationship to study drug |
| AEOUT | Outcome |
| AEACN | Action taken with study drug |

## 6. What Stages 1 and 2 should produce

1. **Stage 1 (import and inspect):** a program that imports all four files, with PROC CONTENTS, row counts, and frequency tables of the categorical variables.
2. **Stage 2 (clean and validate):** a **cleaning log** (a table in your repo) with one row per issue found: dataset, subject, what is wrong, how you detected it, what you decided and why. Real data managers raise queries to the site rather than silently fixing values, so for each issue record whether you would correct it, query it, or leave it.

The raw files should stay unchanged in `data/raw/`; write cleaned datasets to a separate folder.
