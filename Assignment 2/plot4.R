## Adding required libraries
library(ggplot2)

## Reading in the required data
NEI <- readRDS("./exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata_data_NEI_data/Source_Classification_Code.rds")

## Selecting only data with required sources
coalComb <- grep("comb.*coal", SCC$Short.Name, ignore.case = TRUE)
tempData <- NEI[NEI$SCC %in% SCC[coalComb,]$SCC, ]

## Preparing data for plot
p4data <- aggregate(tempData$Emissions, list(year=tempData$year), FUN=sum)

## Creating and printing the plot using ggplot2
plot4 <- ggplot(p4data, aes(year,p4data$x)) +
  geom_point()+
  geom_smooth(aes(group=1),method="loess") +
  ylab(expression("Amount of PM"[2.5]*" emitted [tons]")) +
  xlab("Years") +
  ggtitle(expression("Total Emissions of PM"[2.5]*" from coal combustion-related sources in the USA"))
  
print(plot4)

## Copying Plot 4 to PNG file
dev.copy(png, file="plot4.png")
dev.off()