a) What is the exact column name for the subject identifier in each of the four files? Is it the same everywhere?
USUBJID and yes it is the same everywhere. 

b) What does the spec say each dataset is “one row per”? Write one line per dataset in your own words.
dm: one row per subject
ae: one row per subject per adverse event
vs: one row per subject per visit per test
lb: one row per subject per visit per test

c) The spec uses USUBJID. Write one sentence on why a plain subject number wouldn’t be safe in a 5-site study.
Considering two subject numbers end up being the same, as they are from two different study sites. On combining the datasets from the two sites, can result in a duplicated data in the dataset as well as mistaken identity. 

d) In your own words, without copying my table: what is the difference between SDTM and ADaM?
SDTM is raw data converted, and restructured into a standard shape. Analysis does not take place at this point. Whereas, ADAM is the SDTM datasets converted to analysis-ready datasets such as baseline values, change from baseline, etc. 

Four line pipeline:
1. raw data collected from crfs, and other sources by the trial staff.
2. sdtm data, which is standardised data from raw data into fixed columns for each kind of data so that regulators can read any dataset and know where to look for.
3. adam data, created from SDTM containing variables such as baseline, change from baseline, and others for analysis.
4. tlf: these are tables, listings, and figures created from adam in the form of professional reports to make relevant data appear more clear and accessible easily. 