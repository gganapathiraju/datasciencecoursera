# Gopal G
# Data Cleaning Course Coursera
# Course Project: Data Cleaning
# Script: run_analysis.R



# Step 1: Read two following two files and merge the data sets
#    ./test/x_test.txt 
#    ./train/x_train.txt
library(data.table)
library (dplyr)

# STEP 1 MERGING TRAINING AND TEST DATA SETS

print("STEP 1: Merging the test and training datasets")
print(" Reading data files into R")
print("   Reading features.txt into features")
features <- read.table("./UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)
print("   Reading activity_lables.txt into activities")
activities <- read.table("./UCI HAR Dataset/activity_labels.txt",stringsAsFactors = FALSE)

print("   Reading X_test.txt into Xtest")
Xtest <- read.table("./UCI HAR Dataset/test/X_test.txt")
print("   Reading Y_test.txt into Ytest")
Ytest <- read.table("./UCI HAR Dataset/test/y_test.txt")
print("   Reading subject_test.txt into SubjectTest")
SubTest <-  read.table("./UCI HAR Dataset/test/subject_test.txt")

print("   Reading X_train.txt into Xtrain")
Xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
print("   Reading y_train.txt into Ytrain")
Ytrain <- read.table("./UCI HAR Dataset/train/y_train.txt")
print("   Reading subject_train.txt into SubjectTrain")
SubTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")
print(" Reading data files Complete" )   
print(" Merging test and training datasets")
print("   Merging (rbind) Xtest and Xtrain   into X")
X <- rbind(Xtest,Xtrain)
print("   Merge(rbind) Ytest and Ytrain   into Y")
Y <- rbind(Ytest,Ytrain)
print("   Merge(rbind) SubTest and SubTrain into Subject")
Subject <- rbind(SubTest,SubTrain)
print(" Merging test and training datasets complete")

# STEP 2  EXTRACTING ONLY MEAN AND STD COLUMNS
print("STEP 2: Extracting only mean and std columns")
print("   Naming the columns of dataset from features")
colnames(X) <- gsub("[()]","", features$V2)
print("   Giving name Subject to the Subject DF col")
names(Subject) <- "Subject"
print("   Giving name Activity to the Y DF col")
names(Y) <- "Activity"
#select(data_set, Subject, everything())
print("   Finding columns with std/mean in the name")
print("     into mean_std_cols")
mean_std_cols <- grep("mean|std",colnames(X), ignore.case = TRUE, value=TRUE)
print("   Extracting only columns with std/mean")
X <- X[,mean_std_cols]
print("   Merging(cbind) Activity and X into data_set")
data_set <- cbind(Y, X)
print("   Merging(cbind) Subject and data_set into data_set")
data_set <- cbind(Subject,data_set )

# STEP #  USING DESCRIPTIVE ACTIVITY NAMES

print("STEP 3: Using Descriptive Activity Names ")
data_set$Activity <- as.factor(data_set$Activity)
levels(data_set$Activity) <- activities[,2]

# STEP 4  LABEL WITH DESCRIPTIVE VARIABLE NAMES

print("STEP 4: label with descriptive variable names")
print("         Accomplished in STEP 2 above")

# STEP 5   CREATING TIDY DATA SET OF AVERAGES
#          FOR ALL SUBJECT ACTIVITY COMBINATIONS

print("STEP 5: create an independent data set")
data_set_avgs <- group_by(data_set,Subject,Activity) %>% summarise_each(funs(mean))

print("WRITING TIDY DATA FILES FOR SUBMISSION")
print("   Writing full tidy data set")
write.csv(data_set, "./tidy_full_data.csv", row.names = FALSE)
print("   Writing tidy data set of avgs")
write.csv(data_set_avgs, "./tidy_avgs_data.csv", row.names = FALSE)





