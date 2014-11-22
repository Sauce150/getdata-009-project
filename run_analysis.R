library(plyr)
library(reshape2)
library(utils)
if(!file.exists("./UCI HAR Dataset")) {
        url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(url, destfile = "getdata-projectfiles-UCI HAR Dataset.zip", method = "curl")
        unzip("getdata-projectfiles-UCI HAR Dataset.zip")
}

x <- read.table("./UCI HAR Dataset/train/X_train.txt")
y <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject <- read.table("./UCI HAR Dataset/train/subject_train.txt")
train_data <- cbind(subject, y, x)

subject2 <- read.table("./UCI HAR Dataset/test/subject_test.txt")
y2 <- read.table("./UCI HAR Dataset/test/y_test.txt")
x2 <- read.table("./UCI HAR Dataset/test/X_test.txt")
test_data <- cbind(subject2, y2, x2)

all_data <- rbind(train_data, test_data)

features <- read.table("./UCI HAR Dataset/features.txt")
colnames(all_data) <- c("subject", "activity", as.character(features[,2]))

trim2mean <- grep("mean()", colnames(all_data), fixed = TRUE)
trim2std <- grep("std()", colnames(all_data), fixed = TRUE)
trim_data <- all_data[,c(1:2, trim2mean, trim2std)]

activities <- read.table("./UCI HAR Dataset/activity_labels.txt")
trim_data$activity <- factor(trim_data$activity, labels = as.character(activities$V2))

legal_names <- make.names(colnames(trim_data))
nameclean <- sub("Acc", "Acclrm", legal_names, fixed = TRUE)
nameclean <- gsub("..", "", nameclean, fixed = TRUE)
nameclean <- sub("t", "time", nameclean, fixed = TRUE)
nameclean <- sub("f", "frequency", nameclean, fixed = TRUE)
nameclean <- sub("BodyBody", "Body", nameclean, fixed = TRUE)
colnames(trim_data) <- c("subject", "activity", nameclean[3:length(nameclean)])

x <- colnames(trim_data)
trim_melt <- melt(trim_data, id = c("subject", "activity"), measure.vars = x[3:length(x)])
tidy_data <- ddply(trim_melt, .(subject, activity, variable), summarize, mean=mean(value))

write.table(tidy_data, file = "tidy_data.txt", row.names = FALSE)