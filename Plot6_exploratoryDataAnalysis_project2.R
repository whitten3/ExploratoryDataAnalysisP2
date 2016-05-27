library(ggplot2)

png(file="~/coursera/plot2.png", width=480, height=480)

autosSCC<-subset(SCC, subset=Data.Category=="Onroad",
                 select=c("SCC", "Data.Category"))

autosNEI<-merge(NEI, autosSCC, by="SCC")

citiesNEI<-subset(autosNEI, subset=
                    (fips=="06037" | fips=="24510"))


plot<-qplot(year, Emissions, data=citiesNEI, facets=
              .~fips, col=fips, main=
              "Motor Vehicle Emissions Comparison", xlab="Year",
              ylab="Emissions(tons)" )

plot+stat_smooth(method="loess")

dev.off()