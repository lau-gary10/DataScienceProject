
1. What I first did was read the following files:
        X_test.txt, Y_test.txt, X_train.txt, Y_train.txt, activity_labels.txt, features.txt

2. Then, I assigned the values in features.txt as column names for X_test.txt and X_train.txt.

3. Then, I merged the values in activity_labels.txt into Y_test.txt and Y_train.txt.

4. Then, I grabbed the columns in X_test.txt and X_train.txt whose names contain "mean()" or "std()" and assigned it to another variables: xTest and xTrain, respectively.

5. I combined Y_test.txt with xTest, and Y_train.txt with xTrain, in order to merge both xTest and xTrain together into one dataset: tinyDataset1.

6. I renamed the first two columns of tinyDataset1 as "activity_labels_integer" and "activity_labels".

7. Then I output the dataset as tidyData1.txt

8. For the next dataset, I removed the "activity_labels_integer" column and assigned it variable "tidyData2"

9. Then I change all the value types of tidyData2 into numeric, except for the "activity_labels" column.

10. Then I averaged all the columns by activity_labels.

11. Then I output the dataset as tidyData2.txt

To read the new dataset, use:
        your_variable_name <- read.table("./name_of_dataset.txt", colClasses="character")