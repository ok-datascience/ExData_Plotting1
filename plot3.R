# read sample data
allData <- read.csv('../exdata1/household_power_consumption.txt', sep = ';',header = T, na.strings="?")
# convert separate date and time fields to POSIXlt date type
allData$Date <- strptime(paste(allData$Date, allData$Time), "%d/%m/%Y %H:%M:%S")

# subset sample data
plotData <- allData[(as.Date(allData$Date) == '2007-02-01' | as.Date(allData$Date) =='2007-02-02'),]

# make a plot
plot(plotData$Date, plotData$Sub_metering_1, type="n", xlab="", ylab = "Energy sub metering")
lines(plotData$Date, plotData$Sub_metering_1)
lines(plotData$Date, plotData$Sub_metering_2, col="red")
lines(plotData$Date, plotData$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2",  "Sub_metering_3"), col=c("black","red", "blue"), lty=c(1, 1, 1))

# save plot to the file in PNG image format
dev.copy(png, 'plot3.png')
dev.off()

