filename <- "household_power_consumption.txt"
data <- read.table(filename, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec=".")

data$Date <- as.Date(data$Date, "%d/%m/%Y")

subdata <- subset(data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))

weekdaydatetime <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%Y-%m-%d %H:%M:%S") 

subdata$Sub_metering_1 = as.numeric(subdata$Sub_metering_1)
subdata$Sub_metering_2 = as.numeric(subdata$Sub_metering_2)
subdata$Sub_metering_3 = as.numeric(subdata$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(weekdaydatetime, subdata$Sub_metering_1, col = "black", type = "l", xlab = "", ylab = "Energy sub metering", main = "")
lines(weekdaydatetime, subdata$Sub_metering_2, col="red")
lines(weekdaydatetime, subdata$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()