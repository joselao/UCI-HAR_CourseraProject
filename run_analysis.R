# COURSERA: Getting and Cleaning Data Course Project
# The purpose of this project is to demonstrate your ability to collect, work with,
# and clean a data set. The goal is to prepare tidy data that can be used for later analysis.
# You will be graded by your peers on a series of yes/no questions related to the project.
# You will be required to submit:
# 1) a tidy data set as described below,
# 2) a link to a Github repository with your script for performing the analysis, and
# 3) a code book that describes the variables, the data, and any transformations or work
# that you performed to clean up the data called CodeBook.md.
# You should also include a README.md in the repo with your scripts.
# This repo explains how all of the scripts work and how they are connected.
# The data linked to from the course website represent data collected from the accelerometers
# from the Samsung Galaxy S smartphone. A full description is available at the site where the
# data was obtained:
# http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
# Here are the data for the project:
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# set working directory (where "UCI HAR Dataset" folder is)
# > setwd("~/Documents/COURSERA_COURSES/Data Science [Especialization]/03-Getting and Cleaning Data_Rscripts/final_project")

features <- read.delim("./UCI HAR Dataset/features.txt", header = FALSE, sep = "", quote = "\n", col.names=c("n","feature"))
ac.labels <- read.delim("./UCI HAR Dataset/activity_labels.txt", header = FALSE, sep = "", quote = "\n")


# reading TRAINING data
    subject <- read.delim("./UCI HAR Dataset/train/subject_train.txt", header = FALSE, sep = "", quote = "\n", col.names="subject")
    x <- read.delim("./UCI HAR Dataset/train/X_train.txt", header = FALSE, sep = "", quote = "\n")
    colnames(x) <- features$feature # assigning names to features table
    
    # reading activity data
    y <- read.delim("./UCI HAR Dataset/train/y_train.txt", header = FALSE, sep = "", quote = "\n", col.names="activity")
    y$activity <- factor(y$activity, levels=ac.labels$V1, labels=ac.labels$V2) # assigning factor to activity table
    
    # reading other tables
    IS.bax <- read.delim("./UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt", header = FALSE, sep = "", quote = "\n", col.names=paste0("BaccX",seq(1,128)))
    IS.bay <- read.delim("./UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt", header = FALSE, sep = "", quote = "\n", col.names=paste0("BaccY",seq(1,128)))
    IS.baz <- read.delim("./UCI HAR Dataset/train/Inertial Signals/body_acc_z_train.txt", header = FALSE, sep = "", quote = "\n", col.names=paste0("BaccZ",seq(1,128)))
    IS.bgx <- read.delim("./UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt", header = FALSE, sep = "", quote = "\n", col.names=paste0("BgyrX",seq(1,128)))
    IS.bgy <- read.delim("./UCI HAR Dataset/train/Inertial Signals/body_gyro_y_train.txt", header = FALSE, sep = "", quote = "\n", col.names=paste0("BgyrY",seq(1,128)))
    IS.bgz <- read.delim("./UCI HAR Dataset/train/Inertial Signals/body_gyro_z_train.txt", header = FALSE, sep = "", quote = "\n", col.names=paste0("BgyrZ",seq(1,128)))
    IS.tax <- read.delim("./UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt", header = FALSE, sep = "", quote = "\n", col.names=paste0("TaccX",seq(1,128)))
    IS.tay <- read.delim("./UCI HAR Dataset/train/Inertial Signals/total_acc_y_train.txt", header = FALSE, sep = "", quote = "\n", col.names=paste0("TaccY",seq(1,128)))
    IS.taz <- read.delim("./UCI HAR Dataset/train/Inertial Signals/total_acc_z_train.txt", header = FALSE, sep = "", quote = "\n", col.names=paste0("TaccZ",seq(1,128)))
    
    # join all tables
    FULLtrain <- as.data.frame(cbind(subject, y, x, IS.bax, IS.bay, IS.baz, IS.bgx, IS.bgy, IS.bgz, IS.tax, IS.tay, IS.taz))
    
    # deleting tables
    rm(subject);rm(y);rm(x);rm(IS.bax);rm(IS.bay);rm(IS.baz);rm(IS.bgx);rm(IS.bgy);rm(IS.bgz);rm(IS.tax);rm(IS.tay);rm(IS.taz);
    gc()
    
