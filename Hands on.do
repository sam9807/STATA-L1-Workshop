# import by going to File -> Import 

# Histogram by age and use 5 groups/bins
histogram SUSPECT_REPORTED_AGE, bin(5)

# summary stats for age, weight and height
summarize SUSPECT_REPORTED_AGE SUSPECT_HEIGHT SUSPECT_WEIGHT

# correlation age, weight and height
correlate SUSPECT_REPORTED_AGE SUSPECT_HEIGHT SUSPECT_WEIGHT

# Scatter plot between age and weight
twoway (scatter SUSPECT_WEIGHT SUSPECT_REPORTED_AGE)

# Simple regresssion age and weight
regress SUSPECT_REPORTED_AGE SUSPECT_WEIGHT

# Multiple regression age, weight and height
regress SUSPECT_REPORTED_AGE SUSPECT_HEIGHT SUSPECT_WEIGHT
