#set working directory
setwd("C:/Users/Lena/Desktop/Data Science/Course 4/Week 1/")
#read in full data set
#memory usage is approximately number rows * number columns * 8
data_all <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259)
#subset data to relevant days
data <- subset(data_all, Date %in% c("1/2/2007","2/2/2007"))
#create histogramm with title and axis labels
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
#copy plot to png fle
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()