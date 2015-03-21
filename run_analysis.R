# Please set the working directory. 
# setwd("..../project_coursera")

# Please put the extracted files from the "UCI HAR Dataset" in the folder
# "/data/UCI HAR Dataset 
# or uncomment and run the code below to download and unzip the data

# # Create data directory
# if( !file.exists("data") ){
#   dir.create("data")
# }
# 
# # Create zip-directory
# if( !file.exists("zipFiles") ){
#   dir.create("zipFiles")
# }
# 
# # Download the zip-file
# download.file(url="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
#               destfile="zipFiles/UCI_HAR.zip")
# 
# # unzip the file to the data-folder
# unzip(zipfile="./zipFiles/UCI_HAR.zip", exdir="./data")






### Libraries ------------------------------------------------------------------
#install.packages('data.table')
#install.packages('reshape2')
library(reshape2)
library(data.table)


### 1. Merges the training and the test sets to create one data set. -----------

## training data 

# y_train data (activity ID)
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt", as.is=TRUE)

# X_train data (measurements)
X_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt", as.is=TRUE)

# subject_train (subject performing the activity)
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt", 
                            as.is=TRUE)

## test data

# y_train data (activity ID)
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt", as.is=TRUE)

# X_train data (measurements)
X_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt", as.is=TRUE)

# subject_train (subject performing the activity)
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt", 
                            as.is=TRUE)

# Check dimensions of the data
# dim(X_train)
# dim(X_test)
# 
# dim(y_train)
# dim(y_test)
# 
# dim(subject_train)
# dim(subject_test)

## Combine the data by type

# y (also changing the column-name)
y <- rbind(y_train, y_test) 
names(y) <- "activity_ID"

# X
X <- rbind(X_train, X_test)

# subject (also changing the column-name)
subject <- rbind(subject_train, subject_test)
names(subject) <- "subject_ID"

## Combine all types into one dataset (put the subject_ID and the activity_ID
# at the end for convience)
data <- cbind(X, subject, y)


### 2. Extract only the measurements on the mean and standard deviation for 
# each measurement. 

# Extract all variable names for the X-dataset
features <- read.table("./data/UCI HAR Dataset/features.txt", as.is=TRUE)

# I have chosen to select all variables containg "std" or "mean" in the 
# variable name.

# select the indices of all variable names containing the substring "std" or "mean"
# the select is also case-insensitive.
index <- grep(pattern="(std|mean)", x=tolower(features$V2) )

# Extract the variable names 
initialMeasurmentNames <- paste0("V", index)
NewMeasurementNames <- features$V2[index]

## Select only the "subject", "activity_ID" and columns containing mean and 
# std-measurements.      
data <- data[, c(initialMeasurmentNames, "subject_ID", "activity_ID")]


### 3. Uses descriptive activity names to name the activities in the data set --

# Extract the activity names
activity_labels <- read.table("./data/UCI HAR Dataset/activity_labels.txt", 
                              as.is=TRUE)

# renameing the dataset
names(activity_labels) <- c("activity_ID", "activity")

# Mergeing the activity names to the dataset 
data <- merge(data, activity_labels, by="activity_ID", all.x=TRUE)

# drop the activity_ID
data$activity_ID <- NULL


### 4. Appropriately labels the data set with descriptive variable names. ------

# Convert the data to data.table format
dataDT <- as.data.table(data)

# replaceing the "V1-V561"-values to their corresponding names
setnames(dataDT, initialMeasurmentNames, NewMeasurementNames)

# rearranging the data set so that the grouping variables are the first columns in the 
# dataset
dataDT <- dataDT[,c("activity","subject_ID", NewMeasurementNames), with=FALSE]

# Order the dataset by activity and subject_ID
dataDT <- dataDT[order(activity, subject_ID)]


### 5. From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.

# Melt the data to long-format
dataLong <- melt(dataDT, id=c("activity", "subject_ID"), measure.vars=NewMeasurementNames)

# compute the mean by of each variable grouped by activty and subject
result <- dataLong[, mean(value), by=c("activity", "subject_ID", "variable")]

setnames(result, "V1", "mean")

# write the final dataset
#write.table(result, file="./data/result.txt", row.names=FALSE)
