# Background
The original data is collected from the accelerometers from the Samsung Galaxy S smartphone.

# Combining data

## Activity ID
The datasets with the prefix "y" in the "train" and "test" folder contains the ID of the activity that is performed.
y_train
y_test

## subject ID
The datasets with the prefix "subject" contains the ID of the subject performing the activity.
subject_train
subject_test

## Measurements 
The measurements are stored in a dataset with the prefix "X"
X_train
X_test

## Relation 
The data is related horizontally within "train" and "test" respectively and vertically between them.

The data is therefore combined in the following way

| X			| subject			|	y		|
| --------- |-------------------| ----------|
| X_train	| subject_train		|	y_train	|
| X_test	| subject_test		|	y_test	|


# Filtering the data
Only the "group by" variables i.e "activity" and "subject" and the measurement variables that measures the standard deviation or mean are kept.

# Labels and variable names
The activity ID:s are replaced by the activity names that is read from the "activity_labels.txt"-file.

The kept measurement-variables are named according to the "features.txt"-file.

## Variables
The variables are self-explanatory. All measurement variables are normalized and have values ranging from -1 to 1.

### Group by-variables
activity

subject_ID


### Measurement variables
tBodyAcc-mean()-X

tBodyAcc-mean()-Y

tBodyAcc-mean()-Z

tBodyAcc-std()-X

tBodyAcc-std()-Y

tBodyAcc-std()-Z

tGravityAcc-mean()-X

tGravityAcc-mean()-Y

tGravityAcc-mean()-Z

tGravityAcc-std()-X

tGravityAcc-std()-Y

tGravityAcc-std()-Z

tBodyAccJerk-mean()-X

tBodyAccJerk-mean()-Y

tBodyAccJerk-mean()-Z

tBodyAccJerk-std()-X

tBodyAccJerk-std()-Y

tBodyAccJerk-std()-Z

tBodyGyro-mean()-X

tBodyGyro-mean()-Y

tBodyGyro-mean()-Z

tBodyGyro-std()-X

tBodyGyro-std()-Y

tBodyGyro-std()-Z

tBodyGyroJerk-mean()-X

tBodyGyroJerk-mean()-Y

tBodyGyroJerk-mean()-Z

tBodyGyroJerk-std()-X

tBodyGyroJerk-std()-Y

tBodyGyroJerk-std()-Z

tBodyAccMag-mean()

tBodyAccMag-std()

tGravityAccMag-mean()

tGravityAccMag-std()

tBodyAccJerkMag-mean()

tBodyAccJerkMag-std()

tBodyGyroMag-mean()

tBodyGyroMag-std()

tBodyGyroJerkMag-mean()

tBodyGyroJerkMag-std()

fBodyAcc-mean()-X

fBodyAcc-mean()-Y

fBodyAcc-mean()-Z

fBodyAcc-std()-X

fBodyAcc-std()-Y

fBodyAcc-std()-Z

fBodyAcc-meanFreq()-X

fBodyAcc-meanFreq()-Y

fBodyAcc-meanFreq()-Z

fBodyAccJerk-mean()-X

fBodyAccJerk-mean()-Y

fBodyAccJerk-mean()-Z

fBodyAccJerk-std()-X

fBodyAccJerk-std()-Y

fBodyAccJerk-std()-Z

fBodyAccJerk-meanFreq()-X

fBodyAccJerk-meanFreq()-Y

fBodyAccJerk-meanFreq()-Z

fBodyGyro-mean()-X

fBodyGyro-mean()-Y

fBodyGyro-mean()-Z

fBodyGyro-std()-X

fBodyGyro-std()-Y

fBodyGyro-std()-Z

fBodyGyro-meanFreq()-X

fBodyGyro-meanFreq()-Y

fBodyGyro-meanFreq()-Z

fBodyAccMag-mean()

fBodyAccMag-std()

fBodyAccMag-meanFreq()

fBodyBodyAccJerkMag-mean()

fBodyBodyAccJerkMag-std()

fBodyBodyAccJerkMag-meanFreq()

fBodyBodyGyroMag-mean()

fBodyBodyGyroMag-std()

fBodyBodyGyroMag-meanFreq()

fBodyBodyGyroJerkMag-mean()

fBodyBodyGyroJerkMag-std()

fBodyBodyGyroJerkMag-meanFreq()

angle(tBodyAccMean,gravity)

angle(tBodyAccJerkMean),gravityMean)

angle(tBodyGyroMean,gravityMean)

angle(tBodyGyroJerkMean,gravityMean)

angle(X,gravityMean)

angle(Y,gravityMean)

angle(Z,gravityMean)
