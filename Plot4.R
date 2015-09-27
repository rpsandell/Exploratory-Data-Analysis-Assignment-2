setwd("/Users/rpsandell/Desktop/Programming and Statistics/EDA/Assignment2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


# Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

scc.rows.coal <- grep("Coal", SCC$EI.Sector) # Cf. http://www3.epa.gov/ttn/chief/net/2008neiv3/2008_neiv3_tsd_draft.pdf pg. 81; visual inspection of the SCC datafram
      # indicates that instances of "Coal" in the EI.Sector column should obtain coal data; see also the Sector names on pages 10 and 19
scc.coal.codes <- SCC[scc.rows.coal, ]$SCC
us.coal.emissions <- NEI[which(NEI$SCC %in% scc.coal.codes), ] # may take a few seconds to run

library(ggplot2)

png(file="Plot4.png")
qplot(year, Emissions, data=us.coal.emissions, xlab="Emissions", ylab="Year", main="Fine Particulate Matter (PM2.5) Emissions from Coal
      in the United States (1999–2008)")
dev.off()
