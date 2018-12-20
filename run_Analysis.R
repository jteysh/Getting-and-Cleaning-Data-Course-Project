 
# loading packages
packages <- c("data.table", "reshape2")
sapply(packages, require, character.only=TRUE, quietly=TRUE)

# extracting file
wd <- getwd()
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, file.path(wd, "dataFiles.zip"))
unzip(zipfile = "dataFiles.zip")

# load activity labels
activity_labels <- fread(file.path(wd, "UCI HAR Dataset/activity_labels.txt")
                        , col.names = c("classLabels", "activityName"))

# load features
features <- fread(file.path(wd, "UCI HAR Dataset/features.txt")
                  , col.names = c("index", "featureNames"))
features_wanted <- grep("(mean|std)\\(\\)", features[, featureNames])
measurements <- features[features_wanted, featureNames]
measurements <- gsub('[()]', '', measurements)

# load train datasets
train <- fread(file.path(wd, "UCI HAR Dataset/train/X_train.txt"))[, features_wanted, with = FALSE]
data.table::setnames(train, colnames(train), measurements)
train_activities <- fread(file.path(wd, "UCI HAR Dataset/train/Y_train.txt")
                         , col.names = c("Activity"))
train_subjects <- fread(file.path(wd, "UCI HAR Dataset/train/subject_train.txt")
                       , col.names = c("SubjectNum"))
train <- cbind(train_subjects, train_activities, train)

# load test datasets
test <- fread(file.path(wd, "UCI HAR Dataset/test/X_test.txt"))[, features_wanted, with = FALSE]
data.table::setnames(test, colnames(test), measurements)
test_activities <- fread(file.path(wd, "UCI HAR Dataset/test/Y_test.txt")
                        , col.names = c("Activity"))
test_subjects <- fread(file.path(wd, "UCI HAR Dataset/test/subject_test.txt")
                      , col.names = c("SubjectNum"))
test <- cbind(test_subjects, test_activities, test)

# merge datasets
combined <- rbind(train, test)

# Uses descriptive activity names to name the activities in the data set
combined[["Activity"]] <- factor(combined[, Activity]
                                 , levels = activity_labels[["classLabels"]]
                                 , labels = activity_labels[["activityName"]])
combined[["SubjectNum"]] <- as.factor(combined[, SubjectNum])
combined <- reshape2::melt(data = combined, id = c("SubjectNum", "Activity"))
combined <- reshape2::dcast(data = combined, SubjectNum + Activity ~ variable, fun.aggregate = mean)

data.table::fwrite(x = combined, file = "tidy_dataset.txt", quote = FALSE)
