## Obtain the entire dataset
data <- read.csv("./data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                 nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## Subsetting the data
subsetData <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data)

## Converting dates
datetime <- paste(as.Date(subsetData$Date), subsetData$Time)
subsetData$Datetime <- as.POSIXct(datetime)

## Saving to file
png("plot2.png", width=480, height=480)

## Plot 2
plot(subsetData$Global_active_power~subsetData$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.off()
