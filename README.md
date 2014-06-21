
What I first did was read the following files:
X_test.txt, Y_test.txt, X_train.txt, Y_train.txt, activity_labels.txt, features.txt

Then, I assigned the values in features.txt as column names for X_test.txt and X_train.txt.

Then, I merged the values in activity_labels.txt into Y_test.txt and Y_train.txt.

Then, I grabbed the columns in X_test.txt and X_train.txt whose names contain "mean()" or "std()" and assigned it to another variables: xTest and xTrain, respectively.

I combined Y_test.txt with xTest, and Y_train.txt with xTrain, in order to merge both xTest and xTrain together into one dataset: tinyDataset1.

I renamed the first two columns of tinyDataset1 as "activity_labels_integer" and "activity_labels".