subSCC<-subset(SCC, subset=Data.Category=="Onroad",
               select=c("SCC", "Data.Category"))

newNEI<-merge(NEI, subSCC, by="SCC")

NEI3<-subset(newNEI, fips=="24510")

plot(aggregate(Emissions~year, NEI3, sum), main=
       "Motor Vehicle Emissions, Baltimore City, MA",
     xlab="Year", ylab="PM2.5 Emissions (tons)")