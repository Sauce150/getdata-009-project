#Coursera Project for Geting & Cleaning Data

This repo contains a series of files related to the course project for Coursera's
Getting & Cleaning Data course.

The descriptions of the files are as follows:

- *run_analysis.R*: This code will take the raw data and produce the tidy_data.txt file.  Please note that this code will download the raw data from the web if the raw data directory is not found in your working directory.  To ensure proper execution of this code, the unzipped "UCI HAR Dataset" folder containing the raw data must be present and unaltered in your working directory.

- *raw data*: The raw data for this project is not included in this repo due to size considerations.  The data can be downloaded using the *run_analysis.R* code as mentioned above.  The dataset is the [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) from the UCI Machine Learning Repository.

- *tidy_data.txt*: The resulting tidy dataset from running the *run_analysis.R* code on the raw data.  Details on the variables and transformations that created this file can be found in the CodeBook.md file within this repo.