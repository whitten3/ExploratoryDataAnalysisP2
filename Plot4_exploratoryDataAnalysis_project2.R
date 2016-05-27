png(file="~/coursera/plot2.png", width=480, height=480)

coalSCC<-SCC[grep("Coal", SCC$EI.Sector),]

coalNEI<-merge(NEI, coalSCC, by="SCC")

plot(aggregate(Emissions~year, coalNEI, sum), main=
         "Emissions From Coal Combustion in The US", 
       xlab="Year", ylab="PM2.5 Emissions (tons)")

dev.off()
