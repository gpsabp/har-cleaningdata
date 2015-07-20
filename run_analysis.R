library(data.table)


#read train and test info
train <- read.table("./UCI HAR Dataset//train//X_train.txt")
trainActivity <- read.table("./UCI HAR Dataset//train//y_train.txt")
trainSubject <- read.table("./UCI HAR Dataset//train//subject_train.txt")

test <- read.table("./UCI HAR Dataset//test//X_test.txt")
testActivity <- read.table("./UCI HAR Dataset//test//y_test.txt")
testSubject <- read.table("./UCI HAR Dataset//test//subject_test.txt")

features <- read.table("./UCI HAR Dataset//features.txt")

#rename labels
colnames(train) <- features[,2]
colnames(trainActivity)[1] <- "Activity" 
colnames(trainSubject)[1] <- "Subject"

colnames(test) <- features[,2]
colnames(testActivity)[1] <- "Activity" 
colnames(testSubject)[1] <- "Subject"

#bind Activity and Subject to train and test
dataTrain <- cbind(train, trainActivity, trainSubject)
dataTest <- cbind(test, testActivity, testSubject)

#bind train and test set
data <- rbind(dataTrain,dataTest)

#select measures with mean and std - also include activity and subject labels
dataTidy <- data[grepl("mean",colnames(data)) | grepl("Mean",colnames(data)) | grepl("std",colnames(data)) | grepl("Std",colnames(data)) | colnames(data)=="Activity" | colnames(data)=="Subject"]

#mean of all variables groubed by activity and subject
dataTidy2 <- aggregate(dataTidy[, 1:86], list(dataTidy$Activity,dataTidy$Subject), mean)

#renames groups
colnames(dataTidy2)[1] <- "Activity" 
colnames(dataTidy2)[2] <- "Subject" 

#write to txt file
write.table(dataTidy2, file="tidyData.txt",row.name=FALSE)
