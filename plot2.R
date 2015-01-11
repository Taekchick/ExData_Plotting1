## This script will create a line graph of power consumption over a 2-day 
## period in Febuary in 2007
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
png(filename="plot2.png", width=480, height=480, bg="transparent" )
plot(subdata$DateTime, subdata$Global_active_power, type="l", xlab="", 
     ylab="Global Active Power (kilowatts)")
dev.off()

## Free subdata since now we are done with it
rm(subdata)