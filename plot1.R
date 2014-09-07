## Reading and selecting proper data
sourceFile<-file("household_power_consumption.txt","r");
plotData <- read.table(text = grep("^[1,2]/2/2007|^Date",readLines(sourceFile),value=TRUE),header=TRUE,sep=";",na.strings="?");

#Drawing Plot 1
hist(plotData$Global_active_power,xlab= "Global Active Power (kilowatts)", main="Global Active Power" ,col="red")

## Copying Plot 1 to PNG file
dev.copy(png, file="plot1.png")
dev.off()