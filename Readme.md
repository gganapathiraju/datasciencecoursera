---
title: "README.Rmd"
---

### Coursera 
### Data Cleaning Course


List of relevant files

* Original UCI HAR Dataset zip file provided for the Data Cleaning project, which is assumed to be extracted under a “current directory” that creates UCI HAR Dataset folder and contains several subfolders and files.
* Readme.md (This current file) - A file that is to be read first before using any other files as a part of the course project submission).
* ProjectCodeBook.docx
* run_analysis.R (R Script file that reads the raw data files and produces two tidy data set csv files, as required for the course submission). The script takes no parameters.
* tidy_full_data.csv (output file created by run_analysis.R script in the “current directory”) containing the tidied data with Subject, Activity and 86 variables that contain “mean” or “std” as a part of the variable name.
* tidy_avgs_data.csv (output file created by run_analysis.R script in the “current directory”) containing tidied data with averages for each variable for each Subject-Activity combination. Contains 88 variables, The first being Subject and Activity, followed by 86 variables that contain "mean" or "std" in their names
