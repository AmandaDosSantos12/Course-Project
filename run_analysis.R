#load dplyr package
library(dplyr)

run_analysis <- function() {

#load data into variables x_test, y_test, x_train, y_train
  x_test <- read.table("data/test/X_test.txt") 
  y_test <- read.table("data/test/Y_test.txt") 
  
  x_train <- read.table("data/train/X_train.txt") 
  y_train <- read.table("data/train/Y_train.txt") 

#load feautures to be used as column names
  features <- read.table("data/features.txt")[,2]

#combine data into one data frame and set column names
  dataset <- rbind(cbind(x_test, y_test), cbind(x_train, y_train))
  names(dataset) <- c(features, 'y')

#remove all columns not calculating mean or std
# and map y column to appropriate labels
  dataset <- select(dataset, c(grep("mean[()]|std[()]",names(dataset)), y)) %>%
    mutate(y = case_when(
      y == 1 ~ "WALKING",
      y == 2 ~ "WALKING_UPSTAIRS",
      y == 3 ~ "WALKING_DOWNSTAIRS",
      y == 4 ~ "SITTING",
      y == 5 ~ "STANDING",
      y == 6 ~ "LAYING"
      )
    ) %>%
    group_by(y)

#return means of all columns grouped by activity, y
  aggregate(. ~y, dataset, mean)
}  

  