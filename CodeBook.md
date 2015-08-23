**variables in run_analysis tidy data set**
please see read me for more details describing the data in the dataset

*subject_id* 
	-integer	values are 1-30
	-represent 30 distinct paticpants in the study
	-each particpant was assigned a unique integer between 1 and 30

*activity*
character - 6 possible values as follows:
	-WALKING
	-WALKING_UPSTAIRS
	-WALKING_DOWNSTAIRS
	-SITTING
	-STANDING
	-LAYING

"action"
the specific action within the activity being measured.  Possible values:
	BodyAcc                  
	GravityAcc      
	BodyAccJerk   
	BodyGyro                
	BodyGyroJerk    
	BodyAccMag           
	GravityAccMag           
	BodyAccJerkMag          
	BodyGyroMag               
	BodyGyroJerkMag    
  

"function"
what kind of measurement is this - average, or standard deviation
if I had time would have separated XYZ out

time_in_sec
	The time in seconds average per subject, ativity, action, function
	Value is a number data type

freq_in_hz
The average in hz of the mean and standard deviation (number) of the frequency of these measurements are provided per subject/activity/action
	Value is a number data type


