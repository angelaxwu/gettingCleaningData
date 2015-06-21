# The data for analysis was collected from the accelerometers from the Samsung 
# Galaxy S smartphone. Source of data: 
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# Description of data: 
# http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

## 1. Merges the training and the test sets to create one data set.

train <- read.table("train/X_train.txt")
test <- read.table("test/X_test.txt")
x <- rbind(train, test)

train <- read.table("train/subject_train.txt")
test <- read.table("test/subject_test.txt")
s <- rbind(train, test)

train <- read.table("train/y_train.txt")
test <- read.table("test/y_test.txt")
y <- rbind(train, test)

## 2. Extracts only the measurements on the mean and standard deviation for 
## each measurement.

f <- read.table("features.txt")
measurement <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
x_m <-subset(x,select=f[measurement, 2])
m <- as.character(f[measurement, 2])
names(x_m) <- m

## 3. Uses descriptive activity names to name the activities in the data set.

names(y) <- "activity"
activity <- read.table("activity_labels.txt")
y[,1] <- activity[y[,1], 2]

## 4. Appropriately labels the data set with descriptive variable names.

names(s) <- "subject"
dat <- cbind(s, y, x_m)

names(dat)<-gsub("Gyro", ".gyroscope", names(dat))
names(dat)<-gsub("Acc", ".accelerometer", names(dat))
names(dat)<-gsub("Mag", ".magnitude", names(dat))
names(dat)<-gsub("BodyBody", ".body", names(dat))
names(dat)<-gsub("Body", ".body", names(dat))
names(dat)<-gsub("Gravity", ".gravity", names(dat))
names(dat)<-gsub("^f", "frequency", names(dat))
names(dat)<-gsub("^t", "time", names(dat))

write.table(dat, "tidy_dat.txt")

## 5. Creates a 2nd, independent tidy data set with the average of each 
## variable for each activity and each subject.

library(plyr)
dat2<-aggregate(. ~subject + activity, dat, mean)
write.table(dat2, "tidy_dat2.txt",row.name=FALSE)
