filename <- "household_power_consumption.txt"
data <- read.table(filename, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec=".")

data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$Time <- strptime(data$Time, format = "%H:%M:%S")

subdata <- subset(data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))

subdata$Global_active_power <- as.numeric(subdata$Global_active_power)
png("plot1.png", width=480, height=480)
hist(subdata$Global_active_power, breaks = 12, col="red", main ="Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()