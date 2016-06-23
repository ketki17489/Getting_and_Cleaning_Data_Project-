## Extract data from differnt text file in UCI HAR Dataset

features <- read.table("~/UCI HAR Dataset/features.txt", quote="\"", comment.char="")
##View(features)
activity_labels <- read.table("~/UCI HAR Dataset/activity_labels.txt", quote="\"", comment.char="")
##View(activity_labels)
X_test <- read.table("~/UCI HAR Dataset/test/X_test.txt", quote="\"", comment.char="")
##View(X_test)
Y_test <- read.table("~/UCI HAR Dataset/test/y_test.txt", quote="\"", comment.char="")
##View(y_test)
subject_test <- read.table("~/UCI HAR Dataset/test/subject_test.txt", quote="\"", comment.char="")
##View(subject_test)
X_train <- read.table("~/UCI HAR Dataset/train/X_train.txt", quote="\"", comment.char="")
##View(X_train)
Y_train <- read.table("~/UCI HAR Dataset/train/y_train.txt", quote="\"", comment.char="")
##View(y_train)
subject_train <- read.table("~/UCI HAR Dataset/train/subject_train.txt", quote="\"", comment.char="")
##View(subject_train)

## Merge the training and the test sets to create one data set.
X_total<-rbind(X_train,X_test)
Y_total<-rbind(Y_train,Y_test)
subject_total<-rbind(subject_train,subject_test)

## Appropriately labels the data set with descriptive variable names.
colnames(X_total)<-features$V2
colnames(subject_total)<-c("subject")
colnames(Y_total)<-c("activity")

## Extracts only the measurements on the mean and standard deviation for each measurement.
meanandstdata <- grepl("(-std\\(\\)|-mean\\(\\))",features$V2)
X_filtered<-X_total[,which(meanandstdata==TRUE)]

## Get final tidy dataset
X_filtered<-cbind(X_filtered,Y_total,subject_total)

## Appropriately labels the data set with descriptive variable names.
library(stringi)
X_filtered$activity<-stri_replace_all_regex(str = X_filtered$activity,
                                         pattern = c('1','2','3','4','5','6'), 
                                         replacement = c('Walking', 'Walking_Upstairs',
                                             'Walking_downstairs','Sitting','Standing','Laying'),
                                         vectorize_all = FALSE)

## From the data set in above step, creates a second, independent tidy data set with the average 
## of each variable for each activity and each subject.
new<-X_filtered[,1:(dim(X_filtered)[2]-2)]
tidydataavr<-aggregate(new,list(X_filtered$activity,X_filtered$subject),mean)
names(tidydataavr)[1]<-"Activity"
names(tidydataavr)[2]<-"Subject"

## Write the tidy data set in CSV file named "tidyData.csv"
write.csv(X_filtered,"tidyData.csv",row.names=FALSE)

## Write the second tidy data set with the average of each variable for each activity and 
## each subject in CSV file named "tidyDataAverage.csv"
write.csv(tidydataavr,"tidyDataAverage.csv",row.names=FALSE)

## Write the second tidy data set with the average of each variable for each activity and 
## each subject in text file named "tidyDataAverage.txt"
write.table(tidydataavr, "tidyDataAverage.txt", sep="\t", row.names=FALSE) 
