#filePath
dataFile <- "./data/household_power_consumption.txt"
#loadData
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#subsetting
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#scatterplot of dateTime Vs Energy Sub metering 1, 2, 3
#dateTime in "%d/%m/%Y %H:%M:%S" format
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
#numeric
globalActivePower <- as.numeric(subSetData$Global_active_power)
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)
#plot3.png
png("plot3.png", width=480, height=480)
#scatterplot
plot(datetime, subMetering1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()