
==================================================================
Coursera class project using Human Activity Recognition Using Smartphones Dataset

Please note i did not have time to further separate out XYZ, sorry about that
It took me too long to figure out the basics of reshaping/tidying
Definitely room for improvement, but submitting what I have

==================================================================
The base data set courtesy of:
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

From the dataset authors, the base dataset contained:
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, they captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually.  

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

======================================

Regarding the course project output:

We took the base dataset and grouped and summarized it.

For each record it is provided:

-mean of variety of measurements per subject and activity

The dataset includes the following files:
=========================================

- 'README.txt'
- 'tidydataset.txt' which is the output (had trouble loading it into coursera)
- 'codebook.md' which describes the data set
- 'run_analysis.R'


=======================================
Regarding run_analysis.R

plyr, dplyr, tidyr and reshape2 are loaded to help clip, subset and summarize then tidy the data

Navigate to the directoiry where the test and training directories are stored.

**Task 1: Put together the dataset....**
for the results in the test and training directories:
-Read all of the various files into separate datasets
-named the variables in the subject,activity,labels,data
-clipped together the columns for subject, labels and data measurements

There are now 2 complete data sets, one for test and one for training
there are combined into 1 full dataset of all results
Then we need to merge with activity names to better describe what activities were underway (the ids aren't descriptive)

**Task 2: refine data set**
-Then subset the columns based on those measurements with mean/std
-Not all 561 variables are needed for this project


**Task 3:  aggregate and summarize **
-the data must be aggregated and averaged based on the particpant (subject_id) and the activity
-melt the data frame and dcast it, averaging the measurements

**Task 4: Tidy the data
-gather the action/function columns into their own variable
-separate the action from the function to tidy a bit
-determine the kind of measurement, time or freq, and spread that into it's own column to tidy some more




