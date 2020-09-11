set more off
clear all
set matsize 11000    // Setting the max size of matricies
set maxvar 32000    // Setting the max number of variables
set seed 0
sysuse auto, clear 

// Set Environment Variables
global projects: env projects   // projects environment variables set in Windows
global storage: env storage    // storage environment variables set in Windows

// Locations
global data = "$storage/econ900-02/empiricalexercise_1"
global code = "$projects/econ900-02_empirical/empiricalexercise_1"

// Open Data
cd $data
use table.dta, clear
