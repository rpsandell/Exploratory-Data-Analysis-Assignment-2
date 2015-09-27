setwd("/Users/rpsandell/Desktop/Programming and Statistics/EDA/Assignment2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
# Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.



NEI.rows.cars <- grep("^22010|^22300|^220107|^223007", NEI$SCC) # SCC codes from http://www3.epa.gov/ttn/chief/net/2008neiv3/2008_neiv3_tsd_draft.pdf, page 113
NEI.cars <- NEI[NEI.rows.cars, ]
NEI.baltimore.cars <- NEI.cars[which(NEI.cars$fips=="24510"), ]

library(ggplot2)

png(file="Plot5.png")
qplot(year, Emissions, data=NEI.baltimore.cars, facets=.~type, xlab="Emissions", ylab="Year", main="Fine Particulate Matter (PM2.5) Emissions from Motor Vehicles
      in Baltimore City (1999–2008)")
dev.off()
