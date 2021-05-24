rawdata <- read.table(file = "C:/Users/Shuai/Desktop/Jasmine R study/household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")


data1 <- rawdata[rawdata$Date %in% c("1/2/2007","2/2/2007"),]

data1 <- data1[complete.cases(data1),]

GlobalactivePower <- as.numeric(data1$Global_active_power)
GlobalreactivePower <- as.numeric(data1$Global_reactive_power)
voltage <- as.numeric(data1$Voltage)
Submetering1 <- as.numeric(data1$Sub_metering_1)
Submetering2 <- as.numeric(data1$Sub_metering_2)
Submetering3 <- as.numeric(data1$Sub_metering_3)
                              

#plot1

hist(GlobalactivePower, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")

#plot2
datetime <- strptime(paste(data1$Date, data1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
plot(datetime, GlobalactivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#plot3
plot(datetime, Submetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, Submetering2, type="l", col="red")
lines(datetime, Submetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

#plot4

par(mfrow = c(2, 2)) 
# 1stplot
plot(datetime, GlobalactivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
# 2n plot
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
# 3rd plot
plot(datetime, Submetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, Submetering2, type="l", col="red")
lines(datetime, Submetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
# 4th plot
plot(datetime, GlobalreactivePower, type="l", xlab="datetime", ylab="Global_reactive_power", cex=0.2)
