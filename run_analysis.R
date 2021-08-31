library(dplyr)
getwd()
fileurl <-  "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"


download.file(fileurl, destfile = ".//data.zip", method = 'curl')

unzip("data.zip")

# Merges the training and the test sets to create one data set.

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


# Extracts only the measurements on the mean and standard deviation for each measurement. 

columnnames <- colnames(alldata)
mean_and_std_data <- alldata[,grepl("subject|code|[Mm]ean|std", columnnames)]


# Uses descriptive activity names to name the activities in the data set

mean_and_std_data$code <- activityLabels[mean_and_std_data$code, 2]


# Appropriately labels the data set with descriptive variable names. 

names(mean_and_std_data)[2] = "activity"
names(mean_and_std_data)<-gsub("Acc", "Accelerometer", names(mean_and_std_data))
names(mean_and_std_data)<-gsub("Gyro", "Gyroscope", names(mean_and_std_data))
names(mean_and_std_data)<-gsub("BodyBody", "Body", names(mean_and_std_data))
names(mean_and_std_data)<-gsub("Mag", "Magnitude", names(mean_and_std_data))
names(mean_and_std_data)<-gsub("^t", "Time", names(mean_and_std_data))
names(mean_and_std_data)<-gsub("^f", "Frequency", names(mean_and_std_data))
names(mean_and_std_data)<-gsub("tBody", "TimeBody", names(mean_and_std_data))
names(mean_and_std_data)<-gsub("-mean()", "Mean", names(mean_and_std_data), ignore.case = TRUE)
names(mean_and_std_data)<-gsub("-std()", "STD", names(mean_and_std_data), ignore.case = TRUE)
names(mean_and_std_data)<-gsub("-freq()", "Frequency", names(mean_and_std_data), ignore.case = TRUE)
names(mean_and_std_data)<-gsub("angle", "Angle", names(mean_and_std_data))
names(mean_and_std_data)<-gsub("gravity", "Gravity", names(mean_and_std_data))

# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

FinalData <- mean_and_std_data %>%
  group_by(subject, activity) %>%
  summarise_all(funs(mean))
write.table(FinalData, "FinalData.txt", row.name=FALSE)
