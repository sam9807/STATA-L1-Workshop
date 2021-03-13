/* [QCL Workshop] Introduction to Stata */ 
/* Instructor: Seungho (Samuel) Lee */ 
/* Date: March 10, 2021 & March 12, 2021 */

*** Initialization Commands *** 
version 15 		/* Use Stata Version 15 Interpreter */
capture log close	/* Close log (if one is open) */

/* Set Working Directory */
cd
cd "~\Desktop\Stata_Workshop_Files" /* MacOs: cd "~/Desktop/Stata_Workshop_Files" */

/* Open new log file in Working Directory */
log using "Workshop_Presentation_output.log", replace  

clear all 		/* Clear memory */
set more off		/* Uninterrupted Scrolling for Results */

* 3.  Load the Data File "2016_Election_train.csv" into Stata's Working Memory
import delimited using "2016_Election_train.csv"

* 4.  Check list of variables and number of observations
describe

* 5. Check summary statistics of all variables separated by 4 variables
summarize, separator(4)

* 6. Let's check one of the variables `inc910213'
summarize inc910213
summarize inc910213, detail

hist inc910213

* 7.  Check Categorical (Binary) Variable "winner16"
codebook winner16

* 8.  Turn Categorical/Binary Variable "winner16" to Dummy Variable "rep" and Encode rep variable
generate rep = winner16=="Rep"
generate dem = winner16=="Dem"

label variable winner16 "Outcome of the 2016 Election for Each County"
label variable rep "Dummy Variable for Counties that Voted for Candidate Trump in the 2016 Presidential Election"

label define winner16 0 "Dem" 1 "Rep"
label value rep winner16

* 9.  Let's check whether there is a difference in education level (% of people with bachelors degree) between counties that elected Republican candidate and those that elected Democratic candidate
ttest edu685213, by(winner16)

* 10. Turn Categorical (Binary) Variable to Dummy Variable
* generate rep = winner16=="Rep"
* generate dem = winner16=="Dem"

* 11.  Save the data in working memory to the Stata data file "2016_Election_Data.dta"
save "2016_Election_Data.dta"

/* Simple Linear Regression */

* 12. First, let's look at a regression between continuous variables
corr sbo001207 pst045214
reg sbo001207 pst045214

predict yhat_ex

twoway scatter yhat_ex sbo001207 pst045214, connect(l .) symbol(i 0)


* 13. Let's find a relationship between % of people with bachelor's degree (edu685213) and republican vote (rep)
reg rep edu685213
predict yhat_linear /* Note that SLR is a variable name you are setting. */
			/* Feel free to name it as you wish. */
label variable yhat_linear "Simple Regression Pred" /* Label shows up on legend */

twoway scatter yhat_linear rep edu685213, connect(l .) symbol(i 0) sort ylabel(0 1)  
			 
* 14. What do you think it will happen if we add % of people with high school diploma (edu635213)
corr edu685213 edu635213
reg rep edu685213 edu635213
predict MLR

twoway scatter rep MLR yhat_linear edu685213, connect(. l -) msymbol(. i i) sort ylabel(0 1) 

/*in this case, both are found to be statistically significant. However, including highly correlated (both positive and negative) indpendent variables could lead to multicollinearity problem. */

* 15. How about [persons under 18 years (age295214)]
reg rep edu685213 edu635213 age295214
corr edu635213 edu685213 age295214 

* 16. How about [white alone, not hispanic (rhi825214)]
reg rep edu685213 edu635213 age295214 rhi825214 /* look at p-value of edu635213 */
corr edu635213 edu685213 age295214 rhi825214

* 17. How about [Per Capita Money Income (inc910213)] and Interaction Term
corr edu685213 inc910213
gen edu685_inc910 = edu685213 * inc910213

reg rep edu685213 age295214 rhi825214 inc910213 edu685_inc910 /* Final Multiple Linear Regression Model*/

* 18. What if we include all variables in the logit model?
/* Note that Logit models do not have R-Squared since they utilize MLE to estimate probability.*/
logit rep edu635213 edu685213 age295214 rhi825214
predict yhat_all
twoway scatter yhat_all rep edu685213, connect(l i) msymbol(i 0) sort ylabel(0 1)

* 19. Let's visually compare between linear regression and logit model
logit rep edu685213
predict yhat_logit

twoway scatter yhat_linear rep edu685213, connect(l .) symbol(i 0) sort ylabel(0 1)
twoway scatter yhat_logit rep edu685213, connect(l i) msymbol(i 0) sort ylabel(0 1)


log close
* End of Do File
