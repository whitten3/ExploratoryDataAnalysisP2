#Exploratory Data Analysis Project 2, question 1

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
#read data from source file into variables as described
#in project directions and produce plot

NEI<-readRDS("./data/summarySCC_PM25.rds")
SCC<-readRDS("./data/Source_Classification_Code.rds")

plot(aggregate(Emissions~year, NEI, sum), type="p",
     main="Total PM2.5 Emissions in the US", xlab="Year", 
     ylab="Total Emissions (tons)")

#turn off png device to print and save file
dev.off()
