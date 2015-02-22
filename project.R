gettingProject<-function (){
  
  setwd("C:\\Amir\\Online_Courses\\Coursera\\Data_Science_Specialization\\3._Getting_and_Cleaning_Data\\project\\UCI_HAR_Dataset")
  
  # 1. reading training Data
  #read activity labels and training labels ("train/y_train.txt") 
  trainingLab<-read.table("./train/y_train.txt", header=FALSE,comment.char="",quote = "")
  colnames(trainingLab)<-c("training.ID")
  
  activityLab<-read.table("./activity_labels.txt", header=FALSE,comment.char="",quote = "")
  colnames(activityLab)<-c("activity.ID","activity.Name")
  #merge them
  library(plyr)
  trainActivLab = merge(trainingLab,activityLab,by.x="training.ID",by.y="activity.ID",all=TRUE)
  
  #read in training data
  trainingSet<-read.table("./train/X_train.txt", header=FALSE,comment.char="",quote = "")
  
  #read in subject
  subjectTrain<-read.table("./train/subject_train.txt", header=FALSE,comment.char="",quote = "")
  
  #read the features 
  features<-read.table("./features.txt", header=FALSE,comment.char="",quote = "",stringsAsFactors=FALSE)
  #set column names of training data as the read features
  colnames(trainingSet)<-features[,2]
  
  #select mean and std columns only
  meanMatches<-grepl("mean\\>()", colnames(trainingSet))
  stdMatches<-grepl("std\\>()", colnames(trainingSet))
  trainingSet<- trainingSet[ ,meanMatches|stdMatches]
  
  #add a new column to our data set as the training activity ID and Label.
  trainingSet$Activity.ID <- trainActivLab[,1]
  trainingSet$Activity.Name <- trainActivLab[,2]
  trainingSet$Subject <- subjectTrain[,1]
  
  #I manually edited the colnames, save it in a file called conames.csv. Here I'm reading in the file
  nColNames<-read.csv("./colnames.csv",header=FALSE,comment.char="",quote = "",stringsAsFactors=FALSE)[,1]
  colnames(trainingSet)<-nColNames
  #########################################################################################################################
  #                                 Reading Test dataset
  #######################################################################################################################
  # 1. reading training Data
  #read activity labels and testing labels ("train/y_train.txt") 
  testingLab<-read.table("./test/y_test.txt", header=FALSE,comment.char="",quote = "")
  colnames(testingLab)<-c("testing.ID")
  
  #no need repeat for test the same as training
  #activityLab<-read.table("./activity_labels.txt", header=FALSE,comment.char="",quote = "")
  #colnames(activityLab)<-c("activity.ID","activity.Name")
  #merge them
  testActivLab = merge(testingLab,activityLab,by.x="testing.ID",by.y="activity.ID",all=TRUE)
  
  #read in testing data
  testingSet<-read.table("./test/X_test.txt", header=FALSE,comment.char="",quote = "")
  
  #read in subject
  subjectTest<-read.table("./test/subject_test.txt", header=FALSE,comment.char="",quote = "")
  
  #no need to read the features again 
  #features<-read.table("./features.txt", header=FALSE,comment.char="",quote = "",stringsAsFactors=FALSE)
  #set column names of training data as the read features
  colnames(testingSet)<-features[,2]
  
  #select mean and std columns only
  testingSet<- testingSet[ ,meanMatches|stdMatches]
  
  #add a new column to our data set as the training activity ID and Label.
  testingSet$Activity.ID <- testActivLab[,1]
  testingSet$Activity.Name <- testActivLab[,2]
  testingSet$Subject <- subjectTest[,1]
  colnames(testingSet)<-nColNames
  #####################################################################################################################
  
  tidyDataSet<-rbind(trainingSet,testingSet)
  write.csv(tidyDataSet,"./tidyDataSet.csv")
}