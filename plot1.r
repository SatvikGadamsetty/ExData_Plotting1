## Reading in full data set from home directory
## Converting date to appropriate format %d-%m-%Y
full_data <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
full_data$Date <- as.Date(full_data$Date, format="%d/%m/%Y")

## Subsetting the data for data of interest: between Feb 01 and Feb 02
data <- subset(full_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Converting dates to appropriate format %d-%m-%Y %h-%m-%s
full_date <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(full_date)

## Plot 1
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()