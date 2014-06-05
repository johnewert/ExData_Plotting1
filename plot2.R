## Exploratory Data Analysis
## Project 1
## Plot2

## data needs to be in subfolder of working directory
## where subfolder is named .\exdata-data-household_power_consumption

## read data into dataframe
filename <- "./exdata-data-household_power_consumption/household_power_consumption.txt"
classes <- c(rep("character", 2), rep("numeric", 7))
powerdf <- read.table(filename, 
                      header = TRUE, 
                      na.strings = "?", 
                      colClasses = classes, 
                      sep = ";")

## Subset to include only the necessary rows (2007-02-01 and 2007-02-02)
powerdf <- powerdf[powerdf$Date %in% c("1/2/2007","2/2/2007"), ]


## create DateTime column
powerdf$Date <- as.Date(powerdf$Date, format = "%d/%m/%Y")
powerdf$DateTime <- strptime(paste(powerdf$Date, powerdf$Time),"%Y-%m-%d %H:%M:%S")

## create line plot of Global_active_power by DateTime
png(file = "plot2.png")
with(powerdf, plot(DateTime, Global_active_power, 
                   type = "l",
                   ylab = "Global Active Power (kilowatts)",
                   xlab = ""))
dev.off()