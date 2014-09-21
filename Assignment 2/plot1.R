## Reading in the required data
NEI <- readRDS("./exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata_data_NEI_data/Source_Classification_Code.rds")

## Setting up "year" column as factor
NEI$year <- as.factor(NEI$year)

## Getting required information for plot construction
p1data <- aggregate(Emissions ~ year, data=NEI, FUN=sum)

## Constructing the plot using BASE system
barplot(p1data$Emissions,names.arg=p1data$year,
        col=p1data$year,
        space=0.05,
        ylim=c(0,1.1*max(p1data$Emissions)),
        main=expression("Total emissions of PM"[2.5]*" per year"),
        ylab=expression("Amount of PM"[2.5]*" emitted [tons]"),
        xlab="Year",
        )

## Copying Plot 1 to PNG file
dev.copy(png, file="plot1.png")
dev.off()
