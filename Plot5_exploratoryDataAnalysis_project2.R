#Exploratory Data Analysis Project 2, question 5

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

png(file="~/coursera/plot2.png", width=480, height=480)

#create subset variables specific to question
autosSCC<-subset(SCC, subset=Data.Category=="Onroad",
               select=c("SCC", "Data.Category"))

autosNEI<-merge(NEI, autosSCC, by="SCC")

balautoNEI<-subset(autosNEI, fips=="24510")

plot(aggregate(Emissions~year, balautoNEI, sum), main=
       "Motor Vehicle Emissions, Baltimore, MA",
     xlab="Year", ylab="PM2.5 Emissions (tons)")

#turn off png device to print plot to file
dev.off()
