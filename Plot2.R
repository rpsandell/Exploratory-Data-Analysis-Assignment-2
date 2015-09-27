setwd("/Users/rpsandell/Desktop/Programming and Statistics/EDA/Assignment2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
# Use the base plotting system to make a plot answering this question.

#NB: years seem to be coded as integers, not factors. fips is coded as a factor.
year1999.baltimore <- sum(NEI[which(NEI$year==1999 & NEI$fips=="24510"), ]$Emissions)
year2002.baltimore <- sum(NEI[which(NEI$year==2002 & NEI$fips=="24510"), ]$Emissions)
year2005.baltimore <- sum(NEI[which(NEI$year==2005 & NEI$fips=="24510"), ]$Emissions)
year2008.baltimore <- sum(NEI[which(NEI$year==2008 & NEI$fips=="24510"), ]$Emissions)

# Compile the summed emissions values with paired year values into a dataframe
total.emissions.baltimore <- data.frame(Emissions=c(year1999.baltimore,year2002.baltimore,year2005.baltimore,year2008.baltimore), year=c(1999,2002,2005,2008))

png(file="Plot2.png")
plot(Emissions ~ year, data=total.emissions.baltimore, ylab="Total Emissions (All Sources)", xlab="Year", main="Fine Particulate Matter (PM2.5) Emissions in 
     Baltimore City, Maryland (1999–2008)")
dev.off()
