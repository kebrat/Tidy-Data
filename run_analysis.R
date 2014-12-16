## Kebra Thompson
## 12-12-14
## Getting and Cleaning Data Project

## This script reads in sets of data, merges several of them,
## extracts part of the data, and then creates a separate
## dataset that shows means of categories from the original sets.

run_analysis <- function() {
    
    ## open this library
    library(dplyr)
    
    ## read in all of the original data needed
    X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
    y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
    subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
    X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
    y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
    subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
    features <- read.table("./UCI HAR Dataset/features.txt")
    activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
    
    ## combine subjects, activites, and results for test and train
    test_data <- cbind(subject_test, y_test, X_test)
    train_data <- cbind(subject_train, y_train, X_train)
    
    ## create column names for the 2 tables
    ## use the descriptive names provided in features
    features_as_names <- make.names(as.character(features[, 2]), unique = TRUE)
    features_final <- c("Subject", "Activity", features_as_names)
    colnames(test_data) <- features_final
    colnames(train_data) <- features_final
    
    ## merge and sort test_data and train_data and then select only the mean and std columns
    combined_data <- merge(test_data, train_data, all = TRUE)
    combined_data_ordered <- combined_data[order(combined_data[, 1], combined_data[, 2]),  ]
    data_mean_std_only <- select(combined_data_ordered, 1, 2, contains("mean", ignore.case = FALSE), 
                                 contains("std"), -contains("meanFreq"))

    ## create new tidy dataset
    small_set <- summarise_each(group_by(data_mean_std_only, Subject, Activity), funs(mean), 
                               tBodyAcc.mean...X:fBodyBodyGyroJerkMag.std..)

    ## change activities from numbers to names, re-order and organize
    small_set <- merge(small_set, activity_labels, by.x = "Activity", by.y = 1)
    small_set <- cbind(small_set[, 2], small_set[, 69], small_set[, 3:68])
    colnames(small_set) <- c("Subject", "Activity", colnames(small_set[, 3:68]))
    tidy_set <- small_set[order(small_set[, 1], small_set[, 2]), ]

    ## write new dataset
    write.table(tidy_set, file = "KThompson tidy_data", row.names = FALSE)
    
}