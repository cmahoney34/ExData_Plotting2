# Plot6
# Let's do this in ggplot

library(ggplot2)
library(reshape)

# Read the data into file objects

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

head(NEI)
head(SCC)

# Subset down to Baltimore City

subsetNEI <- subset(NEI, NEI$fips %in% c("24510", "06037"), drop = TRUE)

# Subset down to Motor in Baltimore City

SCC_motor <- SCC[grep("Motor", SCC$Short.Name, ignore.case = TRUE), ]
NEI_motor <- merge(subsetNEI, SCC_motor, by="SCC")

# Build plot 5
png(filename="plot6.png", height=480, width=480, units = "px")
ggplot(NEI_motor, aes(year, Emissions, col=fips)) +
  geom_line(stat = "summary", fun.y = "sum") +
  ylab("PM2.5 Emission") +
  xlab("Year") +
  ggtitle("Motor Emissions Comparison\n Baltimore City and Los Angeles (1999-2008)") +
  scale_colour_discrete(name = "Group", label = c("Los Angeles","Baltimore"))
dev.off()