NEI2<-subset(NEI, fips=="24510")

plot(aggregate(Emissions~year, NEI2, sum), 
     main="Total PM2.5 Emissions, Baltimore City, MA",
     xlab="Year", ylab="Total Emissions (tons)")