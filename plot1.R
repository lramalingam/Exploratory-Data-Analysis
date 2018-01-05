filename <- "datafile.zip"
path <- getwd()
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

download.file(url,file.path(path,filename))
unzip(zipfile = filename)

dataFile <- "household_power_consumption.txt" 
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") 
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,] 

#str(subSetData) 
globalActivePower <- as.numeric(subSetData$Global_active_power) 
png("plot1.png", width=480, height=480) 
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab = "Frequency") 
graphics.off() 
