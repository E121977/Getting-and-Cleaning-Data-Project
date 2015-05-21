## Gettting and Cleaning Data Project Assignment May 2015

## The data was downloaded and stored into my local working directory

## Preliminary Work to complete project tasks

##  Set the working directory

setwd("C:/Users/E121977/Desktop/Coursera - Data Science/(3) Getting and Cleaning Data/Project Assignment/Getting-and-Cleaning-Data-Project/")

## Load Packages

library(plyr)

## LOAD DATA
x_train <- read.table("UCI_HAR_Dataset/train/X_train.txt")
y_train <- read.table("UCI_HAR_Dataset/train/y_train.txt")
subject_train <- read.table("UCI_HAR_Dataset/train/subject_train.txt")
x_test <- read.table("UCI_HAR_Dataset/test/X_test.txt")
y_test <- read.table("UCI_HAR_Dataset/test/y_test.txt")
subject_test <- read.table("UCI_HAR_Dataset/test/subject_test.txt")

activities <- read.table("UCI_HAR_Dataset/activity_labels.txt")

features <- read.table("UCI_HAR_Dataset/features.txt")


## Step 1 
## Merge the data files into one data set...

## Merge the training and test sets to create one data set

# create 'x' data set
x_data <- rbind(x_train, x_test)

# create 'y' data set
y_data <- rbind(y_train, y_test)

# create 'subject' data set
subject_data <- rbind(subject_train, subject_test)


## Step 2
## Utilizing the data in the features file extract only the measurements on the mean 
## and standard deviation for each measurement

# get only columns with mean() or std() in their names
mean_and_std_features <- grep("-(mean|std)\\(\\)", features[, 2])

# subset the desired columns by ovweriting the initial data set with only the desired data
x_data <- x_data[, mean_and_std_features]


## Step 3
# Correctly label the data set with descriptive activity names
names(x_data) <- features[mean_and_std_features, 2]

## Use descriptive activity names to name the activities in the data set
# Update values with correct activity names
y_data[, 1] <- activities[y_data[, 1], 2]

# Correctly name the column as "Activity" per the instructions
names(y_data) <- "Activity" 


## Step 4
## Appropriately label the data set with descriptive variable names

# Correct column name as "Subject" 
names(subject_data) <- "Subject"

# bind all three data files into a single data set
all_data <- cbind(x_data, y_data, subject_data)

## Step 5 
## Create a second, independent tidy data set with the average of each variable
## for each activity and each subject

averages_data <- ddply(all_data, .(Subject, Activity), function(x) colMeans(x[, 1:66]))
write.table(averages_data, "averages_data.txt", row.name=FALSE)
