png(file="~/coursera/plot2.png", width=480, height=480)

autosSCC<-subset(SCC, subset=Data.Category=="Onroad",
               select=c("SCC", "Data.Category"))

autosNEI<-merge(NEI, subSCC, by="SCC")

balautoNEI<-subset(autosNEI, fips=="24510")

plot(aggregate(Emissions~year, balautoNEI, sum), main=
       "Motor Vehicle Emissions, Baltimore City, MA",
     xlab="Year", ylab="PM2.5 Emissions (tons)")

dev.off()
