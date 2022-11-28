## Read the data and create a subset of the data
filename <- "household_power_consumption.txt"
data <- read.table(filename, header = TRUE, sep = ";", stringsAsFactors = FALSE)
SubsetData <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

## Convert the time and date from the subset to make a time series plot
date_time <- strptime(paste(SubsetData$Date, SubsetData$Time, sep = " "), 
                      "%d/%m/%Y %H:%M:%S")
## Before plotting, change the "Global_active_power" column to numeric
gap_numeric <- as.numeric(SubsetData$Global_active_power) 

## After, convert the all three of the sub metering columns to numeric
sub1 <- as.numeric(SubsetData$Sub_metering_1)
sub2 <- as.numeric(SubsetData$Sub_metering_2)
sub3 <- as.numeric(SubsetData$Sub_metering_3)

## Plot 3
png(filename = "plot3.png", width = 480, height = 480)
plot(date_time, sub1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(date_time, sub2, type = "l", col = "red")
lines(date_time, sub3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1, col = c("black", "red", "blue"))
dev.off()
