# read sample data
allData <- read.csv('../exdata1/household_power_consumption.txt', sep = ';',header = T, na.strings="?")
# convert separate date and time fields to POSIXlt date type
allData$Date <- strptime(paste(allData$Date, allData$Time), "%d/%m/%Y %H:%M:%S")

# subset sample data
plotData <- allData[(as.Date(allData$Date) == '2007-02-01' | as.Date(allData$Date) =='2007-02-02'),]

# make a plot
hist(plotData$Global_active_power, col="red", xlab='Global Active Power (kilowatts)', main = "Global Active Power")

# save plot to the file in PNG image format
dev.copy(png, 'plot1.png')
dev.off()

