# plot1
# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?
# Using the base plotting system, make a plot showing the total PM2.5 emission from
# all sources for each of the years 1999, 2002, 2005, and 2008.

NEI <- readRDS("summarySCC_PM25.rds")
# SCC <- readRDS("Source_Classification_Code.rds")

# head(NEI)
NEIAggregated <- aggregate(Emissions ~ year, NEI, sum)
# str(NEIAggregated)

png(filename="plot1.png", width=480, height=480)
plot(NEIAggregated$year, NEIAggregated$Emissions, pch=19,
     ylab="Total Emissions", xlab="Year", type="b",
     main="Total PM2.5 emissions by year", col="blue")
dev.off()

# Answer: the total emissions from PM2.5 have decreased.
