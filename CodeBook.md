---
Title: "Getting and Cleaning Data Course Project"
---

This R script extracts and organizes human activity recognition data from UCI Machine Learning Repository (link below).

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Codebook

The output of this script will be:

Table: 
activitydata - this table contains mean and standard deviation data from the test and training datasets.

Fields:
tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation

label_description: type of activity
set: the source dataset (training or test)

## Data Summary

You can include R code in the document as follows:

```{r cars}
summary(activitydata)
```
