# Getting_and_Cleaning_Project
this the course project of Getting and Cleaning data course
#This doc is to explain the steps I followed to produced a tidy dataset out of Human Activity Recognition Using Smartphones Data Set.
#First, I read and processed the training data as follow:
* Read training labels in ("train/y_train.txt")   
* Read activity labels in ("./activity_labels.txt")
* Merged them together
* Read the training data in ("train/x_train.txt")
* Read the features in ("./features.txt")
* Set Features as the column names of training set
* Selected only those columns with column name containing either "mean" or "std"
* Read and added extra columns to the training data: activity ID, Activity Name, and training subject
* Changed the column names manually to a readable discriptive version and load it from a csv file 

#Second, I read and processed the testing data the same I did with training data.
#combined the rows of training and testing data, resulting in a tidy data set of 10299 observations of 69 variables. 

