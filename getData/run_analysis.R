setwd("/Users/janneke/Documents/coursera/getData/UCI HAR Dataset//")
list.files()

#You should create one R script called run_analysis.R that does the following. 
#1. Merges the training and the test sets to create one data set.

##read test datasets 
xtest <- read.table("test/X_test.txt", header=F, sep="")
ytest <- read.table("test/Y_test.txt", header=F, sep="")
subjtest<- read.table("test/subject_test.txt", header=F, sep="")
test<-cbind(subjtest,ytest,xtest)
##add readable colnames
features<- read.table("features.txt", sep="", header=F)
featureList<- as.character(features[,2])
names(test)<- c("subjID", "actLabel", featureList)

##read train datasets 
xtrain <- read.table("train/X_train.txt", header=F, sep="")
ytrain <- read.table("train/y_train.txt", header=F, sep="")
subjtrain <- read.table("train/subject_train.txt", header=F, sep="")
train<-cbind(subjtrain, ytrain,xtrain)
##add readable colnames
names(train)<- c("subjID", "actLabel", featureList)

##merge test and train
mergedTrainTest <- rbind(train, test)

#2. Extracts only the measurements on the mean and standard deviation for each measurement. 
std <- grep("std()", colnames(mergedTrainTest),fixed=TRUE)
means <- grep("mean()", colnames(mergedTrainTest),fixed=TRUE)
colsToMatch <- unique(append(std, means))
extract <- mergedTrainTest[,c(1,2,colsToMatch)]

#3. Uses descriptive activity names to name the activities in the data set
##add readable activity names
extract[extract[,2]=="1",2]<-"WALKING"
extract[extract[,2]=="2",2]<-"WALKING_UPSTAIRS"
extract[extract[,2]=="3",2]<-"WALKING_DOWNSTAIRS"
extract[extract[,2]=="4",2]<-"SITTING"
extract[extract[,2]=="5",2]<-"STANDING"
extract[extract[,2]=="6",2]<-"LAYING"

#4. Appropriately labels the data set with descriptive variable names. 

#5. From the data set in step 4, creates a second, independent tidy data set with 
#the average of each variable for each activity and each subject.
#compute mean


write.table(extract, file = "tidyData.txt", row.names=F,)