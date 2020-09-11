set more off
clear all
// set matsize 11000
// set maxvar  32000
set seed 0

// set environment variables
global projects: env projects
global storage : env storage

// locations
global data = "$storage/econ900-02/empiricalexercise_1"
global code = "projects/econ900-02_empirical/empiricalexercise_1"

// open data
cd $data
use table.dta, clear

// definitions
gen    one = 1
global X1 one Education Experience Ability
global X2 MothersEducation FathersEducation Siblings
global  Y Wage

// a.
reg $Y $XI, nocons

// b.
reg $Y $X1 $X2, nocons

// c.
foreach var of varlist $X2 {
	reg `var' $X1
	// predicted x*b
	predict `var'_predictedxb, xb
	// predicted residuals
	predict `var'_residfromx1, resid
}

summ *_residfromx1

// d.
global X1nocons Education Experience Ability
reg $Y $X1nocons $X2, nocons

// e. (just observe the outcome from b. and interpret)
global X2star MothersEducation_residfromx1 FathersEducation_residfromx1 Siblings_residfromx1
global Ystar Wage_residefromx1

// three equivalent ways of geting the exact same beta_2
reg $Y $X1 $X2    , nocons
reg $Y $X1 $X2star, nocons
reg $Ystar $X2star