# reading TEST data
    subject <- read.delim("./UCI HAR Dataset/test/subject_test.txt", header = FALSE, sep = "", quote = "\n", col.names="subject")
    x <- read.delim("./UCI HAR Dataset/test/X_test.txt", header = FALSE, sep = "", quote = "\n")
    colnames(x) <- features$feature # assigning names to features table
    
    # reading activity data
    y <- read.delim("./UCI HAR Dataset/test/y_test.txt", header = FALSE, sep = "", quote = "\n", col.names="activity")
    y$activity <- factor(y$activity, levels=ac.labels$V1, labels=ac.labels$V2) # assigning factor to activity table
    
    # reading other tables
    IS.bax <- read.delim("./UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt", header = FALSE, sep = "", quote = "\n", col.names=paste0("BaccX",seq(1,128)))
    IS.bay <- read.delim("./UCI HAR Dataset/test/Inertial Signals/body_acc_y_test.txt", header = FALSE, sep = "", quote = "\n", col.names=paste0("BaccY",seq(1,128)))
    IS.baz <- read.delim("./UCI HAR Dataset/test/Inertial Signals/body_acc_z_test.txt", header = FALSE, sep = "", quote = "\n", col.names=paste0("BaccZ",seq(1,128)))
    IS.bgx <- read.delim("./UCI HAR Dataset/test/Inertial Signals/body_gyro_x_test.txt", header = FALSE, sep = "", quote = "\n", col.names=paste0("BgyrX",seq(1,128)))
    IS.bgy <- read.delim("./UCI HAR Dataset/test/Inertial Signals/body_gyro_y_test.txt", header = FALSE, sep = "", quote = "\n", col.names=paste0("BgyrY",seq(1,128)))
    IS.bgz <- read.delim("./UCI HAR Dataset/test/Inertial Signals/body_gyro_z_test.txt", header = FALSE, sep = "", quote = "\n", col.names=paste0("BgyrZ",seq(1,128)))
    IS.tax <- read.delim("./UCI HAR Dataset/test/Inertial Signals/total_acc_x_test.txt", header = FALSE, sep = "", quote = "\n", col.names=paste0("TaccX",seq(1,128)))
    IS.tay <- read.delim("./UCI HAR Dataset/test/Inertial Signals/total_acc_y_test.txt", header = FALSE, sep = "", quote = "\n", col.names=paste0("TaccY",seq(1,128)))
    IS.taz <- read.delim("./UCI HAR Dataset/test/Inertial Signals/total_acc_z_test.txt", header = FALSE, sep = "", quote = "\n", col.names=paste0("TaccZ",seq(1,128)))
    
    # join all tables
    FULLtest <- as.data.frame(cbind(subject, y, x, IS.bax, IS.bay, IS.baz, IS.bgx, IS.bgy, IS.bgz, IS.tax, IS.tay, IS.taz))
    
    # deleting tables
    rm(subject);rm(y);rm(x);rm(IS.bax);rm(IS.bay);rm(IS.baz);rm(IS.bgx);rm(IS.bgy);rm(IS.bgz);rm(IS.tax);rm(IS.tay);rm(IS.taz);
    gc()
    
# deleting other tables
rm(features); rm(ac.labels);

# adding test/train column
FULLtrain$type <- "TRAIN"
FULLtest$type <- "TEST"

# Merging the training and the test sets to create one data set.
# joining all tables
FULL <- rbind(FULLtrain, FULLtest)
rm(FULLtrain); rm(FULLtest);gc();

# Extracting only the measurements on the mean and standard deviation for each measurement.
# only for check: > grep("(subject|activity|[Mm][Ee][Aa][Nn]()|[Ss][Tt][Dd]())", names(FULL), value=TRUE)
vector <- grepl("(subject|activity|mean()|std())", names(FULL))
FULL2 <- FULL[,vector]
rm(vector)

# 3) Uses descriptive activity names to name the activities in the data set
# done before, check with: > print(FULL2$activity)

# 4) Appropriately labels the data set with descriptive variable names.
# done before, check with: > print(names(FULL2))

# 5) From the data set in step 4, creates a second, independent tidy data set with the average
#    of each variable for each activity and each subject.
# I tryed with ddply:
# > library(plyr)
# > ddply(FULL2, .(activity, subject), summarize, numcolwise(mean,na.rm = TRUE))
# but it didn't work I got this message:
# "vector: cannot make a vector of mode 'closure'."
# so I got best result with aggregate function:
library(stats)
ResultsStats <- aggregate(data=FULL2, . ~ activity + subject, FUN=mean)
print(head(ResultsStats))

# exporting result data
write.table(ResultsStats, "run_analysis_result.txt", row.names=FALSE)