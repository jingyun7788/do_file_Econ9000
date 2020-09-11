set more off
clear all
set matsize 800
set seed 0



global projects: env projects
global storage: env storage

global data = "$storage/econ900-02/empiricalexercise_1"
global code = "$projects/econ900-02_empirical/empiricalexercise_1"


//open data

cd $data
use table.dta, clear

//definitions

gen one = 1 
global X1 one Education Experience Ability 
global X2 MothersEducation FathersEducation Siblings
global Y Wage


//a.

reg $Y $X1, nocons

//b.
reg $Y $X1 $X2, nocons

//c.
foreach var of varlist $X2 {
	reg 'var' $X1, nocons
	predict 'var'_residfromX1
}






