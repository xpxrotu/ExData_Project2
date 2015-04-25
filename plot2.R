# plot2
# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland
# (fips == "24510") from 1999 to 2008? Use the base plotting system to make a
# plot answering this question.

NEI <- readRDS("summarySCC_PM25.rds")
# SCC <- readRDS("Source_Classification_Code.rds")

NEIBaltimoreCity <- NEI[NEI$fips == "24510",]
# str(NEIBaltimoreCity)
NEIAggregated <- aggregate(Emissions ~ year, NEIBaltimoreCity, sum)
# str(NEIAggregated)

png(filename="plot2.png", width=480, height=480)
plot(NEIAggregated$year, NEIAggregated$Emissions, pch=19,
     ylab="Total Emissions", xlab="Year", type="b",
     main="Total PM2.5 emissions by year in Baltimore City", col="blue")
dev.off()

levels(as.factor(NEIBaltimoreCity$year))

# Answer: We have data only for 4 years, 1999-2002 have deccreased,
# then an increase in 2005, then a significant decrease in 2008


