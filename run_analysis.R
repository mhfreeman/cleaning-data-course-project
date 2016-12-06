require(reshape2)

activitydata_mean <- function() {

# Merge/Clean Training and Test Sets
activity <- read.table("UCI HAR Dataset/activity_labels.txt")
colnames(activity) <- c("code","activity")
columns <- read.table("UCI HAR Dataset/features.txt")
columns <- gsub("[[:punct:]]","",columns$V2)

test_set <- read.table("UCI HAR Dataset/test/X_test.txt")
colnames(test_set) <- c(columns)
testactivity_labels <- read.table("UCI HAR Dataset/test/y_test.txt")
testsubject <- read.table("UCI HAR Dataset/test/subject_test.txt")
colnames(testsubject) <- "subject"
test_set <- cbind(testactivity_labels, testsubject, test_set)
test_set <- merge(activity, test_set, by.x = "code", by.y = "V1", sort=FALSE)
test_set <- test_set[,-1]

train_set <- read.table("UCI HAR Dataset/train/X_train.txt")
colnames(train_set) <- c(columns)
trainactivity_labels <- read.table("UCI HAR Dataset/train/y_train.txt")
trainsubject <- read.table("UCI HAR Dataset/train/subject_train.txt")
colnames(trainsubject) <- "subject"
train_set <- cbind(trainactivity_labels, trainsubject, train_set)
train_set <- merge(activity, train_set, by.x = "code", by.y = "V1", sort=FALSE)
train_set <- train_set[,-1]

combineddata <- rbind(test_set, train_set)

combineddata <- combineddata[,c(1,2,grep("mean",colnames(combineddata)),grep("std",colnames(combineddata)))]
measurevars <- colnames(combineddata)
measurevars <- measurevars[3:563]

# Melt dataset
activitydata_melt <- melt(combineddata, id=c("subject","activity"))

dcast(activitydata_melt, subject + activity ~ variable, mean)
}

write.table(activitydata_mean(),"activitydata_mean.txt",row.names=FALSE)