# Plot2
# Read the data into file objects

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

head(NEI)
head(SCC)

# Sum total Emissions by year for Baltimore City

subsetNEI <- NEI[NEI$fips == "24510", ]

emissionsTotal_Balt <- aggregate(subsetNEI$Emissions, by=list(subsetNEI$year), FUN = "sum")

# Build Plot2
png(filename="plot2.png", height=480, width=480, units = "px")
plot(emissionsTotal_Balt, type = "l", xlab = "Year", 
     main = "Baltimore City PM2.5 Emissions (1999-2008)",
     ylab = "PM2.5 Emission", col = "purple")
dev.off()