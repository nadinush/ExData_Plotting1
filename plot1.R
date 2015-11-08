## read txt file from the data directory
## while specifying the types of the columns
powerData <- read.table(file ="./data/household_power_consumption.txt", header=TRUE,sep=";",na.strings="?",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")) 

## convert the Data and Time columns to Date and Time formats
powerData$Date <- as.Date(powerData$Date,"%d/%m/%Y")
powerData$Time <- strptime(powerData$Time, "%H:%M:%S")

## subset only the data from the dates 2007-02-01 and 2007-02-02
powerDataUse <- subset(powerData, Date >= "2007-02-01" & Date <= "2007-02-02")

## create plot and print to png file
png(file="plot1.png",width=400,height=350,res=72)
hist(powerDataUse$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
