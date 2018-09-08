#set working directory
setwd("C:/Users/Lena/Desktop/Data Science/Course 4/Week 1/")
#read in full data set
#memory usage is approximately number rows * number columns * 8
data_all <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                     nrows=2075259)
#subset data to relevant days
data <- subset(data_all, Date %in% c("1/2/2007","2/2/2007"))
#format date to date class
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
#format time to datetime class
data$Time <- as.POSIXct(paste(data$Date, data$Time))
#divide plot into 4 squares
par(mfrow = c(2, 2))
#create plot with y-axis label
plot(data$Time,data$Global_active_power, type="l",
     ylab="Global Active Power", xlab="")
plot(data$Time,data$Voltage, type="l", xlab = "datetime", ylab = "Voltage")

plot(data$Time,data$Sub_metering_1, type="l",
     ylab="Energy Sub Metering", xlab="")
lines(data$Time,data$Sub_metering_2,col='Red')
lines(data$Time,data$Sub_metering_3,col='Blue')
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(data$Time,data$Global_reactive_power, type="l", xlab = "datetime", ylab = "Global_reactive_power")
#copy plot to png fle
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()