# This will download, unzip and read the data:
source("load_data.R")

png(filename="plot3.png", width = 480, height = 480)

plot(data$datetime, data$Sub_metering_1, col = "black",
     type = "l",
     xlab = "", ylab = "Energy sub metering")

lines(data$datetime, data$Sub_metering_2, col = "red")

lines(data$datetime, data$Sub_metering_3, col = "blue")

legend("topright", 19, lwd=1, cex = 0.975, col=c("black", "red", "blue"),
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
