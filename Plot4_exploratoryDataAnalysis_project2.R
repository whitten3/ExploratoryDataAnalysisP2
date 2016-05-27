coalSCC<-SCC[grep("Coal", SCC$EI.Sector),]

coalNEI<-merge(NEI, coalSCC, by="SCC")

plot(aggregate(Emissions~year, coalNEI, sum), main=
         "Emissions From Coal Combustion in The US", 
       xlab="Year", ylab="PM2.5 Emissions (tons)")