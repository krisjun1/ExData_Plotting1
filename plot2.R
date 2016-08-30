#filePath
dataFile <- "./data/household_power_consumption.txt"
#loadData
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#subsetting
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#scatterplot of dateTime Vs globalActivePower
#dateTime in %d/%m/%Y %H:%M:%S format
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
#numeric globalActivePower
globalActivePower <- as.numeric(subSetData$Global_active_power)
#plot2.png
png("plot2.png", width=480, height=480)
#scatterplot
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()