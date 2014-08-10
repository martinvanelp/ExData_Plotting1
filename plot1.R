library(data.table)

# import data
file <- "./household_power_consumption.txt"
data <- fread(file, sep = ";", header = TRUE, colClasses = "character")

set <- data[{data$Date == "1/2/2007" | data$Date == "2/2/2007"}]

set$Global_active_power <- as.numeric(set$Global_active_power)

png("plot1.png", width = 480, height = 480)

hist(set$Global_active_power, main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", col = "red")

dev.off()