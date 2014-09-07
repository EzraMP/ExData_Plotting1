## Reading and selecting proper data
sourceFile<-file("household_power_consumption.txt","r");
plotData <- read.table(text = grep("^[1,2]/2/2007|^Date",readLines(sourceFile),value=TRUE),header=TRUE,sep=";",na.strings="?");

## Setting up new column with date and time
plotData$datetime=strptime(paste(plotData$Date, plotData$Time), format="%d/%m/%Y %H:%M:%S")

## Drawing Plot 4
par(mfrow=c(2,2))
plot(plotData$datetime,plotData$Global_active_power, type="l", ylab="Global Active Power", xlab="")
plot(plotData$datetime,plotData$Voltage, type="l", ylab="Voltage", xlab="datetime")
plot(plotData$datetime,plotData$Sub_metering_1,type="l", xlab="", ylab="Energy sub metering")
lines(plotData$datetime,plotData$Sub_metering_2,col="red")
lines(plotData$datetime,plotData$Sub_metering_3,col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n", lty=1, col=c("black", "red", "blue"))
plot(plotData$datetime,plotData$Global_reactive_power,type="l", ylab="Global_reactive_power", xlab="datetime")

## Copying Plot 4 to PNG file
dev.copy(png, file="plot4.png")
dev.off()