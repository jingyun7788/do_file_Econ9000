set more off
clear all
set seed 0

//set environment variables
global projects: env projects
global storage: env storage

//locations
global data = "$storage/econ900-02/empiricalexercise_1"
global code = "$projects/econ900-20_empirical/empiricalexcercise_1"

//open data
cd $data	
use table.dta, clear

//definitions
generate one=1
global	X1 one Education Experience Ability
global X2 MothersEducation FathersEducation Siblings
global Y Wage

// a.
reg $Y $X1, nocons

//b.
reg $Y $X1 $X2, nocons

//c.
foreach var of varlist $X2 {
    reg 'var' $X1
	predict 'var'_residfromX1
	//predicted residuals
	predict 'var'_residfromX1, resid
}

summ *_residfromX1

//d.
global X1nocons Education Experience Ability
reg $Y $X1nocons $X2, nocons

//e. 'just observe outcome from part b and compare'
global X2star MothersEducation_resiidromx1 FathersEducation_residfromx1 Siblingsresidfromx1
global Ystar Wage_residfromx1


//three equivalent ways of getting the exact same beta_2
reg $Y $X1 $X2, no cons
reg $Y $X1 $X2star, nocons
reg $Ystar $X2star

