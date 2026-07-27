## Potentially Hardcoded Numeric Constants


We found the following set of hard coded numbers. This may be completely legitimate (parameter input, thresholds for computations, etc), and is hence only for information.

**/var/folders/5q/yhcyv3z55wvg6lhgc3h22kk00000gq/T/20220947-1/replication-package/labor_networks/code/output/gen_figures.R**

- Line 599, : df[,diff_lb := diff - qnorm(0.975) * diff_se]
- Line 600, : df[,diff_ub := diff + qnorm(0.975) * diff_se]

