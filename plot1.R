## Read the data into R and select the required time period.

data<-read.table("./R/Coursera/Exploratory Data Analysis/Week 1/household_power_consumption.txt",header = TRUE, sep=";", na.strings = "?", colClasses = c("factor","factor","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

library(lubridate)
data$Date<-dmy(data$Date)
data$Time<-hms(data$Time)
plot_data<-subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

## Create the histogram that displays the frequency of the Global Active Power
png("./R/Coursera/Exploratory Data Analysis/Week 1/plot1.png",width = 480, height = 480)
hist(plot_data$Global_active_power,col="red",xlab= "Global Active Power (kilowatts)", main="Global Active Power")
dev.off()