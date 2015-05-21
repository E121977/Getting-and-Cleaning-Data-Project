Analysis performed:

The run_analysis.R script peforms the following steps to clean and derive the final product:

1. All similar data from the training and test data sets are merged using rbind()
2. Those columns with the mean and standard deviation are then extracted from the 
   dataset. 
3. After extraction, the are assinged more meaningful names that are pulled from the 
   features.txt file (included with the dataset).
4. Activity names are also substituted in for their respective columns from the 
   activity_labels.txt file (also included with the data set).
5. Column names are then cleaned up and corrected. 
6. A subsequent data set from this data is generated that contains the average
   measures for each subject and activity type. This information is written out
   to the "averages_data.txt" file. 

Variables:

The data from the original data sets are loaded into the following variable:
x_train
y_train
x_test
y_test
subject_train
subject_test 

The following varibles are created to house merged data from the original data 
set being loaded into memory:
x_data
y_data
subject_data

features: This variable contains the correct names for the x_data data set.

mean_and_std_features: A vector of column names used with the data contained
                       in the features variable to extract the desired data 
                       elements.

activities: Similar to features, this varible is used to store the activities 
            names in order give those activitives their meaningful names. 

all_data: This variable is used to merge the x_data, y_data, and subject_data 
          into a single data set. 

averages_data: This variable is used to store the averages which will later
               be written out to the final output product. 