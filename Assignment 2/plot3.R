## Adding required libraries
library(ggplot2)

## Reading in the required data
NEI <- readRDS("./exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata_data_NEI_data/Source_Classification_Code.rds")

## Subsetting required data
tempData <- subset(NEI,fips=="24510")

## Acquiring data for plot
p3data <- aggregate(tempData$Emissions, list(year=tempData$year, type=tempData$type), FUN=sum)

## Constructing and printing the plot using ggplot2
plot3 <- ggplot(p3data, aes(year,p3data$x, colour=type)) +
  geom_point()+
  geom_smooth(aes(group=1),method="loess")+
  facet_grid(. ~ type)+
  ylab(expression("Amount of PM"[2.5]*" emitted [tons]")) +
  xlab("Years") +
  ggtitle(expression("Total Emissions of PM"[2.5]*" in Baltimore City by type"))

print(plot3)

## Copying Plot 3 to PNG file
dev.copy(png, file="plot3.png")
dev.off()
