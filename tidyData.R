#### This script aims to tidy
#### both datasets: test and train

##### Defining a factor of activities to be used throughout the code
activityFactor= factor(c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")) # Factor

##### Reading all the files
xtest= read.table("UCI\\test\\X_test.txt") #Data frame
varNames= read.table("UCI\\features.txt") #Data frame
subject= read.table("UCI\\test\\subject_test.txt") #Data frame
activity= read.table("UCI\\test\\y_test.txt") #Data frame
#####


############## Tidy test ################
## Naming the variables
colnames(xtest)= varNames[,2]

## Creating a var for identify the >>subject<< of each observation
xtest$subject = paste0("subject", as.character(subject[,1]))

## Creating a var for identify the >>activity<< of each observation
activity$actName= activityFactor[activity[,1]] ## Creating second var in 'activity', called actName, which is a factor 
xtest$activity = as.character(activity[,2])

## Renaming rows
row.names(xtest) = paste0("test",row.names(xtest))

## Creating var ID
xtest$id = row.names(xtest)


############## Tidy train ###################

xtrain= read.table("UCI\\train\\X_train.txt")
varNames= read.table("UCI\\features.txt")
subject= read.table("UCI\\train\\subject_train.txt")
activity= read.table("UCI\\train\\y_train.txt")

## Naming the variables
colnames(xtrain)= varNames[,2]

## Creating a var for identify the >>subject<< of each observation
xtrain$subject = paste0("subject", as.character(subject[,1]))

## Creating a var for identify the >>activity<< of each observation
activity$actName= activityFactor[activity[,1]] ## Creating second var in 'activity', called actName, which is a factor 
xtrain$activity = as.character(activity[,2])

## Renaming rows
row.names(xtrain)= paste0("train", row.names(xtrain))   

## Creating var ID
xtrain$id = row.names(xtrain)
