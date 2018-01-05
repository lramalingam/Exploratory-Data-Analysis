filename <- "datafile.zip"
path <- getwd()
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

download.file(url,file.path(path,filename))
unzip(zipfile = filename)

dataFile <- "household_power_consumption.txt" 
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") 
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,] 

#str(subSetData) 
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(subSetData$Global_active_power) 
sub_metering_1 <- as.numeric(subSetData$Sub_metering_1)
sub_metering_2 <- as.numeric(subSetData$Sub_metering_2)
sub_metering_3 <- as.numeric(subSetData$Sub_metering_3)


png("plot3.png", width=480, height=480) 
plot(datetime,sub_metering_1, type = "l", xlab="", ylab = "Energy Submetering") 
lines(datetime, sub_metering_2, type = "l", col = "red")
lines(datetime, sub_metering_3, type = "l", col = "blue")
legend("topright", c("sub_metering_1","sub_metering_2", "sub_metering_3"), lty = 1, lwd = 2, col= c("black","red","blue"))
graphics.off() 