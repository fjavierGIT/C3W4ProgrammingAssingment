---
title: "CodeBook for tidy dataset Assignment"
output: github_document
---

## General info

The data linked from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI$20HAR%20Dataset.zip 

After collecting and cleaning the data according to the assignment instructions, the script produces a .txt file called “assignDataset.txt”. 

## Variables description

* activity: Performed activity. 
  class: factor
  levels: 1-6, labels: "WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING"
* subject: Person id. Identifier of the 30 subjects who carried out the experiment.
  class: integer
* Mean.tBodyAcc.X, Mean.tBodyAcc.Y, Mean.tBodyAcc.Z: Mean of body acceleration for axis X, Y, Z
  class: numeric
* Mean.tGravityAcc.X, Mean.tGravityAcc.Y, Mean.tGravityAcc.Z: Mean of gravity acceleration for axis X, Y, Z
  class: numeric
* Mean.tBodyAccJerk.X, Mean.tBodyAccJerk.Y, Mean.tBodyAccJerk.Z: Mean of body linear acceleration for axis X, Y, Z
  class: numeric
* Mean.tBodyGyro.X, Mean.tBodyGyro.Y, Mean.tBodyGyro.Z: Mean of body angular velocity for axis X, Y, Z
  class: numeric
* Mean.tBodyGyroJerk.X, Mean.tBodyGyroJerk.Y, Mean.tBodyGyroJerk.Z: Mean of body angular velocity derived in time for axis X, Y, Z.
  class: numeric
* Mean.tBodyAccMag.: Mean for magnitute of the body acceleration.
  class: numeric
* Mean.tGravityAccMag.: Mean for magnitude of the gravity acceleration.
  class: numeric
* Mean.tBodyAccJerkMag.: Mean for magnitude of body linear acceleration devived in time.
  class: numeric
* Mean.tBodyGyroMag.: Mean for magnitude of body angular velocity. 
  class: numeric
* Mean.tBodyGyroJerkMag.: Mean for body angular velocity derived in time.
  class: numeric
* Mean.fBodyAcc.X, Mean.fBodyAcc.Y, Mean.fBodyAcc.Z: Same as 't' variable. Fast Fourier Transform (FFT) applied.
  class: numeric
* Mean.fBodyAccJerk.X, Mean.fBodyAccJerk.Y, Mean.fBodyAccJerk.Z: Same as 't' variable. Fast Fourier Transform (FFT) applied
  class: numeric
* Mean.fBodyGyro.X, Mean.fBodyGyro.Y, Mean.fBodyGyro.Z: Same as 't' variable. Fast Fourier Transform (FFT) applied.
  class: numeric
* Mean.fBodyAccMag: Same as 't' variable. Fast Fourier Transform (FFT) applied.
  class: numeric
* Mean.fBodyBodyAccJerkMag: Same as 't' variable. Fast Fourier Transform (FFT) applied.
  class: numeric
* Mean.fBodyBodyGyroMag: Same as 't' variable. Fast Fourier Transform (FFT) applied.
  class: numeric
* Mean.fBodyBodyGyroJerkMag: Same as 't' variable. Fast Fourier Transform (FFT) applied.
  class: numeric
* StD.tBodyAcc.X, StD.tBodyAcc.Y, StD.tBodyAcc.Z: Standard deviation of body acceleration for axis X, Y, Z
  class: numeric
* StD.tGravityAcc.X, StD.tGravityAcc.Y, StD.tGravityAcc.Z: Standard deviation for gravity acceleration for axis X, Y, Z
  class: numeric
* StD.tBodyAccJerk.X, StD.tBodyAccJerk.Y, StD.tBodyAccJerk.Z: Standard deviation of linear body acceleration for axis X, Y, Z
  class: numeric
* StD.tBodyGyro.X, StD.tBodyGyro.Y, StD.tBodyGyro.Z: Standard deviation of body angular velocity for axis X, Y, Z
  class: numeric
* StD.tBodyGyroJerk.X, StD.tBodyGyroJerk.Y, StD.tBodyGyroJerk.Z: Standard deviation of body angular velocity derived in time for axis X, Y, Z 
  class: numeric
* StD.tBodyAccMag.: Standard deviation for magnitute of the body acceleration. 
  class: numeric
* StD.tGravityAccMag.: Standard deviation for magnitute of the gravity acceleration.
  class: numeric
* StD.tBodyAccJerkMag.: Standard deviation for magnitude of body linear acceleration derived in time.
  class: numeric
* StD.tBodyGyroMag.: Standard deviation for magnitude of body angular velocity.   
  class: numeric
* StD.tBodyGyroJerkMag.: Standard deviation for body angular velocity derived in time.
  class: numeric
* StD.fBodyAcc.X, StD.fBodyAcc.Y, StD.fBodyAcc.Z: Same as 't' variable. Fast Fourier Transform (FFT) applied.
  class: numeric
* StD.fBodyAccJerk., StD.fBodyAccJerk.Y, StD.fBodyAccJerk.Z: Same as 't' variable. Fast Fourier Transform (FFT) applied.
  class: numeric
* StD.fBodyGyro.X, StD.fBodyGyro.Y, StD.fBodyGyro.Z: Same as 't' variable. Fast Fourier Transform (FFT) applied.
  class: numeric
* StD.fBodyAccMag: Same as 't' variable. Fast Fourier Transform (FFT) applied.
  class: numeric
* StD.fBodyBodyAccJerkMag: Same as 't' variable. Fast Fourier Transform (FFT) applied.
  class: numeric 
* StD.fBodyBodyGyroMag: Same as 't' variable. Fast Fourier Transform (FFT) applied.
  class: numeric
* StD.fBodyBodyGyroJerkMag: Same as 't' variable. Fast Fourier Transform (FFT) applied.
  class: numeric

## Notes. Changes to imported data
1. "activities" variable was coerced to factor.
2. Numeric values from "activities" were changed into more descriptive text values for easy reading.
3. Used features list as names for the measurements variables.
4. Features names were modified for better readability, removing special characters like "()-". Mean or StD were moved to first place in order to better characterize every variable.
5. Features variables show mean values for mean and standard deviation, for every subject on every activity.


