/* [QCL Workshop] Introduction to Stata */ 
/* Hands-on Exercise Worksheet */ 
/* Instructor: Seungho (Samuel) Lee */ 
/* Date: March 10, 2021 & March 12, 2021 */

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

* 1. Plot Histogram of age with 25 bins and overlay a normal distribution
/* Hint: Need to use "bin()" and "normal" options */


* 2. Summary Stats for SUSPECT_REPORTED_AGE, SUSPECT_WEIGHT and SUSPECT_HEIGHT


* 3. Graph a bar chart to plot mean age across 5 borrows of NYC.
/* Hint 1: Mean is a default setting */
/* Hint 2: Try "help graph bar" for options */
/* Hint 3: Borough variable is "STOP_LOCATION_BORO_NAME" */


* 4. Use Logit to regress a posession of weapon on SUSPECT_REPORTED_AGE,
*    SUSPECT_WEIGHT, and Dummy Variable for Manhattan Borough 
/* Hint 1: Create Dummy Variables right before "logit" function */
/* Hint 2: Check out "WEAPON_FOUND_FLAG" for "WEAPON" variable*/
/* Hint 3: Check out "STOP_LOCATION_BORO_NAME" variable */


logit WEAPON SUSPECT_REPORTED_AGE SUSPECT_WEIGHT SUSPECT_HEIGHT MANHATTAN
