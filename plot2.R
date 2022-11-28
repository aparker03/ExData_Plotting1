## Read the data and create a subset of the data
filename <- "household_power_consumption.txt"
data <- read.table(filename, header = TRUE, sep = ";", stringsAsFactors = FALSE)
SubsetData <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

## Convert the time and date from the subset to make a time series plot
date_time <- strptime(paste(SubsetData$Date, SubsetData$Time, sep = " "), 
             "%d/%m/%Y %H:%M:%S")

## Before plotting, change the "Global_active_power" column to numeric
gap_numeric <- as.numeric(SubsetData$Global_active_power)

## Plot 2
png(filename = "plot2.png", width = 480, height = 480)
plot(date_time, gap_numeric, type = "l", xlab = "", 
     ylab = "Global Active Power (kilowatts)")
dev.off()