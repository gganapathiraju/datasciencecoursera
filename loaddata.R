
# loaddata.R for loading data for further analysis
# Gopal Ganapathiraju

# Quiz2 (Assignment 1) - base plotting system in R
# Exploratory Data Analysis April - May 2016
# Solution consists of loaddata.R, plot1.R, plot2.R, plot3.R, plot4.R
# output consists of plot1.png, plot2.png, plot3.png, plot4.png

#

#require(sqldf)
electricpower <- read.csv ("household_power_consumption.txt",
                 colClasses = c("character"
                                , "character", "numeric",
                 "numeric", "numeric", "numeric", "numeric", 
                 "numeric", "numeric"), stringsAsFactors = FALSE,
                 head =TRUE, sep = ";", na.strings = "?")
electricpower$Date<- paste(electricpower$Date,electricpower$Time)
electricpower$Date<- strptime(electricpower$Date, "%d/%m/%Y %H:%M:%S")
electricpower<- electricpower[,c(1,3:9)]
#newdata <- mydata[ which(mydata$gender=='F' 
#                         & mydata$age > 65), ]
electricpower<- electricpower[
  which(electricpower$Date >= "2007-02-01" 
                                 &   electricpower$Date < "2007-02-03"),]

head(electricpower,20)

