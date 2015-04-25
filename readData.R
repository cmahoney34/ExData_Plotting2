# This script reads in the data for the project
# and separates them into two objects

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

head(NEI)
head(SCC)

dim(NEI)
dim(SCC)