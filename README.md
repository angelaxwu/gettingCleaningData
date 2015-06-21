---
title: Course Project, Getting & Cleaning Data
date: "21 June, 2015"
output: 
      html_document:
            theme: readable
---

The data for analysis was collected from the accelerometers from the Samsung Galaxy S smartphone. Source of data is here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip (Description of this data can be found at: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

1. Download and unzip data from Source to a local folder
2. Place run_analysis.R in the same folder
3. Set this local folder as R's working directory using setwd()
4. To run the analysis: 
```{r}
source("run_analysis.R") 
```
5. To read the resulting dataset: 
```{r}
data <- read.table("tidy_dat2.txt", header=TRUE)
```
This is a tidy data set with the average of each variable for each activity and each subject as required in the instructions.
