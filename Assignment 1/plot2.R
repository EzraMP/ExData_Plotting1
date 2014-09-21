## Reading and selecting proper data
sourceFile<-file("household_power_consumption.txt","r");
plotData <- read.table(text = grep("^[1,2]/2/2007|^Date",readLines(sourceFile),value=TRUE),header=TRUE,sep=";",na.strings="?");

## Setting up new column with date and time
plotData$datetime=strptime(paste(plotData$Date, plotData$Time), format="%d/%m/%Y %H:%M:%S")

## Drawing Plot 2
plot(plotData$datetime,plotData$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")

## Copying Plot 2 to PNG file
dev.copy(png, file="plot2.png")
dev.off()