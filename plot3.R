## read txt file from the data directory
## while specifying the types of the columns
powerData <- read.table(file ="./data/household_power_consumption.txt", header=TRUE,sep=";",na.strings="?") 

## subset only the data from the dates 2007-02-01 and 2007-02-02
powerDataUse <- powerData[powerData$Date %in% c("1/2/2007","2/2/2007") ,]
## convert the Data and Time columns to Date and Time formats
powerDataUse$DateTime <- strptime(paste(powerDataUse$Date, powerDataUse$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

## create plot and print to png file
png(file="plot3.png",width=400,height=350,res=72)
plot(powerDataUse$DateTime, powerDataUse$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(powerDataUse$DateTime,powerDataUse$Sub_metering_2,type="l",col="red")
lines(powerDataUse$DateTime,powerDataUse$Sub_metering_3,type="l",col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
