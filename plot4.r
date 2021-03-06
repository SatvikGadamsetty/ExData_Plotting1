## ## ## Reading in full data set from home directory
## Converting date to appropriate format %d-%m-%Y
full_data <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
full_data$Date <- as.Date(full_data$Date, format="%d/%m/%Y")

## Subsetting the data for data of interest: between Feb 01 and Feb 02
data <- subset(full_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Converting dates to appropriate format %d-%m-%Y %h-%m-%s
full_date <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(full_date)

## Plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data, {
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power", xlab="")
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage", xlab="datetime")
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,cex=0.8,
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global_reactive_power",xlab="datetime")
})

## Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()