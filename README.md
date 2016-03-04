---
title: "README"
output: html_document
---

This is the final project of **"Getting and Cleaning Data Coursera Course"**, the pourpose of this project is to demonstrate your ability to collect, work with, and clean a data set.

the are one R script in the repository: [run_analysis.R](run_analysis.R), the result table after executing this script is: [week4_final_project_result_stats.txt](week4_final_project_result_stats.txt)

The script first look for the data files inside the [./UCI HAR Dataset/](./UCI HAR Dataset/) folder that must be alocated in the working directory

See [./UCI HAR Dataset/README.txt](./UCI HAR Dataset/README.txt) for more information about the project.

The script will proccess all the files (description are here: [http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)) and will generate mean stats (of mean and standart deviation variables) agregated by subject and activity that you can find in the [week4_final_project_result_stats.txt](week4_final_project_result_stats.txt), see the [CodeBook.md](CodeBook.md) file for a description of data columns.

for executing the code use:
```R
source("run_analysis.R")
```
for reading the results use:
```R
results <- read.table("week4_final_project_result_stats.txt", header = TRUE)
```