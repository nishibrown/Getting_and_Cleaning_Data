library(dplyr)

##Read in features data and activity labels
features<-read.table("features.txt")
activity_labels<-read.table("activity_labels.txt")


##Read in test data
test_set<-read.table("X_test.txt")
test_labels<-read.table("y_test.txt")
test_subject<-read.table("subject_test.txt")

##Read in training data
train_set<-read.table("X_train.txt")
train_labels<-read.table("y_train.txt")
train_subject<-read.table("subject_train.txt")

###################################################################################
## Question 4:
## We want descriptive variable names so use the column names from the features data
## set for both the test set and the training set
###################################################################################

##change the name of the colmns in the test set to match those of the the features
colnames(test_set)<-features$V2

##change the name of the columns in the training set to match those of the features
colnames(train_set)<-features$V2

###################################################################################
## Question 1:
#  Merge all the data into one data set by using cbind to combine the individual pieces
## of the the test data set and training data sets.  Then, use rbind to combine into 
## one comprehensive data set.  Rbind requires the same variable names so change the 
## column names for the first 2 columns of both the test and training data so they 
## are the same
####################################################################################

##Add the labels and the subjects to the test set
new_test_set<-cbind(test_labels$V1,test_subject$V1,test_set)

##Change the column names for test label and test subject
colnames(new_test_set)[1]<-"Activity Label"
colnames(new_test_set)[2]<-"Subject"

##Add the labels and the subjects to the training set
new_train_set<-cbind(train_labels$V1, train_subject$V1, train_set)

##Change the column names for training label and training subject
colnames(new_train_set)[1]<-"Activity Label"
colnames(new_train_set)[2]<-"Subject"

##Merge the training and test sets by using rbind
train_and_test_set<-rbind(new_train_set, new_test_set)

#####################################################################################
## Question 2:
## Extract only the mean and standard deviation by using a grepl statement 
## and looking for mean, std, Activity, and Subject to downselect the columns
## of interest.
######################################################################################

##Subset the full dataset to only include column names which have Mean, Std, Activity or Subject
mean_std_items<-train_and_test_set[grepl('mean\\(|std\\(|Activity|Subject', names(train_and_test_set))]

##Add in the activity descriptions from the activity labels data frame
##Rename the first column in the the Activity Labels data frame to "Activity Label"
##Use the "Activity Label" name to perform merge, then rename the second column in the all_data_labeled data frame
##Remove the "Activity Label" column so we only have the activity description

######################################################################################
## Question 3:
## Use descriptive activity names by merging the comprehensive data set with the 
## Activity labels data set.  Do this by using the common variable Activity label
## to perform the merge.  Then delete the first column with the numeric activity
## label, and rename the 2nd column Activity Description
######################################################################################

colnames(activity_labels)[1]<-"Activity Label"
all_data_labeled<-merge(activity_labels,mean_std_items,by="Activity Label")
colnames(all_data_labeled)[2]<-"Activity_Description"
all_data_labeled$`Activity Label`<-NULL

######################################################################################
## Question 5:
## Create the new data set by creating groups based on the activity description and 
## then the subject.  Summarize the data within each group using the mean for each 
## variable
######################################################################################

## Create groups based on both Activity Description and Subject
by_Activity_Subject<-group_by(all_data_labeled, Activity_Description, Subject)

## Summarize each group by providing the mean for each variable
summary<-summarize_each(by_Activity_Subject,funs(mean))

## Write the output to the file
write.table(summary, file="Course Project.txt", row.names = FALSE)
