# Reads in test and train datasets, and truncates them according to the requirement separately, before merging them together
# towards the end to finally format its column names in a descriptive format. 
# Requirement 4 is satisfied with the dataframe "df" as the solution.


#load libraries
library(dplyr)

### PARTS 1 -- 4 ###

#read test data set
subjects_test <- read.table(file="dataset/test/subject_test.txt",header=FALSE)
x_test <- read.table(file="dataset/test/X_test.txt",header=FALSE)
y_test <- read.table(file="dataset/test/y_test.txt",header=FALSE)
#read train data set
subjects_train <- read.table(file="dataset/train/subject_train.txt",header=FALSE)
x_train <- read.table(file="dataset/train/X_train.txt",header=FALSE)
y_train <- read.table(file="dataset/train/y_train.txt",header=FALSE)

#set column names
features <- read.table(file="dataset/features.txt",header=FALSE)
colnames(x_test) <- features$V2
colnames(x_train) <- features$V2
colnames(subjects_test) <- c("VolunteerID")
colnames(subjects_train) <- c("VolunteerID")
colnames(y_test) <- c("ActivityID")
colnames(y_train) <- c("ActivityID")

###############################################################################################################
#Requirement 2: Extract only the measurements on the mean and standard deviation for each measurement.
###############################################################################################################
#find indices of mean and standard deviations of features, exclude meanFrequency() columns
indices <- features$V1[grep("mean\\(|std\\(", features$V2)]
#truncate x_test/train columns
x_test <- x_test[,indices]
x_train <- x_train[,indices]

###############################################################################################################
#Requirement 1: Merge the training and the test sets to create one data set.
###############################################################################################################
#construct data frames for test and train
df <- data.frame(volunteer_id=subjects_test, activity_id=y_test)
df <- cbind(df,x_test)
df_train <- data.frame(volunteer_id=subjects_train, activity_id=y_train)
df_train <- cbind(df_train,x_train)
#combine both test and train dataframes to meet requirement
df <- rbind(df,df_train)

###############################################################################################################
#Requirement 3: Use descriptive activity names to name the activities in the data set
###############################################################################################################
#use descriptive activity names
activities <- read.table("dataset/activity_labels.txt",header=FALSE)
colnames(activities) <- c("ActivityID", "Activity")
df <- merge(activities,df,by="ActivityID", all=TRUE)
#remove activity_id column
df <- df[,-which(names(df) %in% c("ActivityID"))]

###############################################################################################################
#Requirement 4: Appropriately label the data set with descriptive variable names.
###############################################################################################################
#Format column names to descriptive format
names(df) <- gsub("^t", "time", names(df))
names(df) <- gsub("^f", "frequency", names(df))
names(df) <- gsub("Acc", "Accelerometer", names(df))
names(df) <- gsub("Gyro", "Gyroscope", names(df))
names(df) <- gsub("Mag", "Magnitude", names(df))
names(df) <- gsub("BodyBody", "Body", names(df))
names(df) <- gsub("mean", "Mean", names(df))
names(df) <- gsub("std", "StandardDeviation", names(df))
names(df) <- gsub("\\(\\)", "", names(df)) #remove ()


### PARTS 5 ###
###############################################################################################################
#Requirement 5: Create a second, independent tidy data set with the average of each variable for each activity 
#and each subject.
###############################################################################################################
#group by VolunteerID and Activity and use find means of each column
df_new = df %>% group_by(VolunteerID,Activity) %>% summarise_each(funs(mean))
#output a file with this new independent tidy data set
write.table(df_new, file = "volunteer_activity_averages.txt",row.name=FALSE)

