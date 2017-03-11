## GETTING AND CLEANING DATA ASSIGNMENT ##
library(reshape2)

### Reads data
myData.train <- read.table("./UCI HAR Dataset/train/X_train.txt", sep="", header=FALSE)
myData.test <- read.table("./UCI HAR Dataset/test/X_test.txt", sep="", header=FALSE)

### Reads activities and subjects
activSubject.train <- read.table("./UCI HAR Dataset/train/y_train.txt", 
              sep="", header=FALSE, col.names=c("activity"))  #Reads activities (train)
activSubject.train[,"subject"] <- read.table("./UCI HAR Dataset/train/subject_train.txt", 
              sep="", header=FALSE)                           #Reads subjects (train)
activSubject.test <- read.table("./UCI HAR Dataset/test/y_test.txt", 
              sep="", header=FALSE,col.names=c("activity"))   #Reads activities (test)
activSubject.test[,"subject"] <- read.table("./UCI HAR Dataset/test/subject_test.txt", 
              sep="", header=FALSE)                           #Reads subjects (test)

### Puts data together
mydf <- rbind(myData.train, myData.test)                      #data train + test
activSubject <- rbind(activSubject.train,activSubject.test)   #acts&subs train + test

# Tidy activity labels
activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt", 
              sep="", header=FALSE, as.is = c(2)) [ ,2]       #only 2nd column kept
activSubject$activity <- factor(activSubject$activity, levels = c(1:6), 
              labels = c(activityLabels), ordered = TRUE)     #activities to factor. change into texts

### Extracts mean and std
features <- read.table("./UCI HAR Dataset/features.txt", 
              sep="", header=FALSE, as.is = c(2)) [ ,2]       #only 2nd column kept
myFeatures.mean <- grep(".*mean\\(\\)", features)             #select 'mean()' cols
myFeatures.sd <- grep(".*std\\(\\)", features)                #select 'sd()' cols

### Re-write variable names
features[myFeatures.mean] <- paste0("Mean.", features[myFeatures.mean]) #write 'Mean' first
features[myFeatures.sd] <- paste0("StD.", features[myFeatures.sd]) #write 'StD' first
features <- make.names(features)                              #remove weird chars
features <- gsub("mean\\.+", "", features)                    #remove 'mean'
features <- gsub("std\\.+", "", features)                     #remove 'std'

### Arranges data
names(mydf) <- features                                       #make features text my df names
myTidyData <- mydf[,c(myFeatures.mean,myFeatures.sd)]         #new df removed unwanted cols
myTidyData <- cbind(activSubject,myTidyData)                  #attach activities + subjects
newTidyWideData <- aggregate(. ~ subject + activity, 
              data = myTidyData, mean)                        #arranges data calculates mean

### Export data to new file
write.table(newTidyWideData,"./assignDataset.txt")            #write to txt
