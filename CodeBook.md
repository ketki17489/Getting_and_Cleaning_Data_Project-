# CodeBook

## Variable Description

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

## Original data set

The original data set consist of 10299 records(rows) and 561 Variables(coloumn) which are divided into training and testing data set. More information about original data set is provided with it.

## Process

R script called run_analysis.R does the following.

1) Merges the training and the test sets to create one data set.
2) Extracts only the measurements on the mean and standard deviation for each measurement.
3) Uses descriptive activity names to name the activities in the data set
4) Appropriately labels the data set with descriptive variable names.
5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Tidy Data Set

The data set "tidyDataAverage.txt" consist of 180 cases(rows) and feature vector of length 68(coloumn) described below. 

"Activity"  ====> The activities performed during the people 
1 WALKING
 2 WALKING_UPSTAIRS
 3 WALKING_DOWNSTAIRS
 4 SITTING
5 STANDING 
6 LAYING


"Subject"   ====> The people who performed those activities represented by numbers ranging from 1 to 30
                  
This set is the output with the average of each variable for each activity and each subject of original data set from which only the measurements on the mean and standard deviation for each measurement are extracted.

"tBodyAcc-mean()-X"        
"tBodyAcc-mean()-Y"           
"tBodyAcc-mean()-Z"           
"tBodyAcc-std()-X"           
"tBodyAcc-std()-Y"            
"tBodyAcc-std()-Z"            
"tGravityAcc-mean()-X"       
"tGravityAcc-mean()-Y"        
"tGravityAcc-mean()-Z"        
"tGravityAcc-std()-X"        
"tGravityAcc-std()-Y"         
"tGravityAcc-std()-Z"         
"tBodyAccJerk-mean()-X"      
"tBodyAccJerk-mean()-Y"       
"tBodyAccJerk-mean()-Z"       
"tBodyAccJerk-std()-X"       
"tBodyAccJerk-std()-Y"        
"tBodyAccJerk-std()-Z"        
"tBodyGyro-mean()-X"         
"tBodyGyro-mean()-Y"          
"tBodyGyro-mean()-Z"          
"tBodyGyro-std()-X"          
"tBodyGyro-std()-Y"           
"tBodyGyro-std()-Z"           
"tBodyGyroJerk-mean()-X"     
"tBodyGyroJerk-mean()-Y"      
"tBodyGyroJerk-mean()-Z"      
"tBodyGyroJerk-std()-X"      
"tBodyGyroJerk-std()-Y"       
"tBodyGyroJerk-std()-Z"       
"tBodyAccMag-mean()"         
"tBodyAccMag-std()"           
"tGravityAccMag-mean()"       
"tGravityAccMag-std()"       
"tBodyAccJerkMag-mean()"      
"tBodyAccJerkMag-std()"       
"tBodyGyroMag-mean()"        
"tBodyGyroMag-std()"          
"tBodyGyroJerkMag-mean()"     
"tBodyGyroJerkMag-std()"     
"fBodyAcc-mean()-X"           
"fBodyAcc-mean()-Y"           
"fBodyAcc-mean()-Z"          
"fBodyAcc-std()-X"            
"fBodyAcc-std()-Y"            
"fBodyAcc-std()-Z"           
"fBodyAccJerk-mean()-X"       
"fBodyAccJerk-mean()-Y"       
"fBodyAccJerk-mean()-Z"      
"fBodyAccJerk-std()-X"        
"fBodyAccJerk-std()-Y"        
"fBodyAccJerk-std()-Z"       
"fBodyGyro-mean()-X"          
"fBodyGyro-mean()-Y"          
"fBodyGyro-mean()-Z"         
"fBodyGyro-std()-X"           
"fBodyGyro-std()-Y"           
"fBodyGyro-std()-Z"          
"fBodyAccMag-mean()"          
"fBodyAccMag-std()"           
"fBodyBodyAccJerkMag-mean()" 
"fBodyBodyAccJerkMag-std()"   
"fBodyBodyGyroMag-mean()"     
"fBodyBodyGyroMag-std()"     
"fBodyBodyGyroJerkMag-mean()" 
"fBodyBodyGyroJerkMag-std()" 
 
##Notes: 

- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file. 