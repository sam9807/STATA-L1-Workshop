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

* 1.  Load the Data File "sqf-2019.csv" into Stata's Working Memory
import delimited using "sqf-2019.csv" /* or, import by going to File -> Import */

* 2. Histogram by age and use 5 groups/bins
/* Hint: Need to use "histogram" function with a "bin()" option */


* 3. Summary Stats for age, weight and height


* 4. correlation age, weight and height


* 5. Scatter plot between age and weight


* 6. Simple regresssion age and weight


* 7. Multiple regression age, weight and height

