#filePath
dataFile <- "./data/household_power_consumption.txt"
#loadData
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#subsetting
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Histogram of globalActivePower
#numeric
globalActivePower <- as.numeric(subSetData$Global_active_power)
#plot1.png
png("plot1.png", width=480, height=480)
#histogram
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()