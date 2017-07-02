filename <- "household_power_consumption.txt"
data <- read.table(filename, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec=".")

data$Date <- as.Date(data$Date, "%d/%m/%Y")

subdata <- subset(data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))

weekdaydatetime <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%Y-%m-%d %H:%M:%S") 

subdata$Global_active_power <- as.numeric(subdata$Global_active_power)
png("plot2.png", width=480, height=480)
plot(weekdaydatetime, subdata$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)", main = "")
dev.off()