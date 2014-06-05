## Exploratory Data Analysis
## Project 1
## Plot4

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

## create four plots 2 x 2 in same device
png(file = "plot4.png")
par(mfrow = c(2, 2))
with(powerdf, {
  plot(DateTime, Global_active_power, 
           type = "l", 
           ylab = "Global Active Power",
           xlab = "")
  plot(DateTime, Voltage,
       type = "l", 
       xlab = "datetime")
  plot(DateTime, Sub_metering_1, 
       type = "n",
       ylab = "Energy sub metering",
       xlab = "")
    lines(DateTime, Sub_metering_1, type = "s")
    lines(DateTime, Sub_metering_2, col = "red", type = "s")
    lines(DateTime, Sub_metering_3, col = "blue", type = "s")
    legend("topright", 
         lty = c(1,1,1),
         bty = "n", ## no box around legend
         col = c("black", "red", "blue"), 
         legend = c("Sub_metering1", "Sub_metering2", "Sub_metering3"))
  plot(DateTime, Global_reactive_power,
       type = "l", 
       xlab = "datetime")
  })
dev.off()