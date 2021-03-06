# load the file, convert the date and time to a real date/time 
# object, and subset away all but Feb 1st and 2nd, 2007
power <- read.csv("household_power_consumption.txt", sep=";", na.strings="?",
                  colClasses=c("character", "character", rep("numeric", 6)))
power$dt = strptime(paste(power$Date, power$Time), format="%d/%m/%Y %H:%M:%S")
p <- subset(power, Date=="1/2/2007" | Date=="2/2/2007")

# create a simple histogram of the global active power
png("plot1.png", height=480, width=480)
hist(p$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
