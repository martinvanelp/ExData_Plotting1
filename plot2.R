Sys.setlocale("LC_TIME", "English")

# import data
file <- "./household_power_consumption.txt"
data <- read.table(file, sep = ";", header = TRUE, colClasses = "character")

set <- data[{data$Date == "1/2/2007" | data$Date == "2/2/2007"}, ]

set$DateTime <- strptime(paste(set$Date, set$Time), 
                     format = "%d/%m/%Y %H:%M:%S")

set$Global_active_power <- as.numeric(set$Global_active_power)

png("plot2.png", width = 480, height = 480)

plot(set$DateTime, set$Global_active_power, main = "",
     xlab = "", ylab = "Global Active Power (kilowatts)",
     type = "l", col = "black")

dev.off()