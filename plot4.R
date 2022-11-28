## Read the data and create a subset of the data
filename <- "household_power_consumption.txt"
data <- read.table(filename, header = TRUE, sep = ";", stringsAsFactors = FALSE)
SubsetData <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

## Convert the time and date from the subset to make a time series plot
date_time <- strptime(paste(SubsetData$Date, SubsetData$Time, sep = " "), 
                      "%d/%m/%Y %H:%M:%S")
## Before plotting, change the "Global_active_power" and "Global_reactive_power" 
## columns to numeric
gap_numeric <- as.numeric(SubsetData$Global_active_power) 
grp_numeric <- as.numeric(SubsetData$Global_reactive_power)

## Next, change the "Voltage" column to numeric
volt <- as.numeric(SubsetData$Voltage)

## After, convert the all three of the sub metering columns to numeric
sub1 <- as.numeric(SubsetData$Sub_metering_1)
sub2 <- as.numeric(SubsetData$Sub_metering_2)
sub3 <- as.numeric(SubsetData$Sub_metering_3)

## Plot 4
png(filename = "plot4.png", width = 480, height = 480)
#Set the parameters
par(mfrow = c(2,2))

#1st Plot
plot(date_time, gap_numeric, type="l", xlab = "", ylab = "Global Active Power")

#2nd Plot
plot(date_time, volt, type="l", xlab = "datetime", ylab = "Voltage")

#3rd Plot
plot(date_time, sub1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(date_time, sub2, type = "l", col = "red")
lines(date_time, sub3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1, col = c("black", "red", "blue"))

#4th Plot
plot(date_time, grp_numeric, type = "l", xlab = "datetime", 
     ylab = "Global_reactive_power")

dev.off()