## Read the data and create a subset of the data
filename <- "household_power_consumption.txt"
data <- read.table(filename, header = TRUE, sep = ";", stringsAsFactors = FALSE)
SubsetData <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

## Before plotting, change the "Global_active_power" column to numeric
gap_numeric <- as.numeric(SubsetData$Global_active_power)

## Plot 1
png(filename = "plot1.png", width = 480, height = 480)
hist(gap_numeric, xlab = "Global Active Power (kilowatts)", 
     col = "red", main ="Global Active Power")

dev.off()