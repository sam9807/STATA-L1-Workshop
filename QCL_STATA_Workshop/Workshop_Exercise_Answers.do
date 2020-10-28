/* [QCL Workshop] Stata Basic Training */ 
/* Hands-on Exercise Answer Key */ 
/* Instructors: Cynthia Cheng, Seungho (Samuel) Lee */ 
/* Date: October 28, 2020 */

*** Initialization Commands *** 
version 15 		/* Use Stata Version 15 Interpreter */
capture log close	/* Close log (if one is open) */

/* Set Working Directory if Needed */

/* Open new log file in Working Directory */
log using "Workshop_Exercise_output.log", replace  

clear all 		/* Clear memory */
set more off		/* Uninterrupted Scrolling for Results */

/* Data Loading Wrangling Process */
* 1.  Load the Data File "sqf-2019.csv" into Stata's Working Memory
import excel "sqf-2019.xlsx", firstrow /* or, import by going to File -> Import */

* 2.  De-string Relevant Columns
destring(SUSPECT_REPORTED_AGE), replace force
destring(SUSPECT_HEIGHT), replace force
destring(SUSPECT_WEIGHT), replace force

/* Exercises */

* 1. Histogram by age and use 5 groups/bins
/* Hint: Need to use "bin()" option */
histogram SUSPECT_REPORTED_AGE, bin(5)

* 2. Summary Stats for age, weight and height
summarize SUSPECT_REPORTED_AGE SUSPECT_HEIGHT SUSPECT_WEIGHT

* 3. correlation age, weight and height
correlate SUSPECT_REPORTED_AGE SUSPECT_HEIGHT SUSPECT_WEIGHT

* 4. Scatter plot between age and weight
scatter SUSPECT_WEIGHT SUSPECT_REPORTED_AGE

* 5. Simple regresssion age and weight
regress SUSPECT_REPORTED_AGE SUSPECT_WEIGHT

* 6. Multiple regression age, weight and height
regress SUSPECT_REPORTED_AGE SUSPECT_HEIGHT SUSPECT_WEIGHT
