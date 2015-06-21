---
title: "Codebook"
date: "21 June, 2015"
output: 
      html_document:
            theme: readable
---
### Course Project  
#### Getting & Cleaning Data, Johns Hopkins University Data Specialization  

##### Instructions
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. The data for analysis is data collected from the accelerometers from the Samsung Galaxy S smartphone:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The R script <span class="label label-default">run_analysis.R</span> does the following:

#### 1. Merges the training and the test sets to create one data set:
This creates three datasets:  
<span class="label label-default">x</span> contains data from “X_train.txt” and “X_test.txt”  
<span class="label label-default">y</span> contains data from “Y_train.txt” and “Y_test.txt”  
<span class="label label-default">s</span> contains data from “subject_train.txt” and subject_test.txt"

#### 2. Extracts only the measurements on the mean and standard deviation for each measurement:
This is operated on <span class="label label-default">x</span>.
It first reads data of features/measurements from <span class="label label-default">features.txt</span>, and then grabs requried measurements from this data to create a new dataset <span class="label label-default">
x_m</span> for further analysis.

#### 3. Uses descriptive activity names to name the activities in the data set:
This is operated on <span class="label label-default">y</span>.

#### 4. Appropriately labels the data set with descriptive variable names:
First a comprehensive dataset <span class="label label-default">dat</span> is created by combining <span class="label label-default">s</span>, <span class="label label-default">y</span>, and <span class="label label-default">x_m</span>, which respectively represent data on subjects, activities and desired measurements.  

Then it modifies the measurement names to enhance readibility. Specifically, these replacements are made:  
"Gyro" ==> ".gyroscope"  
"Acc" ==> ".accelerometer"  
"Mag" ==> ".magnitude"  
"BodyBody" ==> ".body"  
"Body" ==> ".body"  
"Gravity"  ==> ".gravity"  
"^f" ==> "frequency"  
"^t" ==> "time"  

The resulting dataset is saved to <span class="label label-default">tidy_dat.txt</span>.

#### 5. Creates a 2nd, independent tidy data set with the average of each variable for each activity and each subject:
Having loaded the <span class="label label-default">plyr</span> library for the task, the R codes further create new dataset by unique combination of subject and activity. This independent tidy dataset is saved to <span class="label label-default">tidy_dat2.txt</span>.
```

#### Properties of the final resulting dataset:

It is a data.frame consisting of 10299 observations of  68 variables.  

It contains specific data on 6 types of activities (Laying, Sitting, Standing, Walking, Walking_downstairs, Walking_upstairs) for each of the 30 subjects.  

The specific data include the averages of 66 different measurements:  

[1] "time.body.accelerometer-mean()-X"                 
 [2] "time.body.accelerometer-mean()-Y"                 
 [3] "time.body.accelerometer-mean()-Z"                 
 [4] "time.body.accelerometer-std()-X"                  
 [5] "time.body.accelerometer-std()-Y"                  
 [6] "time.body.accelerometer-std()-Z"                  
 [7] "time.gravity.accelerometer-mean()-X"              
 [8] "time.gravity.accelerometer-mean()-Y"              
 [9] "time.gravity.accelerometer-mean()-Z"              
[10] "time.gravity.accelerometer-std()-X"               
[11] "time.gravity.accelerometer-std()-Y"               
[12] "time.gravity.accelerometer-std()-Z"               
[13] "time.body.accelerometerJerk-mean()-X"             
[14] "time.body.accelerometerJerk-mean()-Y"             
[15] "time.body.accelerometerJerk-mean()-Z"             
[16] "time.body.accelerometerJerk-std()-X"              
[17] "time.body.accelerometerJerk-std()-Y"              
[18] "time.body.accelerometerJerk-std()-Z"              
[19] "time.body.gyroscope-mean()-X"                     
[20] "time.body.gyroscope-mean()-Y"                     
[21] "time.body.gyroscope-mean()-Z"                     
[22] "time.body.gyroscope-std()-X"                      
[23] "time.body.gyroscope-std()-Y"                      
[24] "time.body.gyroscope-std()-Z"                      
[25] "time.body.gyroscopeJerk-mean()-X"                 
[26] "time.body.gyroscopeJerk-mean()-Y"                 
[27] "time.body.gyroscopeJerk-mean()-Z"                 
[28] "time.body.gyroscopeJerk-std()-X"                  
[29] "time.body.gyroscopeJerk-std()-Y"                  
[30] "time.body.gyroscopeJerk-std()-Z"                  
[31] "time.body.accelerometer.magnitude-mean()"         
[32] "time.body.accelerometer.magnitude-std()"          
[33] "time.gravity.accelerometer.magnitude-mean()"      
[34] "time.gravity.accelerometer.magnitude-std()"       
[35] "time.body.accelerometerJerk.magnitude-mean()"     
[36] "time.body.accelerometerJerk.magnitude-std()"      
[37] "time.body.gyroscope.magnitude-mean()"             
[38] "time.body.gyroscope.magnitude-std()"              
[39] "time.body.gyroscopeJerk.magnitude-mean()"         
[40] "time.body.gyroscopeJerk.magnitude-std()"          
[41] "frequency.body.accelerometer-mean()-X"            
[42] "frequency.body.accelerometer-mean()-Y"            
[43] "frequency.body.accelerometer-mean()-Z"            
[44] "frequency.body.accelerometer-std()-X"             
[45] "frequency.body.accelerometer-std()-Y"             
[46] "frequency.body.accelerometer-std()-Z"             
[47] "frequency.body.accelerometerJerk-mean()-X"        
[48] "frequency.body.accelerometerJerk-mean()-Y"        
[49] "frequency.body.accelerometerJerk-mean()-Z"        
[50] "frequency.body.accelerometerJerk-std()-X"         
[51] "frequency.body.accelerometerJerk-std()-Y"         
[52] "frequency.body.accelerometerJerk-std()-Z"         
[53] "frequency.body.gyroscope-mean()-X"                
[54] "frequency.body.gyroscope-mean()-Y"                
[55] "frequency.body.gyroscope-mean()-Z"                
[56] "frequency.body.gyroscope-std()-X"                 
[57] "frequency.body.gyroscope-std()-Y"                 
[58] "frequency.body.gyroscope-std()-Z"                 
[59] "frequency.body.accelerometer.magnitude-mean()"    
[60] "frequency.body.accelerometer.magnitude-std()"     
[61] "frequency.body.accelerometerJerk.magnitude-mean()"  
[62] "frequency.body.accelerometerJerk.magnitude-std()"  
[63] "frequency.body.gyroscope.magnitude-mean()"        
[64] "frequency.body.gyroscope.magnitude-std()"         
[65] "frequency.body.gyroscopeJerk.magnitude-mean()"    
[66] "frequency.body.gyroscopeJerk.magnitude-std()"  