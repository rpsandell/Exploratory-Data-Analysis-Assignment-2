## This first line will likely take a few seconds. Be patient!
setwd("/Users/rpsandell/Desktop/Programming and Statistics/EDA/Assignment2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# 1. Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

year1999 <- sum(NEI[which(NEI$year==1999), ]$Emissions)
year2002 <- sum(NEI[which(NEI$year==2002), ]$Emissions)
year2005 <- sum(NEI[which(NEI$year==2005), ]$Emissions)
year2008 <- sum(NEI[which(NEI$year==2008), ]$Emissions)

total.emissions <- data.frame(Emissions=c(year1999,year2002,year2005,year2008), year=c(1999,2002,2005,2008))

plot(Emissions ~ year, data=total.emissions)
