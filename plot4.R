# This will download, unzip and read the data:
source("load_data.R")

png(filename="plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))

# subplot 1
plot(data$datetime, data$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power")

# subplot 2
with(data, plot(datetime, Voltage, type = "l"))

# subplot 3
plot(data$datetime, data$Sub_metering_1, col = "black",
     type = "l",
     xlab = "", ylab = "Energy sub metering")
lines(data$datetime, data$Sub_metering_2, col = "red")
lines(data$datetime, data$Sub_metering_3, col = "blue")
legend("topright", 19, lwd=1, col=c("black", "red", "blue"),
       bty="n", cex = 0.95,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# subplot 4
with(data, plot(datetime, Global_reactive_power, type = "l"))

dev.off()
