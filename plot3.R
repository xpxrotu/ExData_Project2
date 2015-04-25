# plot3
# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad)
# variable, which of these four sources have seen decreases in emissions from 1999–2008
# for Baltimore City? Which have seen increases in emissions from 1999–2008? Use the
# ggplot2 plotting system to make a plot answer this question.

NEI <- readRDS("summarySCC_PM25.rds")
# SCC <- readRDS("Source_Classification_Code.rds")

NEIBaltimoreCity <- NEI[NEI$fips == "24510",]
# str(NEIBaltimoreCity)
NEIAggregated <- aggregate(Emissions ~ year + type, NEIBaltimoreCity, sum)
# str(NEIAggregated)

library(ggplot2)

png(filename="plot3.png", width=640, height=480)
qplot(year, Emissions, data = NEIAggregated, color=type, geom = c("point", "smooth"),
     main="Baltimore City total emissions by year and type.")
dev.off()

# Answer:
# The Nonpoint, Non-Road and On-Road types show clear decreases.
# The Point type shows a slight increase of 2008 levels vs. 1999 levels,
# but with a big hill in 2005.


