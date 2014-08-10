Sys.setlocale("LC_TIME", "English")

# import data
file <- "./household_power_consumption.txt"
data <- read.table(file, sep = ";", header = TRUE, colClasses = "character")

set <- data[{data$Date == "1/2/2007" | data$Date == "2/2/2007"}, ]

set$DateTime <- strptime(paste(set$Date, set$Time), 
                     format = "%d/%m/%Y %H:%M:%S")

set$Global_active_power <- as.numeric(set$Global_active_power)
set$Global_reactive_power <- as.numeric(set$Global_reactive_power)
set$Sub_metering_1 <- as.numeric(set$Sub_metering_1)
set$Sub_metering_2 <- as.numeric(set$Sub_metering_2)
set$Sub_metering_3 <- as.numeric(set$Sub_metering_3)
set$Voltage <- as.numeric(set$Voltage)

png("plot4.png", width = 480, height = 480)

par(mfrow = c(2, 2))

#1
plot(set$DateTime, set$Global_active_power, main = "",
     xlab = "", ylab = "Global Active Power (kilowatts)",
     type = "l", col = "black")

#2
plot(set$DateTime, set$Voltage, main = "",
     xlab = "datetime", ylab = "Voltage",
     type = "l", col = "black")

#3
plot(set$DateTime, set$Sub_metering_1, main = "",
     xlab = "", ylab = "Energy sub metering", type = "n")

lines(set$DateTime, set$Sub_metering_1, col = "black")
lines(set$DateTime, set$Sub_metering_2, col = "red")
lines(set$DateTime, set$Sub_metering_3, col = "blue")

legend("topright", lty = 1, bty = "n", col = c("black", "blue", "red"),
legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#4
plot(set$DateTime, set$Global_reactive_power, main = "",
     xlab = "datetime", ylab = "Global_reactive_power",
     type = "l", col = "black")

dev.off()