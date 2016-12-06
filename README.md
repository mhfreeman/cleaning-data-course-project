# Getting and Cleaning Data Course Project
As a part of the Getting and Cleaning Data project, this repository is meant to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. The files in this repository extract and organize human activity recognition data from UCI Machine Learning Repository (link below).

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The files used for the data cleaning are detailed below.

### CodeBook.md
Describes the variables, the data, and any transformations or work that you performed to clean up the data.

### run_analysis.R
The script does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names.
4. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
5. The result is shown in the file `activitydata.txt`.

### activitydata.txt
Cleaned dataset that is produced as an output from running the "run_analysis.R" script.