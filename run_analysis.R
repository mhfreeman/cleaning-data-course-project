# Create a directory to store files
if(!file.exists("courseproject")){
  dir.create("courseproject")
}

setwd("courseproject")

cleanactivitydata <- function() {

# Download UCI HAR Dataset
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, destfile = "cpdata.zip", method = "curl")
unzip("cpdata.zip")

# Test Data Set
test_set <- read.table("UCI HAR Dataset/test/X_test.txt")
column_labels <- read.table("UCI HAR Dataset/features.txt")
test_labels <- read.table("UCI HAR Dataset/test/y_test.txt")

colnames(test_set) <- column_labels[,2]
colnames(test_labels) <- c("label")
colnames(test_set) <- paste(column_labels[,2],"")

meancols <- test_set[,grep("mean",colnames(test_set))]
stdcols <- test_set[,grep("std",colnames(test_set))]

test_set <- cbind(meancols,stdcols,test_labels)
test_set$set <- "test"

# Train Data Set
train_set <- read.table("UCI HAR Dataset/train/X_train.txt")
train_labels <- read.table("UCI HAR Dataset/train/y_train.txt")

colnames(train_set) <- column_labels[,2]
colnames(train_labels) <- c("label")
colnames(train_set) <- paste(column_labels[,2],"")

meancols <- train_set[,grep("mean",colnames(train_set))]
stdcols <- train_set[,grep("std",colnames(train_set))]

train_set <- cbind(meancols,stdcols,train_labels)
train_set$set <- "train"

activity_data <- rbind(test_set, train_set)

activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
colnames(activity_labels) <- c("label","labeldescription")
activity_data <- merge(activity_data, activity_labels, by.x = "label",by.y = "label")
activity_data
}

activitydata <- cleanactivitydata()