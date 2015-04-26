# plot4
# Across the United States, how have emissions from coal combustion-related sources
# changed from 1999–2008?

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
# memory conservation: only keep the columns we are interested in.
head(NEI)
NEI2 <- NEI[,c(2,4,6)]
rm(NEI)
str(SCC)
SCC <- SCC[,c(1,3)]

#str(SCC)
#levels(SCC[grepl("coal", SCC$SCC.Level.Three, ignore.case=TRUE), c(9)])
#SCC[grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE), c(10)]
#str(SCC[grepl("coal", SCC$Short.Name, ignore.case=TRUE),])

coal_combustion <-  SCC[grepl("coal", SCC$Short.Name, ignore.case=TRUE)
    & (grepl("comb", SCC$Short.Name, ignore.case=TRUE
    | grepl("fire", SCC$Short.Name, ignore.case=TRUE
    | grepl("burn", SCC$Short.Name, ignore.case=TRUE)))),]

head(coal_combustion)
rm(SCC) # memory conservation.

# put in NEI only the observations that involve coal combustion
NEI <- NEI2[NEI2$SCC %in% coal_combustion$SCC,]
# memory release
rm(NEI2)
mergedData <- merge(NEI, coal_combustion, by.x="SCC", by.y="SCC", all.x=TRUE, all.y=FALSE)
#head(mergedData)

mergedAggregated <- aggregate(Emissions ~ year, mergedData, sum)
str(mergedAggregated)

library(ggplot2)

png(filename="plot4.png", width=640, height=480)
qplot(year, Emissions, data = mergedAggregated, geom = c("point", "smooth"),
     main="Emissions")
dev.off()

# Answer:
# The coal combustion source-related emissions were approximately unchanged from 1999 to 2005
# then they show a significant decline (~62%) in 2008.

