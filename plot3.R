# load the file, convert the date and time to a real date/time 
# object, and subset away all but Feb 1st and 2nd, 2007
power <- read.csv("household_power_consumption.txt", sep=";", na.strings="?",
                  colClasses=c("character", "character", rep("numeric", 6)))
power$dt = strptime(paste(power$Date, power$Time), format="%d/%m/%Y %H:%M:%S")
p <- subset(power, Date=="1/2/2007" | Date=="2/2/2007")

# plot of the three sub metering variables vs time
png("plot3.png", height=480, width=480)
plot(p$dt, p$Sub_metering_1, ylab="Energy sub metering", xlab="", type="n")
lines(p$dt, p$Sub_metering_1, col="black")
lines(p$dt, p$Sub_metering_2, col="red")
lines(p$dt, p$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lwd=1)
dev.off()

