Coursera Getting and Cleaning Data - Project   May 2015

Data sets used for the project can be found at:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

File within this repositroy:

This R script assumes the zip file downloaded is unzipped into its own directory structure
called "UCI HAR Dataset" and all data files and folder strucutres are contained within that
primary folder. This folder/directory should be placed in the root of the working directory.
Removing the spaces int he file name will be beneficial (UCI_HAR_DATASET). 

codebook.md:

Describes the variables, data and all modifications made to the data during cleaning
and tidying in order to be able to run this analysis. 

run_analysis.R:

This file is the primary R code used to tidy the data and run the analysis to produce the 
averages_data.txt file. This code will merge the training and test sets, extract only the
measurements on the mean and standard deviations for each measurement, renames columns to 
be more descriptive, labels variable names and then produces an output file that contains 
this cleaned and tidy data. 

averages_data.txt: 

This file is the final output that contains the final output from the R script above. 
