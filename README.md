## Course Project README

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

