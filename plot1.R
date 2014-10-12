setwd("C:/work/R-prog/exdata-data-household_power_consumption")

## Load the household_power_consumption.txt data
## and filter the data to use only the Feb 1-2, 2007 subset.
## The plotting data will be stored in the "toplot" data frame.

source("plot.R")

## at this point the variable, toplot
## contains the relevant data 


## Use a PNG file as plotting device
png("plot1.png", width=480, height=480,units="px")

## Plot the histogram
hist(toplot$Global_active_power, col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")

## completed.
dev.off()
