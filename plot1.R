# Plot1
# Read the data into file objects

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

head(NEI)
head(SCC)

# Sum total Emissions by year

emissionsTotal <- aggregate(NEI$Emissions, by=list(NEI$year), FUN = "sum")

# Build Plot1
png(filename="plot1.png", height=480, width=480, units = "px")
plot(emissionsTotal, type = "l", xlab = "Year", 
     main = "PM2.5 Emissions From All Sources (1999-2008)",
     ylab = "PM2.5 Emissions")
dev.off()