## Getting and Cleaning Data - peer assessment project


## The original data was transformed by

1. Merging the training and the test sets to create one data set.
2. Extracting only the measurements on the mean and standard deviation for each measurement. 
3. Using descriptive activity names to name the activities in the data set
4. Appropriately labeling the data set with descriptive activity names. 
5. Creating a second, independent tidy data set with the average of each variable for each activity and each subject. 

## About R script
File with R code "run_analysis.R" perform 5 following steps (in accordance assigned task of course work)

## About variables:   
### Variables: Environment and data source
today           = today's date, later coerced to data and time  
mySystem        = description of computer hardware and software used in this analysis  
dataDescription = source project description from UCI Machine Learning Repository  
dataUrl         = URL for zip archive of source data  

### Variables: Imported files named according to sources file names
activity_labels = six activity codes and corresponding activity names  
features        = feature names for X_test, X_train  

subject_test    = test set subject number, 1-30  
X_test          = test set feature measurements  
y_test          = test set activity, coded 1-6  
  
Subject_train   = train set subject number, 1-30  
X_train         = train set feature measurements  
y_train         = train set activity, coded 1-6  
  
### Variables: Combined data sets
test            = subject_test, y_test, X_test combined, by columns  
train           = subject_train, y_train, X_train combined, by columns  
fullSet         = test, train, combined by rows  
  
### Variables: Column names
allNames        = set of names corresponding to fullSet, not yet applied  
meanStdColumns  = subject, activity, and all features with mean or standard deviation  
reducedSet      = fullSet subsetted with meanStdColumns  
reducedNames    = allNames subsetted with meanStdColumns, renamed to R conventions; applied to reducedSet  
  
### Variables: Tidy data set                  
tidyDataset     = data set with average of each variable, by activity, by subject                 


