#Exploratory Data Analysis Project 2, question 6

#check to see if directory exists, if not create it.  Then download 
#and unzip project data files to that directory
setwd("~/coursera")
if(!file.exists("data")){dir.create("data")}
fileURL<-"https://d396qusza40orc.cloudfront.net/
exdata%2Fdata%2FNEI_data.zip"
download.file(fileURL, "./data/data.zip", method="curl")
unzip("./data/data.zip", exdir="./data")

#open png device for creation of png file for this plot 
#and save to working directory

png(file="./plot6.png", width=480, height=480)
#read data from source file to be used for
#creation of plot into two variables as described in project outline
#and prepare environment

NEI<-readRDS("./data/summarySCC_PM25.rds")
SCC<-readRDS("./data/Source_Classification_Code.rds")

library(ggplot2)
#create subset variables specific to question and plot
autosSCC<-subset(SCC, subset=Data.Category=="Onroad",
                 select=c("SCC", "Data.Category"))

autosNEI<-merge(NEI, autosSCC, by="SCC")

citiesNEI<-subset(autosNEI, subset=
                    (fips=="06037" | fips=="24510"))


plot<-qplot(year, Emissions, data=citiesNEI, facets=
              .~fips, col=fips, main=
              "Two City Motor Vehicle Emissions Comparison", 
            xlab="Year",ylab="Emissions(tons)" )

plot+stat_smooth(method="loess") + theme(legend.position="none")

names<-c("06037"="Los Angeles", "24510"="Baltimore")
plot + facet_grid(facets=.~fips, labeller=as_labeller(names))
#turn off png device to print plot to file
dev.off()
