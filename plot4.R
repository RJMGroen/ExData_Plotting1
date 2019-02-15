## Read the data into R and select the required time period.

data<-read.table("./R/Coursera/Exploratory Data Analysis/Week 1/household_power_consumption.txt",header = TRUE, sep=";", na.strings = "?", colClasses = c("factor","factor","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

library(lubridate)
data$datetime<-dmy_hms(paste(data$Date,data$Time))
data$Date<-dmy(data$Date)
plot_data<-subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

## Set to English to show the correct weekdays
Sys.setlocale("LC_TIME", "English")

## Create the forur graphs with informtaion about the usage of energy during the two days
png("./R/Coursera/Exploratory Data Analysis/Week 1/plot4.png",width = 480, height = 480)
par(mfrow=c(2,2))
## plot 4.1
plot(plot_data$datetime,plot_data$Global_active_power,type="l",ylab="Global Active Power", xlab="")
## plot 4.2
plot(plot_data$datetime,plot_data$Voltage,type="l",ylab="Voltage", xlab="datetime")
## plot 4.3
plot(plot_data$datetime,plot_data$Sub_metering_1,type="l",ylab="Energy sub metering", xlab="")
lines(plot_data$datetime,plot_data$Sub_metering_2,type="l", col="red")
lines(plot_data$datetime,plot_data$Sub_metering_3,type="l", col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty="n")
## plot 4.4
plot(plot_data$datetime,plot_data$Global_reactive_power,type="l",ylab="Global_reactive_power", xlab="datetime")
dev.off()