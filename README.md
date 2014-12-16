Getting-and-Cleaning-Data-Project
=================================

##A project to read in data and create a tidy data set.

The script run_analysis.R is a stand-alone script. 
It completes the following steps in order to read in data and create a tidy data set.
* Open the dplyr library to be used in later steps.
* Reads in 7 data tables. These are: 3 files for the test group (X_test, y_test, subject_test), 
  3 files from the train group (X_train, y_train, subject_train), and the features file.
  For both of the test and training groups, the X_ file contains many trials/observations of body movements,
  the y_ file contains a list of which activity was being performed for each of the above observations
  and the subject_ file contains a list of which subject was performing the observation.
  The features file contains a list of 561 movements that were measured in each of the above observations.
* Binds the 3 test files to each other with the subject, activity, and then the resulting data for both the 
  test data and the train data.
* Uses the features file to name the variables, rather than leave them as Var1, Var2, etc.
* Merges the two sets of data and then selects only the mean and standard deviation variables from the entire set.
* Creates a new tidy data set by calculating the mean for each Subject / Activity combination.
* Writes a new table of the tidy data set.

The tidy data set written is in one of many forms that can be considered tidy. Note that each variable forms a column
while each Subject / Activity combination forms a row. This tidy data is in the wide format.

There is a CodeBook included which more thoroughly documents all of the changes made to the original data as well as a better description of the original data sets.
