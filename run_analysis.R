#Start of question # 1
#Loading library to manage data
library("dplyr")
#Opening Features 
features <- read.table("./data/features.txt");
#opening Activities
alabels <- read.table("./data/activity_labels.txt");
names(alabels) <- c("activity_code", "activity")
#Open data from test file
stest <- read.table("./data/test/subject_test.txt");
names(stest) <- "subject";
xtest <- read.table("./data/test/X_test.txt");
names(xtest) <- features$V2
ytest <- read.table("./data/test/y_test.txt");
names(ytest) <- "activity_code";
test <- cbind(stest, ytest, "mode" = "test", xtest)
rm(stest, ytest, xtest)

#Open data from train file
strain <- read.table("./data/train/subject_train.txt");
names(strain) <- "subject";
xtrain <- read.table("./data/train/X_train.txt")
names(xtrain) <- features$V2
ytrain <- read.table("./data/train/y_train.txt")
names(ytrain) <- "activity_code"
train <- cbind(strain, ytrain, "mode" = "train", xtrain)
rm(strain, ytrain, xtrain, features)

# Merging tables
HAR <- rbind(test, train)
rm(test, train)

#Start of Question # 2
temp <- select(HAR, subject, activity_code, mode)
for (var in names(HAR)){
        var1 <- str_subset(var, "[Mm]ean|[Ss]td")
        if(length(var1) != 0){
                temp <- mutate(temp, HAR[var1])
        }
}
HAR <- temp
rm(temp, var, var1)

#Start of Question # 3
HAR <- merge(alabels, HAR, by = "activity_code")
rm(alabels)

#Start of Question # 4
newnames <- gsub("\\(|,", "-", gsub("\\()|\\)", "", names(HAR)))
names(HAR) <- newnames
rm(newnames)

#Start of question # 5
#HAR3 <- HAR2
#HAR3 %>%
 #       select(3, 1, 2, 4:90) %>%
  #      arrange(subject, activity_code) %>%
   #     group_by(subject, activity_code, activity) %>%
    #    summarise_all(mean) %>%
     #   mutate()
HAR <- select(HAR, 3, 1, 2, 4:90)
HAR <- arrange(HAR, subject, activity_code)
HAR <- group_by(HAR, subject, activity_code, activity, mode)
HARMean <- summarise_all(HAR, mean)