# har-cleaningdata
Prepare tidy data that can be used for later analysis;
Project for the Getting and Cleaning Data courseara from the Johns Hopkins University

# Dataset
Human Activity Recognition Using Smartphones Dataset;
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.

# Code Description
The following steps describes the code functionalities:
  1) read individual files from train and test set including subject, activity and feature names files;
  2) rename attributes from train and test set;
  3) bind activity and subject to train and test;
  4) bind train and test;
  5) select measures with mean and std;
  6) mean of all variables groubed by activity and subject;
  7) save tidy data;
  
# Test
The code can be run as long as the Samsung data is in your working directory - use setwd(directory)
source("run_analysis.R") -> a tidyData.txt file is created

# Contributers
Angela Pimentel





