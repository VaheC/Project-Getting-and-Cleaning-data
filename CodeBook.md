https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The data are collected from the accelerometers from the Samsung Galaxy S smartphone. A full description 
is available at the site below:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

There are several variables in the code, which are explained below:

f  - features

al - activity_labels

st - subject_train

xt - x_train

yt - y_train

ste - subject_test

xte - x_test

yte - y_test

a_id - id of activity (first column in al, column in yt and column in yte)

type - type of activity (second column in al)

s_id - id of subject (column of st, ste)

td - data frame derived from the combination of yt, st and xt
       
tde - data frame derived from the combination of yte, ste and xte

fd - combination of td and tde

mf - fd only representing data on mean and meanFreq for each measurement 

m - fd only representing data on mean for each measurement 

s - fd only representing data on standard deviation for each measurement