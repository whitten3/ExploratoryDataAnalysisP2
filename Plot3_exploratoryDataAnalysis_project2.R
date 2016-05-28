#Exploratory Data Analysis Project 2, question 3

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
png(file="./plot2.png", width=480, height=480)

#read data from source file to be used for
#creation of plot into two variables as described in project outline
#and prepare environment
library(ggplot2)

NEI<-readRDS("./data/summarySCC_PM25.rds")
SCC<-readRDS("./data/Source_Classification_Code.rds")

#create subset variable specific to question and plot
baltimoreNEI<-subset(NEI, fips=="2451

plot<-qplot(year, Emissions, data=baltimoreNEI, facets=
                .~type, col=type, main="Emissions by Category, 
              Baltimore City, MA", xlab="Year", ylab="Emissions
              (tons)")
 
 
 plot+stat_smooth(method="loess")
 
 #turn off png device to print plot to file
 dev.off()
