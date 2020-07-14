#Start of question # 1
#Loading library to manage data
library("dplyr")
library("stringr")

#Opening Features 
features <- read.table("features.txt");

#opening Activities
alabels <- read.table("activity_labels.txt");
names(alabels) <- c("activity_code", "activity")

#Open data from test file
stest <- read.table("subject_test.txt");
names(stest) <- "subject";
xtest <- read.table("X_test.txt");
names(xtest) <- features$V2
ytest <- read.table("y_test.txt");
names(ytest) <- "activity_code";
test <- cbind(stest, ytest, "mode" = "test", xtest)
rm(stest, ytest, xtest) # Removing variables

#Open data from train file
strain <- read.table("subject_train.txt");
names(strain) <- "subject";
xtrain <- read.table("X_train.txt")
names(xtrain) <- features$V2
ytrain <- read.table("y_train.txt")
names(ytrain) <- "activity_code"
train <- cbind(strain, ytrain, "mode" = "train", xtrain)
rm(strain, ytrain, xtrain, features)  # Removing variables

# Merging tables
HAR <- rbind(test, train)
rm(test, train) # Removing variables

#Start of Question # 2
temp <- select(HAR, subject, activity_code, mode)
for (var in names(HAR)){
        var1 <- str_subset(var, "[Mm]ean|[Ss]td")
        if(length(var1) != 0){
                temp <- mutate(temp, HAR[var1])
        }
}
HAR <- temp
rm(temp, var, var1) # Removing variables

#Start of Question # 3
HAR <- merge(alabels, HAR, by = "activity_code")
rm(alabels) # Removing variables

#Start of Question # 4
newnames <- names(HAR)
newnames <- gsub("Acc", "Acceleromter", newnames)
newnames <- gsub("Gyro", "Gyroscope", newnames)
newnames <- gsub("Mag", "Magnitude", newnames)
newnames <- gsub("Freq", "Frequency", newnames)
newnames <- gsub("Gyro", "Gyroscope", newnames)
newnames <- gsub("std", "standard-deviation", newnames)
names(HAR) <- newnames
rm(newnames) # Removing variables

#Start of question # 5
HAR <- select(HAR, 3, 1, 2, 4:90)
HAR <- arrange(HAR, subject, activity_code)
HARmean <- group_by(HAR, subject, activity_code, activity, mode)
HARmean <- summarise_all(HARmean, mean)