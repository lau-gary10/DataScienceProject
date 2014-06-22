
## Merge activity names to the labels
append_activity_name_to_vectors <- function(theVec, actLabel){
        merge(actLabel, theVec)
}

## Get the column numbers of the colnames that contain the regular expression
get_column_numbers <- function(dataset, regEx){
        extractCols <- grep( regEx, names( dataset ) )
}

## Creates a tidy dataset based on theRegEx
create_tidy_dataset <- function(theRegEx){
        xTest <- read.table( "./UCI HAR Dataset/test/X_test.txt", colClasses="character")
        yTest <- read.table( "./UCI HAR Dataset/test/Y_test.txt", colClasses="character")
        xTrain <- read.table( "./UCI HAR Dataset/train/X_train.txt", colClasses="character")
        yTrain <- read.table( "./UCI HAR Dataset/train/Y_train.txt", colClasses="character")
        actLabel <- read.table( "./UCI HAR Dataset/activity_labels.txt", colClasses="character")
        features <- read.table( "./UCI HAR Dataset/features.txt", colClasses="character")
        colnames(xTest) <- features$V2
        colnames(xTrain) <- features$V2
        
        ## Uses descriptive activity names to name the activities in the data set
        ## Corresponds with project's Part 3.
        yTest <- append_activity_name_to_vectors(yTest, actLabel)
        yTrain <- append_activity_name_to_vectors(yTrain, actLabel)
        
        ## Extracts only the measurements on the mean and standard deviation for each 
        ##      measurement.
        ## Corresponds with project's Part 2.
        xTestColNum <- get_column_numbers(xTest, theRegEx)
        xTrainColNum <- get_column_numbers(xTrain, theRegEx)
        
        xTest <- xTest[, xTestColNum]
        xTrain <- xTrain[, xTrainColNum]
        
        ## Bind y___ with x___
        xTest <- cbind(yTest, xTest)
        xTrain <- cbind(yTrain, xTrain)
        
        ## Merges the training and the test sets to create one data set. 
        ## Corresponds with project's Part 1.
        tidyDataset1 <- merge(xTest, xTrain, all=TRUE)
        
        ## Appropriately labels the data set with descriptive variable names. 
        ## Corresponds with project's Part 4.
        colnames(tidyDataset1)[1] <- "activity_labels_integer"
        colnames(tidyDataset1)[2] <- "activity_labels"
        tidyDataset1
}

## Changes the values in the dataset from character to numeric
change_from_character_to_numeric <- function(dataset){
        i <- sapply(dataset, is.character)
        dataset[i] <- lapply(dataset[i], as.numeric)
        dataset
}

setwd("G:/Downloads/Online Course Coursera - Getting and Cleaning Data/Getting and Cleaning Data Course Project")

theRegEx <- "-mean\\(\\)|std\\(\\)"
tidyData1 <- create_tidy_dataset(theRegEx)

## Creates the first dataset
write.table(tidyData1, file="./tidyData1.txt")

## I'm unable to figure out how to average the signals, activities, and features into 
##      another dataset. Please give me some suggestions.
newTidyData1 <- tidyData1[, c( 2:length( names( tidyData1 ) ) ) ]
newTidyData1[, c( 2:length( names( newTidyData1 ) ) )] <- change_from_character_to_numeric( newTidyData1[, c( 2:length( names( newTidyData1 ) ) ) ] )

tmp <- newTidyData1[[ names( newTidyData1[2] ) ]]

library(plyr)
focusData <- ddply(newTidyData1, .(activity_labels), summarize, 
                   mean=mean( newTidyData1[ , c( names[2] ) ] ) )