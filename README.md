---
title: "GETTING AND CLEANING DATA ASSIGNMENT"
output: html_document
---

## Human Activity Recognition Using Smartphones Dataset

The objective is to merge train and test datasets thus generating tidy independent data set with the average of each variable for each activity and each subject.

## The Script
    
### Loads reshape library
    library(reshape2)

### Downloads data files
    ## Downloads to working directory
    fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(fileUrl, destfile = "./assignDataset.zip", 
              method = "auto")
    ## Extracts dataset into working directory
    unzip("./assignDataset.zip", exdir = ".")

###  Reads data
    ## Load data into new data frames.  These are the biggest files with all recordings
    myData.train <- read.table("./UCI HAR Dataset/train/X_train.txt", sep="", header=FALSE)
    myData.test <- read.table("./UCI HAR Dataset/test/X_test.txt", sep="", header=FALSE)

### Reads activities and subjects
    ## Reads activities (training). These datasets will store subjects and activities
    activSubject.train <- read.table("./UCI HAR Dataset/train/y_train.txt", 
              sep="", header=FALSE, col.names=c("activity"))
    ## Reads subjects (training) as new column for activSubject.train
    activSubject.train[,"subject"] <- read.table("./UCI HAR Dataset/train/subject_train.txt", 
              sep="", header=FALSE)
    ## Reads activities (test)
    activSubject.test <- read.table("./UCI HAR Dataset/test/y_test.txt", 
              sep="", header=FALSE,col.names=c("activity"))
    ## Reads subjects (test) as new column for activSubject.test
    activSubject.test[,"subject"] <- read.table("./UCI HAR Dataset/test/subject_test.txt", 
              sep="", header=FALSE)                           

### Puts data together
    ## Pastes data from training and test
    mydf <- rbind(myData.train, myData.test)
    ## Pastes activities and subjects from training and test
    activSubject <- rbind(activSubject.train,activSubject.test)   

### Tidy activity labels
    ## Read activity labels. Only 2nd column will be kept, the one with the text values
    ## as.is ensures character class
    activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt", 
              sep="", header=FALSE, as.is = c(2)) [ ,2]
    ## Coerce activities to factor. We need it to change integer values into text values.
    ## We also create a labels vector from activityLabels
    activSubject$activity <- factor(activSubject$activity, levels = c(1:6), 
              labels = c(activityLabels), ordered = TRUE)

### Extracts mean and std
    ## Read features. Only 2nd column kept, as this is the one with features list.
    ## as.is ensures character class
    features <- read.table("./UCI HAR Dataset/features.txt", 
              sep="", header=FALSE, as.is = c(2)) [ ,2]
    ## Selects 'mean()' cols
    myFeatures.mean <- grep(".*mean\\(\\)", features)
    ## Selects 'sd()' cols
    myFeatures.sd <- grep(".*std\\(\\)", features)

### Re-writes variable names
    ## We decide to move 'Mean' and 'StD' to the beginning of the name.
    ## This may make reading the data easier
    features[myFeatures.mean] <- paste0("Mean.", features[myFeatures.mean])
    features[myFeatures.sd] <- paste0("StD.", features[myFeatures.sd])
    ## This will remove some weird characters. Make syntactically valid names
    features <- make.names(features)
    ## Finally we remove 'mean's and 'std's from the names
    features <- gsub("mean\\.+", "", features)
    features <- gsub("std\\.+", "", features)

### Arranges data
    ## Makes features list my dataframe names
    names(mydf) <- features
    ## Create a new dataframe removing unwanted cols
    myTidyData <- mydf[,c(myFeatures.mean,myFeatures.sd)]
    ## Attach activities and subjects
    myTidyData <- cbind(activSubject,myTidyData)
    ## Arranges data calculates mean
    newTidyWideData <- aggregate(. ~ subject + activity, 
              data = myTidyData, mean)

### Export data to new file
    ## Write to txt
    write.table(newTidyWideData,"./assignDataset.txt")
    
## Notes

### Mean and standard deviation
According to the interpretation we made of the feature files, it has been decided to choose only the columns marked as mean() and std(). Consequently, only those columns were maintained to analyze.

### Tidy data frame
Data were summarised via the aggregate function, which creates a not-so-long not-so-wide data set. The mechanism accomplishes the objectives, resulting in a tidy data set, with one column per variable and a row per subject and activity. 

### Reading the data
      ## Paste into your console
      data <- read.table(file_path, header = TRUE) 
      View(data)
