## This code was developed for the Project 1 of the Exploratory data analysis Course

## To help with formats, I am using the dplyr and lubridate libraries
library(dplyr)
library(lubridate)

## Reads the dataset
        Dataset <- tbl_df(read.table("household_power_consumption.txt", header=TRUE, sep=";", colClasses="character"))

## Formats the date in POSIXlt format, then filters for 
        Dataset <- mutate(Dataset, Date = dmy(Date), Global_active_power = as.numeric(Global_active_power))

## Filters the dataset to keep Feb 1,2 of 2007
        Dataset2 <- filter(Dataset, year(Date)==2007 & month(Date)==02 & (day(Date)==01 | day(Date)==02))

## Creates new variable that combiines date and time
        Dataset2 <- mutate(Dataset2, DateTime = ymd_hms(paste(Date,Time)))

##########
## PLOT 2 
##########

## Make Plot2 - Plot
        png("plot2.png", width = 480, height = 480)
        plot(Dataset2$DateTime,Dataset2$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
        dev.off()
