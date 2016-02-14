# First download data from the web

furl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

download.file(furl,destfile="C:\\Users\\Vahe\\Desktop\\Data.zip")

# Set Desktop as working directory

setwd("C:\\Users\\Vahe\\Desktop")

# Unzip downloaded zip file 

unzip("Data.zip", exdir = "C:\\Users\\Vahe\\Desktop", unzip = "internal")

# Set the unzipped file as the working directory

setwd("C:\\Users\\Vahe\\Desktop\\UCI HAR Dataset")

# Read data from features.txt, activity_labels.txt,subject_train.txt,x_train.txt and y_train.txt into R

f<-read.table('./features.txt',header=FALSE)

al<-read.table('./activity_labels.txt',header=FALSE)

st <- read.table('./train/subject_train.txt',header=FALSE)

xt<-read.table('./train/x_train.txt',header=FALSE)

yt<-read.table('./train/y_train.txt',header=FALSE)

# Name columns of the derived tables

colnames(al)<-c('a_id','type')

colnames(st)<-"s_id"

colnames(xt)<-f[,2]

colnames(yt)<-"a_id"

# Combine yt, st and xt

td<-cbind(yt,st,xt)

# Read data from subject_test.txt,x_test.txt and y_test.txt into R

ste<-read.table('./test/subject_test.txt',header=FALSE)

xte<-read.table('./test/x_test.txt',header=FALSE)

yte<-read.table('./test/y_test.txt',header=FALSE)

# Name columns of the tables derived above

colnames(ste)<-"s_id"

colnames(xte)<-f[,2]

colnames(yte)<-"a_id"

# Combine yte, ste and xte

ted = cbind(yte,ste,xte)

# Combine td and ted

fd = rbind(td,ted)

# Transform fd in order to show only values on mean and meanFreq for each measurement

mf<-fd[,grep("-mean..",colnames(fd))] 

# Transform mf in order to show only values on mean for each measurement

m<-mf[,-grep("-meanFreq..",colnames(mf))] 

# Transform fd in order to show only values on standard deviation for each measurement

s<-fd[,grep("-std..",colnames(fd))]  

# Change activity id with activity type in fd 

for(j in 1:length(al$a_id)){for(i in 1:length(fd$a_id)){if(fd[i,1]==al[j,1]){fd[i,1]<-as.character(al[j,2])}}}

# Trasform fd to represent the average of each variable for each activity and each subject

fd %>% group_by(s_id,a_id) %>%summarise_each(funs(mean(., na.rm = TRUE))) # Error: found duplicated column name: fBodyAcc-bandsEnergy()-1,8,....

# Unfortunately the following error occured: 
# Error: found duplicated column name: fBodyAcc-bandsEnergy()-1,8,....
# Please, help.
# Thank you.
