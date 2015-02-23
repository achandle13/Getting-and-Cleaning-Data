Run Analysis READ ME

This readme.md file accompanies the run_analysis.R script and run_analysis.txt tidy dataset.  

The run_analysis.txt data set, output from the run_analysis.R script, contains the mean of the mean and standard deviations of the
seventeen measurements taken during the Samsung movement analysis for each activity across all subjects.

There are 180 observations (30 subjects, each performing 6 activities) and a total of 68 variables, 66 of which are either means of means, or
means of standard deviations of the measurements described below.  

The seventeen measurements are below.  

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

Where denoted by X,Y, and Z, the measurement along each axis is treated separately within the run_analysis.txt dataset.

The script requires the following datasets loaded into the working directory for the script to work:

X_train.txt
y_train.txt
subject_train.txt
X_test.txt
y_test.txt
subject_test.txt
features.txt

If one of the datasets is missing, the script will print an error message letting the user know
which dataset is missing and exit the function.

Accompanying the readme.md file is the codebook.txt file.  The codebook describes the variable names, a brief description of each variable,
the values included in the fields, and the data type. For value descriptions, 
where a field is a continuous variable, the min and max within the given field is given so the data user can know the potential range of 
values for the data field.  The codebook also describes the units of each field.


To run the script, download the run_analysis.R script to your R working directory.  Ensure the 7 files described above are included 
in the working directory.  To acquire the files, download them from here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Once the files and script have been included in the working directory, open the run_analysis.R file in R studio, select the code, and click run.
After the function is loaded into R's memory, on the command line type run_analysis() and hit enter.  The function does not require 
input parameters. 

The function will write the output to the working directory, saved with the name run_analysis.txt.  The file will be space-delimited and can
be read from the working directory with the command read.table("run_analysis",header=TRUE,sep=" ").