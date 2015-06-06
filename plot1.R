## This code was developed for the Project 1 of the Exploratory data analysis Course

## To help with formats, I am using the dplyr and lubridate libraries
library(dplyr)
library(lubridate)

## Reads the dataset
        Dataset <- tbl_df(read.table("household_power_consumption.txt", header=TRUE, sep=";", colClasses="character"))

## Formats the date in POSIXlt format 
        Dataset <- mutate(Dataset, Date = dmy(Date), Global_active_power = as.numeric(Global_active_power))

## Filters the dataset to keep Feb 1,2 of 2007
        Dataset2 <- filter(Dataset, year(Date)==2007 & month(Date)==02 & (day(Date)==01 | day(Date)==02))

## Make Plot1.png - Histogram - Directly in PNG Graphic Device
        png("plot1.png", width = 480, height = 480)
        hist(Dataset2$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
        dev.off()
