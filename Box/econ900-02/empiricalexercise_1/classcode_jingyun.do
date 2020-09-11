set more off
clear all
set matsize 11000
set maxvar 32000
set seed 0
global bootstraps 1500

//set environment variables
global projects: env projects
global storage: env storage


//locations
global data="$storage/econ900-02/empiricalexercise_1"
cd $data
global code="$projects/econ900-02_empirical/empiricalexercise_1"

//open data
cd $data
use table.dta
ed

//definitions
gen one=1
global x1 one Education Experience Ability
global x2 MothersEducation FathersEducation Siblings
global Y Wage

//a.
reg $Y $x1, nocons

//b.
reg $Y $x1 $x2, nocons

//c.
foreach var of varlist $x2 {
reg `var' $x1
predict  `var'_residfromx1
}

summ *_residfromx1

//d. 
global x1nocons Education Experience Ability
reg $Y $x1nocons $x2,nocons

//e.
global x2star
global ystar 
reg $Y $x1 $x2star

//three equivalent ways of getting the exact same beta2
