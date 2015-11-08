## read txt file from the data directory
## while specifying the types of the columns
powerData <- read.table(file ="./data/household_power_consumption.txt", header=TRUE,sep=";",na.strings="?") 

## subset only the data from the dates 2007-02-01 and 2007-02-02
powerDataUse <- powerData[powerData$Date %in% c("1/2/2007","2/2/2007") ,]
## convert the Data and Time columns to Date and Time formats
powerDataUse$DateTime <- strptime(paste(powerDataUse$Date, powerDataUse$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

## create plot and print to png file
png(file="plot2.png",width=400,height=350,res=72)
plot(powerDataUse$DateTime, powerDataUse$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()
