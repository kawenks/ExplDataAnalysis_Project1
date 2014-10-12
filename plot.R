library(lubridate)
library(dplyr)

if (!getwd() == "./exdata-data-household_power_consumption") {
    dir.create("./exdata-data-household_power_consumption", showWarnings=FALSE)
    setwd("./exdata-data-household_power_consumption")
}

if (!file.exists("household_power_consumption.txt")) {
    URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(URL,"download.zip")
    unzip("download.zip")
}

## read the whole data file into a data frame
##
## note: it took longer to load if other operations were applied
##       to the data as it loaded. I decided to load all. Then 
##       (almost) immediately filter the data to its smallest size
##       I found by looking at the data in a text viewer that the
##       relevant February 2007 data started at row 21998

data <- read.csv("household_power_consumption.txt",
            header=FALSE, sep=";",
            col.names=c("Date","Time","Global_active_power",
                        "Global_reactive_power","Voltage",
                        "Global_intensity","Sub_metering_1",
                        "Sub_metering_2", "Sub_metering_3"),
            skip=21998,
            na.strings="?")
ddata <- tbl_df(data)

## clean up the raw data space
rm(data)

## Filter the data, then convert the fields to their proper classes
toplot <- ddata %>% 
          filter(Date %in% c('1/2/2007','2/2/2007')) %>% 
          mutate(Date = dmy(Date),
                     date_and_time = ymd_hms(paste(Date,Time))) #, 
                     #Global_active_power = as.numeric(Global_active_power),
                     #Global_reactive_power = as.numeric(Global_reactive_power),
                     #Voltage = as.numeric(Voltage),
                     #Global_intensity = as.numeric(Global_intensity),
                     #Sub_metering_1 = as.numeric(Sub_metering_1),
                     #Sub_metering_2 = as.numeric(Sub_metering_2),
                     #Sub_metering_3 = as.numeric(Sub_metering_3))

## clean up -- since we're using this for other plot scripts
## only make available the ** toplot ** data frame.
rm(ddata)