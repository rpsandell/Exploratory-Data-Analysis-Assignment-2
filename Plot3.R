setwd("/Users/rpsandell/Desktop/Programming and Statistics/EDA/Assignment2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
# Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.


NEI.baltimore <- NEI[which(NEI$fips=="24510"), ]

library(ggplot2)

png(file="Plot3.png")
qplot(year, Emissions, data=NEI.baltimore, facets=.~type, xlab="Emissions", ylab="Year", main="Fine Particulate Matter (PM2.5) Emissions by Type
      in Baltimore City (1999–2008)")
dev.off()

