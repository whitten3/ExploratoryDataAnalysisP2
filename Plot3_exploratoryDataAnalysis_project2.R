
library(ggplot2)

png(file="~/coursera/plot2.png", width=480, height=480)

baltimoreNEI<-subset(NEI, fips=="24510")


plot<-qplot(year, Emissions, data=baltimoreNEI, facets=
                .~type, col=type, main="Emissions by Category, 
              Baltimore City, MA", xlab="Year", ylab="Emissions
              (tons)")
 
 
 plot+stat_smooth(method="lm")
 
 dev.off()
