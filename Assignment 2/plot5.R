## Adding required libraries
library(ggplot2)

## Reading in the required data
NEI <- readRDS("./exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata_data_NEI_data/Source_Classification_Code.rds")

## Selecting only data with required source
tempData <- subset(NEI,fips=="24510" & type=="ON-ROAD")

## Preparing data for plot
p5data <- aggregate(Emissions ~ year, data=tempData, FUN=sum)

## Constructing and printing the plot using ggplot2
plot5 <- ggplot(p5data, aes(p5data$year,p5data$Emissions)) +
  geom_point()+
  geom_smooth(aes(group=1),method="loess") +
  ylab(expression("Amount of PM"[2.5]*" emitted [tons]")) +
  xlab("Years") +
  ggtitle(expression("Total Emissions of PM"[2.5]*" from motor vehicle sources in Baltimore City"))

print(plot5)

## Copying Plot 5 to PNG file
dev.copy(png, file="plot5.png")
dev.off()