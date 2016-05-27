png(file="~/coursera/plot2.png", width=480, height=480)

baltimoreNEI<-subset(NEI, fips=="24510")

plot(aggregate(Emissions~year, baltimoreNEI, sum), 
     main="Total PM2.5 Emissions, Baltimore City, MA",
     xlab="Year", ylab="Total Emissions (tons)")

dev.off()
