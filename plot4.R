# load the file, convert the date and time to a real date/time 
# object, and subset away all but Feb 1st and 2nd, 2007
power <- read.csv("household_power_consumption.txt", sep=";", na.strings="?",
                  colClasses=c("character", "character", rep("numeric", 6)))
power$dt = strptime(paste(power$Date, power$Time), format="%d/%m/%Y %H:%M:%S")
p <- subset(power, Date=="1/2/2007" | Date=="2/2/2007")


png("plot4.png", height=480, width=480)
par(mfcol=c(2, 2))

# upper left plot: line plot of global active power vs time
plot(p$dt, p$Global_active_power, ylab="Global Active Power", xlab="", type="n")
lines(p$dt, p$Global_active_power)

# lower left plot: line plot of the three sub metering variables vs time
plot(p$dt, p$Sub_metering_1, ylab="Energy sub metering", xlab="", type="n")
lines(p$dt, p$Sub_metering_1, col="black")
lines(p$dt, p$Sub_metering_2, col="red")
lines(p$dt, p$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lwd=1, bty="n")

# upper right plot: line plot of voltage vs time
plot(p$dt, p$Voltage, ylab="Voltage", xlab="datetime", type='n')
lines(p$dt, p$Voltage, col="black")

# lower left plot: line plot of global reactive power vs time
plot(p$dt, p$Global_reactive_power, ylab="Global_reactive_power", xlab="datetime", type="n")
lines(p$dt, p$Global_reactive_power, col="black")

dev.off()

