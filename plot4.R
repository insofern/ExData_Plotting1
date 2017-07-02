filename <- "household_power_consumption.txt"
data <- read.table(filename, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec=".")

data$Date <- as.Date(data$Date, "%d/%m/%Y")

subdata <- subset(data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))

weekdaydatetime <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%Y-%m-%d %H:%M:%S") 

subdata$Sub_metering_1 = as.numeric(subdata$Sub_metering_1)
subdata$Sub_metering_2 = as.numeric(subdata$Sub_metering_2)
subdata$Sub_metering_3 = as.numeric(subdata$Sub_metering_3)

subdata$Global_active_power = as.numeric(subdata$Global_active_power)

subdata$Voltage = as.numeric(subdata$Voltage)

subdata$Global_reactive_power = as.numeric(subdata$Global_reactive_power)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(weekdaydatetime, subdata$Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(weekdaydatetime, subdata$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(weekdaydatetime, subdata$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(weekdaydatetime, subdata$Sub_metering_2, type="l", col="red")
lines(weekdaydatetime, subdata$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="n")

plot(weekdaydatetime, subdata$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()