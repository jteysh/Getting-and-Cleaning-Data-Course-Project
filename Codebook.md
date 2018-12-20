## Getting and Cleaning Data Course Project

### Data Source
From: UCI Machine Learning Repository <br />
Name: Human Activity Recognition Using Smartphones Data Set <br />
Available at [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) <br />

### Dataset Information
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

### Attribute Information:
For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

### Treatment of Source Data
1. Merged the training and the test sets to create one dataset
2. Extracted only the measurements on the mean and standard deviation for each measurement
3. Used descriptive activity names to name the activities in the dataset
4. Appropriately labeled the dataset with descriptive variable names
5. From the dataset in s/n 4, created an independent tidy data set with the average of each variable for each activity and each subject <br />
Actual modification to source data available on [R Script](https://github.com/jteysh/Getting-and-Cleaning-Data-Course-Project/blob/master/run_Analysis.R) 
