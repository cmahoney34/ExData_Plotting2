# Plot3
# Read the data into file objects

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

head(NEI)
head(SCC)

# Load ggplot2 Libary

library(ggplot2)

# Sum total Emissions by year for Baltimore City

subsetNEI <- NEI[NEI$fips == "24510", ]

# Build Plot3
png(filename="plot3.png", height=480, width=480, units = "px")
ggplot(subsetNEI, aes(year, Emissions, color = type)) +
  geom_line(stat = "summary", fun.y = "sum") +
  ylab("PM2.5 Emission") +
  ggtitle("Baltimore City Emissions by Type (1999-2008)")
dev.off()
  