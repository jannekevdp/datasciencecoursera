###CodeBook 

#### Variables
One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project, which is used to create a tidy dataset, explained below: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

#### Data
Input files used are, for both training and test:
subject_ .txt - for identifiers of subjects that carried out the experiment
X_ .txt - activity labels
Y_ .txt - measurements

#### Transformations
run_analysis.R reads in the training and the test sets and merges them, to create one data set. It extracts only the measurements on the mean and standard deviation for each measurement. As an output it creates an independent tidy data set with the average of each variable for each activity and each subject.