setwd("/Users/rpsandell/Desktop/Programming and Statistics/EDA/Assignment2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


# Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources 
# in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?

NEI.rows.cars <- grep("^22010|^22300|^220107|^223007", NEI$SCC) # SCC codes from http://www3.epa.gov/ttn/chief/net/2008neiv3/2008_neiv3_tsd_draft.pdf, page 113
NEI.cars <- NEI[NEI.rows.cars, ]
NEI.baltimoreAndLA.cars <- NEI.cars[which(NEI.cars$fips=="24510" | NEI.cars$fips=="06037"), ]


NEI.baltimoreAndLA.cars$fips <- gsub("24510", "Baltimore City", NEI.baltimoreAndLA.cars$fips)
NEI.baltimoreAndLA.cars$fips <- gsub("06037", "Los Angeles", NEI.baltimoreAndLA.cars$fips)

png(file="Plot6.png")
qplot(year, Emissions, data=NEI.baltimoreAndLA.cars, facets=.~fips, xlab="Emissions", ylab="Year", main="Fine Particulate Matter (PM2.5) Emissions from Motor Vehicles
      in Los Angeles and Baltimore City (1999–2008)")
dev.off()
