## Reading and selecting proper data
sourceFile<-file("household_power_consumption.txt","r");
plotData <- read.table(text = grep("^[1,2]/2/2007|^Date",readLines(sourceFile),value=TRUE),header=TRUE,sep=";",na.strings="?");

## Setting up new column with date and time
plotData$datetime=strptime(paste(plotData$Date, plotData$Time), format="%d/%m/%Y %H:%M:%S")

## Drawing Plot 3
plot(plotData$datetime,plotData$Sub_metering_1,type="l", xlab="", ylab="Energy sub metering")
lines(plotData$datetime,plotData$Sub_metering_2,col="red")
lines(plotData$datetime,plotData$Sub_metering_3,col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))

## Copying Plot 3 to PNG file
dev.copy(png, file="plot3.png")
dev.off()