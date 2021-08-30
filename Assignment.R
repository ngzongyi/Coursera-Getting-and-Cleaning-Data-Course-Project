library(dplyr)
getwd()
fileurl <-  "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"


download.file(fileurl, destfile = ".//data.zip", method = 'curl')

unzip("data.zip")


# 1.1.1  Reading trainings tables:

x_train <- read.table(".//UCI HAR Dataset/train/X_train.txt")
y_train <- read.table(".//UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table(".//UCI HAR Dataset/train/subject_train.txt")

# 1.1.2 Reading testing tables:
x_test <- read.table(".//UCI HAR Dataset/test/X_test.txt")
y_test <- read.table(".//UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table(".//UCI HAR Dataset/test/subject_test.txt")

# 1.1.3 Reading feature vector:
features <- read.table('.//UCI HAR Dataset/features.txt')

# 1.1.4 Reading activity labels:
activityLabels = read.table('.//UCI HAR Dataset/activity_labels.txt')


colnames(x_train) <- features[,2]
colnames(y_train) <- "code"
colnames(subject_train) <- "subject"

colnames(x_test) <- features[,2]
colnames(y_test) <- "code"
colnames(subject_test) <- "subject"

colnames(features) <- c("n","functions")
colnames(activityLabels) <- c("code", "activity")


x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)
s_data <- rbind(subject_train, subject_test)

alldata <- cbind(s_data, y_data, x_data)
