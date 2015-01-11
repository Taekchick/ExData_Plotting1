## This script will read the household power consumption data and 
## create a histogram of global activity power frequency
## between 2007-02-01 and 2007-02-02
consumption <- read.table("household_power_consumption.txt", sep=";", 
                          header=TRUE, na.strings="?")
consumption$Date <- as.Date(consumption$Date, format="%d/%m/%Y")

## Only look at the 2 day date range in Febuary
subdata <- subset(consumption, consumption$Date >= "2007-02-01" 
                  & consumption$Date <= "2007-02-02")

## Free consumption data since now we have the subset of consumption
rm(consumption)

## create and add the histogram to png file 
png(filename="plot1.png", width=480, height=480, bg="transparent" )
hist(subdata$Global_active_power, 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", 
     col="red", main="Global Active Power")
dev.off()

## Free subdata since now we are done with it
rm(subdata)