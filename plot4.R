# Plot4
# Let's do this in ggplot

library(ggplot2)
library(reshape)

# Read the data into file objects

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

head(NEI)
head(SCC)

# Testing column to identify coal

unique(SCC$Short.Name)

# Limit dataset down to coal based on Short.Name column

SCC_coal <- SCC[grep("Coal", SCC$Short.Name, ignore.case = TRUE), ]
NEI_coal <- merge(NEI, SCC_coal, by="SCC")

# Build plot 4
png(filename="plot4.png", height=480, width=480, units = "px")
ggplot(NEI_coal, aes(year, Emissions)) +
  geom_line(stat = "summary", fun.y = "sum") +
  ylab("PM2.5 Emission") +
  xlab("Year") +
  ggtitle("Total Coal-Combustion Emissions (1999-2008)")
dev.off()
  