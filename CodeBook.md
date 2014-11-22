#CodeBook for Coursera Course Project
### Variable Definitions

The following description of the variables is excerpted from the "features_info.txt" included with the raw data set, which is the [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) from the UCI Machine Learning Repository.

> The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.  

> Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).  

> Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

> These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

> tBodyAcc-XYZ  
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

> The set of variables that were estimated from these signals are: 

> mean(): Mean value  
std(): Standard deviation

There are additional variables in the raw data besides mean and standard deviation, but these were not included in this analysis.  Note that signals with "XYZ" represent three different measurements across those three axes.  The result in this analysis is 66 variables (mean and standard deviation across 33 signals).

### Data Transformations

* Subject and activity IDs were joined to the signal data for both train and test data sets.
* Train and test data sets were then joined together to make one dataset.
* As mentioned above, variables in the raw data not measuring mean or standard deviation of the signals were dropped.
* Activity was converted to a factor that has six levels (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
* Variable names were stripped of illegal characters by replacing with the "." character and adjusted as follows:
    * "Acc" was changed to "Acclrm" to indicate Accelerometer.
    * Leading "t" and "f" characters were changed to "time" and "frequency", respectively.
    * Double periods ("..") were eliminated from names.
    * Any instance of "BodyBody" was replaced with "Body".  This was the result of unexpected naming in the raw data.
* The average of each variable was calculated across each subject and activity pairing.
* The data was rearranged to put variable names in a single column and only include the calculated average values for each intersection of variable, subject, and activity in the Values column.
* The final result is a narrow, tidy dataset with 4 columns: subject, activity, variable, mean.
    * *subject* - numeric ID to indicate the subject of the observation; (1:30)
    * *activity* - factor of six levels (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
    * *variable* - character name of the variable of the observation; 66 variables representing the mean and standard deviation of 33 signal variables.
    * *mean* - numeric average of the indicated variable for that observations indicated activity and subject