## This script will plot 4 different power consumption graphs based 
## on the household power consumption data, ranged in 2 days in Feburary 2007
consumption <- read.table("household_power_consumption.txt", sep=";", 
                          header=TRUE, na.strings="?")
consumption$Date <- as.Date(consumption$Date, format="%d/%m/%Y")

## Only look at the 2 day date range in Febuary
subdata <- subset(consumption, consumption$Date >= "2007-02-01" 
                  & consumption$Date <= "2007-02-02")

## Free consumption data since now we have the subset of consumption
rm(consumption)

## strp time to use the date/time format in the graph
subdata$DateTime <- paste(subdata$Date, subdata$Time) 
subdata$DateTime <- strptime(subdata$DateTime, format="%Y-%m-%d %H:%M:%S") 

## create and add the histogram to png file 
png(filename="plot4.png", width=480, height=480, bg="transparent" )
par(mfrow=c(2,2))
## Graph 1
plot(subdata$DateTime, subdata$Global_active_power, type="l", xlab="", 
     ylab="Global Active Power")
## Graph 2
plot(subdata$DateTime, subdata$Voltage, type="l", 
     xlab="datetime", ylab="Voltage")
## Graph 3
with(subdata, plot(DateTime, Sub_metering_1, xlab="", 
                   ylab="Energy sub metering", type="n" ))
with(subdata, lines(DateTime, Sub_metering_1, col="black"))
with(subdata, lines(DateTime, Sub_metering_2, col="red"))
with(subdata, lines(DateTime, Sub_metering_3, col="blue"))
legend("topright", bty="n", lwd=1, col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
## Graph 4
plot(subdata$DateTime, subdata$Global_reactive_power, type="l", xlab="datetime", 
     ylab="Global_reactive_power")
dev.off()

## Free subdata since now we are done with it
rm(subdata)