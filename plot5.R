# Plot5
# Let's do this in ggplot

library(ggplot2)
library(reshape)

# Read the data into file objects

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

head(NEI)
head(SCC)

# Subset down to Baltimore City

subsetNEI <- NEI[NEI$fips == "24510", ]

# Subset down to Motor in Baltimore City

SCC_motor <- SCC[grep("Motor", SCC$Short.Name, ignore.case = TRUE), ]
NEI_motor <- merge(subsetNEI, SCC_motor, by="SCC")

# Build plot 5
png(filename="plot5.png", height=480, width=480, units = "px")
ggplot(NEI_motor, aes(year, Emissions)) +
  geom_line(stat = "summary", fun.y = "sum") +
  ylab("PM2.5 Emission") +
  xlab("Year") +
  ggtitle("Baltimore City Motor Emissions (1999-2008)")
dev.off()