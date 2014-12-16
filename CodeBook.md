---
title: "CodeBook"
author: "Kebra Thompson"
date: "Monday, December 15, 2014"
output: html_document
---
Variables
---
These signals were used to estimate variables of the feature vector for each pattern:  '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions. Note that not all measurements are taken in the 3 axial directions; some are just single measurements. The values that begin with t are in the time domain while those beginning with f are in the frequency domain. See information at the end of the variables section for more detail. 

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

* mean(): Mean value
* std(): Standard deviation

This results in the following list of 66 variables, each describing the mean or standard devation of one of the previous 17 signals.

* tBodyAcc.mean...X
* tBodyAcc.mean...Y
* tBodyAcc.mean...Z
* tGravityAcc.mean...X
* tGravityAcc.mean...Y
* tGravityAcc.mean...Z
* tBodyAccJerk.mean...X
* tBodyAccJerk.mean...Y
* tBodyAccJerk.mean...Z
* tBodyGyro.mean...X
* tBodyGyro.mean...Y
* tBodyGyro.mean...Z
* tBodyGyroJerk.mean...X
* tBodyGyroJerk.mean...Y
* tBodyGyroJerk.mean...Z
* tBodyAccMag.mean..
* tGravityAccMag.mean..
* tBodyAccJerkMag.mean..
* tBodyGyroMag.mean..
* tBodyGyroJerkMag.mean..
* fBodyAcc.mean...X
* fBodyAcc.mean...Y
* fBodyAcc.mean...Z
* fBodyAccJerk.mean...X
* fBodyAccJerk.mean...Y
* fBodyAccJerk.mean...Z
* fBodyGyro.mean...X
* fBodyGyro.mean...Y
* fBodyGyro.mean...Z
* fBodyAccMag.mean..
* fBodyBodyAccJerkMag.mean..
* fBodyBodyGyroMag.mean..
* fBodyBodyGyroJerkMag.mean..
* tBodyAcc.std...X
* tBodyAcc.std...Y
* tBodyAcc.std...Z
* tGravityAcc.std...X
* tGravityAcc.std...Y
* tGravityAcc.std...Z
* tBodyAccJerk.std...X
* tBodyAccJerk.std...Y
* tBodyAccJerk.std...Z
* tBodyGyro.std...X
* tBodyGyro.std...Y
* tBodyGyro.std...Z
* tBodyGyroJerk.std...X
* tBodyGyroJerk.std...Y
* tBodyGyroJerk.std...Z
* tBodyAccMag.std..
* tGravityAccMag.std..
* tBodyAccJerkMag.std..
* tBodyGyroMag.std..
* tBodyGyroJerkMag.std..
* fBodyAcc.std...X
* fBodyAcc.std...Y
* fBodyAcc.std...Z
* fBodyAccJerk.std...X
* fBodyAccJerk.std...Y
* fBodyAccJerk.std...Z
* fBodyGyro.std...X
* fBodyGyro.std...Y
* fBodyGyro.std...Z
* fBodyAccMag.std..
* fBodyBodyAccJerkMag.std..
* fBodyBodyGyroMag.std..
* fBodyBodyGyroJerkMag.std..

For a more complete explanation of what each of these variable names means in terms of body movements, see the README and features_info files at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones and https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. 

For more information about this dataset contact: activityrecognition@smartlab.ws

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

---
Data
---

The original data contained the following 7 files that were read in and used in this project. The 30 participants were split into two groups: the test and train groups. Therefore, the X-train and X-test files contain the same kinds of data.

* X_test: The measurements recorded for those in the test group.
* y_test: The labels [1, 6] for the activity for those in the test group.
* subject_test: The subject [1, 30] for whom the measurements were recorded in the test data.
* X_train: The measurements recorded for those in the train group.
* y_train: The labels [1, 6] for the activity for those in the train group.
* subject_train: The subject [1, 30] for whom the measurements were recorded in the train data.
* features: List of all features.

In addition, an 8th file called Activity-Label was used to determine which activity the number in the y_test data represents.

---
Transformations
---

Once the 7 datasets listed above were read into R, the following transformations were applied to the data.
Note: in the description below, I have used the notation . in place of _ in order to avoid emphasizing sections that are not needed to be emphasized.

* The subject.test, y.test, and  X.test tables were bound together so that the subject and activity were linked to the measurements that had been recorded. This was also done for subject.train, y.train, and X.train files.
* The features column was adjusted and became the variable names for all columns other than Subject and Activity.
* The test.data and train.data were then merged into a larger data set that was ordered by the Subject and Activity values.
* A new smaller data set was created that selected only those variables that were calculating a mean or a standard deviation. Having the word mean in the name was not enough to be included; the variable needed to be a mean or std calculation.
* The data was then grouped and summarised so that a value for each pair of Subject and Activity was calculated. Since there are 30 subjects and 6 activities, this led to 180 observations.
* This dataset was then merged with the activity.labels data set in order to convert the activity numbers into activity names. The set then needed to be re-ordered.
* Finally, the tidy data set was written to a table for further use.
