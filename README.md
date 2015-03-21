# Code for the course-project of Getting and Cleaning Data by Coursera

# Overview
This repo consists of one project file "coursera_project.Rproj". By openening the project file the working directory will be set to the repo-folder.

There is only one script "run_analysis.R" which is divided into 5-sections according to the problem specification.

You can either uncomment the code in the header to download and unzip the data that is being used or move the unzipped data to the specified folder.

# Library dependencies
"run_analysis" use the packages "reshape2" and "data.table" both available from CRAN.

# Run_analysis
1. The script first reads the data from the test and train data-folders and thereafter combines this data into one dataset.

2. All measurement variables that contains standard deviation or mean are kept the rest of the measurement-variables are discarded.

3. Reads the activity names and replaces the activity ID:s by the names.

4. First converts the data format to data.table then renames the measurement ID:s to the measurement names and finally
 rearranges the dataset so that the group by variables are the first columns in the dataset.
 
5. The "wide" dataset is converted to a "long"-format and finally the mean is computed for each variables grouped by the activity and subject. 