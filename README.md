## Course Project

### About the Project
The purpose of this project is to demonstrate ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The course project assignment is to create one R script called run_analysis.R that does the following:

+ Merges the training and the test sets to create one data set.
+ Extracts only the measurements on the mean and standard deviation for each measurement. 
+ Uses descriptive activity names to name the activities in the data set
+ Appropriately labels the data set with descriptive variable names. 
+ From the data set created above, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### Running the Script
In order to run the run_Analysis.R script, you will need to download the UCI HAR dataset.  The dataset is available at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.  Place all individual files from this dataset in your working directory.  The script will read the files from the working directory.  Please do not change file names.  This script reads in the following files:
+ features.txt
+ activity_labels.txt
+ X_test.txt
+ y_test.txt
+ subject_test.txt
+ X_train.txt
+ y_train.txt
+ subject_train.txt

You will also need to have the dplyr package installed to run the script.  The script will output a tidy dataset which consists of the average of each variable for each activity and each subject.  This tidy dataset will be written to a file named "Course Project.txt" in your working directory.  

### How the Script Works
Below are the steps completed by the script to generate the desired datasets:

+ Read in the 8 files of interest from the UCI HAR dataset
+ Change column names in both the test and training data sets to match the feature names
+ Add activity labels and subject information to both the test and training data sets
+ Change the column names to Activity Label and Subject so they are the same in both the test and training data sets
+ Merge the training and test data sets
+ Subset the full dataset to only include column names which have Mean, Std, Activity or Subject
+ Add in the activity descriptions from the Activity Labels data frame
+ Create groups based on both activity description and Subject
+ Summarize each group by providing the mean for each variable
+ Write the output to the file "Course Project.txt"
