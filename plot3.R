setwd("C:/work/R-prog/exdata-data-household_power_consumption")

## Load the household_power_consumption.txt data
## and filter the data to use only the Feb 1-2, 2007 subset.
## The plotting data will be stored in the "toplot" data frame.

source("plot.R")

## at this point the variable, toplot
## contains the relevant data 


## Use a PNG file as plotting device
png("plot3.png", width=480, height=480,units="px")

## Plot the histogram
plot(x=toplot$date_and_time,
     y=toplot$Sub_metering_1,
     type="l", 
     ylab="Energy sub metering",
     xlab="")
points(toplot$date_and_time,toplot$Sub_metering_2,type="l",col="red")
points(toplot$date_and_time,toplot$Sub_metering_3,type="l",col="blue")
legend("topright", lty=1,col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

## completed.
dev.off()