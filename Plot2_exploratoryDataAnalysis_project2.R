#Exploratory Data Analysis Project 2, question 2

#check to see if directory exists, if not create it.  Then download 
#and unzip project data files to that directory
setwd("~/coursera")
if(!file.exists("data")){dir.create("data")}
fileURL<-"https://d396qusza40orc.cloudfront.net/
exdata%2Fdata%2FNEI_data.zip"
download.file(fileURL, "./data/data.zip", method="curl")
unzip("./data/data.zip", exdir="./data")
#open png device for creation of png file for plot and save to wd
png(file="~/coursera/plot2.png", width=480, height=480)
#read data from source file to be used for
#creation of plot into two variables as described in project outline
NEI<-readRDS("./data/summarySCC_PM25.rds")
SCC<-readRDS("./data/Source_Classification_Code.rds")

#create subset data specific to question into a new variable and plot
baltimoreNEI<-subset(NEI, fips=="24510")

plot(aggregate(Emissions~year, baltimoreNEI, sum), 
     main="Total PM2.5 Emissions, Baltimore City, MA",
     xlab="Year", ylab="Total Emissions (tons)")

#turn off png device to print plot to file
dev.off()
