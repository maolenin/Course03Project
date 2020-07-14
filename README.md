# Course03Project
## Getting and Cleaning Data Course Project
### DATA
#### Temporary variables
##### General variables
1. features:  List of all features.
2. alabels:   Activity labels.
##### Test variables
3. stest:     Subject test.
4. xtest:     Test set.
5. ytest:     Test labels.
6. **test:    Data frame of test data set tidy**
##### Train variables
7. strain:     Subject train.
8. xtrain:     Train set.
9. ytrain:     Train labels.
10. **train:    Data frame of train data set tidy**
##### working variables
11. temp: Variables used to clean the headers.
12. var: Variables used to clean the headers.
13. var1: Variables used to clean the headers.
#### Final variables
1. HAR:    Final Tidy data set.
2. HARmean: Data set mean Summarized by subject and by activity.
### HEADERS for HAR and HARmean
1. subject: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
2. activity_code: labels with their activity name showed by number with 6 categories.
3. activity: labels with their activity name showed by letter with 6 categories.
4- mode: indicates if the data was get from **test mode** or **train mode**
5:90: mean of each variable of the data obtained from Galaxy phones for HAR, being an average fro HARmean for each subject and by activity.

### CODE
The code was cut in five parts, where each part represents the question. It was used 13 temporary variables to get and clean the data.
#### First Part
- The firsts lines is to load the libraries "dplyr" and "stringr" to manipulate all the data
- The next lines in the first part was for load and clean the data.
- Each sub part in the first was written for load **test data** and **train data**
- At the end both test and train data was merged, with this the question #1 was solved.
- To clean the working directory all temporary data used was removed
#### Second Part
- The data was subset acoording the requiriments in the question2 that was get only the data where the meas was stored.
- To clean the working directory all temporary data used was removed
#### Third Part
- The data obtained in the second question was merged with the activity labels in order te get a tidy data with names of each activity.
- To clean the working directory all temporary data used was removed
#### Forth Part
- This lines of code was written to clean the headers with appropriate names.
- To clean the working directory all temporary data used was removed
#### Fifth Part
- All the data was re-arranged in order to grouped to summarise by mean.
