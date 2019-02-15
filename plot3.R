## Read the data into R and select the required time period.

data<-read.table("./R/Coursera/Exploratory Data Analysis/Week 1/household_power_consumption.txt",header = TRUE, sep=";", na.strings = "?", colClasses = c("factor","factor","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

library(lubridate)
data$datetime<-dmy_hms(paste(data$Date,data$Time))
data$Date<-dmy(data$Date)
plot_data<-subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

## Set to English to show the correct weekdays
Sys.setlocale("LC_TIME", "English")

## Create the line graph that displays the usage of the three energy sub meterings during the two days
png("./R/Coursera/Exploratory Data Analysis/Week 1/plot3.png",width = 480, height = 480)
plot(plot_data$datetime,plot_data$Sub_metering_1,type="l",ylab="Energy sub metering", xlab="")
lines(plot_data$datetime,plot_data$Sub_metering_2,type="l", col="red")
lines(plot_data$datetime,plot_data$Sub_metering_3,type="l", col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()