# Code Book

Content Requirement: This code book describes the variables, the data, and any transformations or work that I have performed in order to clean up the data to meet the Course Project requirements.

## Variables

<table>
	<tr>
		<td><b>Variable Name</b></td>
		<td><b>Description</b></td>
	</tr>
	<tr>
		<td>subjects_test</td>
		<td>Vector of Volunteer IDs (1-30) for each data row stored in subject_test.txt file. From <i>test</i> data set.</td>
	</tr>
	<tr>
		<td>subjects_train</td>
		<td>Vector of Volunteer IDs (1-30) for each data row stored in subject_train.txt file. From <i>train</i> data set.</td>
	</tr>
	<tr>
		<td>x_test</td>
		<td>Measurements stored in X_test.txt. 561 features per row, read in as a table. Table eventually gets truncated to only the desired columns. From <i>test</i> data set.</td>
	</tr>
	<tr>
		<td>x_train</td>
		<td>Measurements stored in X_train.txt. 561 features per row, read in as a table. Table eventually gets truncated to only the desired columns. From <i>train</i> data set.</td>
	</tr>
	<tr>
		<td>y_test</td>
		<td>Vector of Activity ID (1-6) for each data row stored in y_test.txt. From <i>test</i> data set.</td>
	</tr>
	<tr>
		<td>y_train</td>
		<td>Vector of Activity ID (1-6) for each data row stored in y_train.txt. From <i>train</i> data set.</td>
	</tr>
	<tr>
		<td>features</td>
		<td>Vector of feature names for all measurements stored in features.txt. 561 features in total.</td>
	</tr>
	<tr>
		<td>activities</td>
		<td>Vector of activity labels for all Activity IDs (1-6) stored in activity_labels.txt. 6 activities in total.</td>
	</tr>
	<tr>
		<td>indices</td>
		<td>Vector of column indexes of only features that we are interested in for this exercise -- only mean and standard deviaiton values.</td>
	</tr>
	<tr>
		<td>df_train</td>
		<td>Dataframe to temporarily store the data from the <i>train</i> data set. Contains one column of VolunteerIDs, one column of ActivityIDs, and remaining columns are the measurements we are interested in (only desired columns).</td>
	</tr>
	<tr>
		<td>df</td>
		<td>Dataframe that stores the final properly formatted data for this exercise. Temporarily used to load the data for the <i>test</i> data set, and row binded with the df_train dataset to get final result. ActivityID column is replaced with Activity column to replace the numeric ID with a descriptive string instead</td>
	</tr>
	<tr>
		<td>df_new</td>
		<td>Dataframe that stores the independent tidy data set of averages by volunteer ID and activity. (Requirement 5)</td>
	</tr>
</table>

## Data

The data for this exercise is from the "Human Activity Recognition Using Smartphones Dataset". The following description of the data is extracted from the README.txt file attached to this dataset.

> The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
>
>The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 
>
> For each record it is provided:
>
> - Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
> - Triaxial Angular velocity from the gyroscope. 
> - A 561-feature vector with time and frequency domain variables. 
> - Its activity label. 
> - An identifier of the subject who carried out the experiment.
>
> Notes: 
> - Features are normalized and bounded within [-1,1].
> - Each feature vector is a row on the text file.

