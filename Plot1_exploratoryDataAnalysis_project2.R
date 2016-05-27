
png(file="~/coursera/plot2.png", width=480, height=480)

plot(aggregate(Emissions~year, NEI, sum), 
     main="Total PM2.5 Emissions in the US", xlab="Year", 
     ylab="Total Emissions (tons)")

dev.off()
