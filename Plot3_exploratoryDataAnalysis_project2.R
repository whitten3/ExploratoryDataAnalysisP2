library(ggplot2)

NEI2<-subset(NEI, fips=="24510")


 plot<-qplot(year, Emissions, data=NEI2, facets=.~type, col=type)
 plot+stat_smooth(method="lm")