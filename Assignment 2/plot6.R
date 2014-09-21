## Adding required libraries
library(ggplot2)

## Reading in the required data
NEI <- readRDS("./exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata_data_NEI_data/Source_Classification_Code.rds")

## Selecting only the data with required sources and from specified cities
tempData <- subset(NEI,(fips=="24510" | fips=="06037") & type=="ON-ROAD")

## Preparing data for plot
p6data <- aggregate(tempData$Emissions, list(year=tempData$year, city=tempData$fips), FUN=sum)

## Modifying prepared set in order to have descriptive labels
p6data$city <- as.factor(p6data$city)
levels(p6data$city) <- c("Los Angeles County","Baltimore City")

## Constructing and printing the plot using ggplot2
plot6 <- ggplot(p6data, aes(year,p6data$x, colour=city)) +
  geom_point()+
  geom_smooth(aes(group=1),method="loess")+
  facet_grid(. ~ city)+
  ylab(expression("Amount of PM"[2.5]*" emitted [tons]")) +
  xlab("Years") +
  ggtitle(expression("Comparison of PM"[2.5]*" emissions from motor vehicle sources between Los Angeles County and Baltimore City"))

print(plot6)

## Copying Plot 6 to PNG file
dev.copy(png, file="plot6.png")
dev.off()