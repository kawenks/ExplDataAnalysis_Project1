setwd("C:/work/R-prog/exdata-data-household_power_consumption")

## Load the household_power_consumption.txt data
## and filter the data to use only the Feb 1-2, 2007 subset.
## The plotting data will be stored in the "toplot" data frame.

source("plot.R")

## at this point the variable, toplot
## contains the relevant data 


## Use a PNG file as plotting device
png("plot4.png", width=480, height=480,units="px")

par(mfrow=c(2,2))
with(toplot, plot(date_and_time,Global_active_power,type="l",xlab="",ylab="Global Active Power"))
with(toplot, plot(date_and_time,Voltage,type="l",xlab="datetime",ylab="Voltage"))

plot(x=toplot$date_and_time,
           y=toplot$Sub_metering_1,
           type="l", 
           ylab="Energy sub metering",
           xlab="")
points(toplot$date_and_time,toplot$Sub_metering_2,type="l",col="red")
points(toplot$date_and_time,toplot$Sub_metering_3,type="l",col="blue")
legend("topright", lty=1,bty="n", cex=0.5,col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(toplot$date_and_time,toplot$Global_reactive_power,type="l",xlab="DateTime",ylab="Global_reactive_power")

# completed
dev.off()