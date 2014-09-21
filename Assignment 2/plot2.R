## Reading in the required data
NEI <- readRDS("./exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata_data_NEI_data/Source_Classification_Code.rds")

## Setting up "year" column as factor
NEI$year <- as.factor(NEI$year)

## Subsetting required data
tempData <- subset(NEI,fips=="24510")

## Getting required information for plot construction
p2data <- aggregate(Emissions ~ year, data=tempData, FUN=sum)

## Constructing the plot using BASE system
barplot(p2data$Emissions,names.arg=p2data$year,
        col=p2data$year,
        space=0.05,
        ylim=c(0,1.1*max(p2data$Emissions)),
        main=expression("Total emissions of PM"[2.5]*" per year for Baltimore City"),
        ylab=expression("Amount of PM"[2.5]*" emitted [tons]"),
        xlab="Year",
)

## Adding regression line to depict general trend
rline <- lm(p2data$Emissions~p2data$year,p2data)
abline(rline,col="orange",lwd=3)

## Copying Plot 2 to PNG file
dev.copy(png, file="plot2.png")
dev.off()