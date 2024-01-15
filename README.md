The goal of this project was to output the mean and std data for the subjects, grouped by labels. To do this, the run_analysis script loads in the X_test, Y_test, X_train, and Y_train datasets.

The datasets are merged into one table by creating a new column with the Y-data (cbind) and then adding the training set to the test set (rbind)

The original data had more variables than were necessary for this project, so all variables except those calculating a mean() or std() were removed.

The y column labels were defined
  1 WALKING
  2 WALKING_UPSTAIRS
  3 WALKING_DOWNSTAIRS
  4 SITTING
  5 STANDING
  6 LAYING

The table was grouped by it's y-labels and the averages are output in a table by label and variable
