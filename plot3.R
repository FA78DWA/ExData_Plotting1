## Read the dataset
library(sqldf)
power <- read.csv.sql("household_power_consumption.txt",
                      sql = "select * from file where Date == '1/2/2007' OR
                      Date == '2/2/2007' ", header = TRUE, sep = ";")

plot(power$Sub_metering_1, type = "l",xlab = "", xaxt = "n", ylab = "Energy sub metering")
lines(power$Sub_metering_2, type = "l", col = "red")
lines(power$Sub_metering_3, type = "l", col = "blue")

## add legend
leg.txt <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
leg.col <- c("black", "red", "blue")
legend("topright", legend = leg.txt, col = leg.col, lty = 1, cex = 1, 
       y.intersp = 0.5)

## add x-axis label
axis(1, at = seq(0,nrow(power), length.out = 3), labels = c("Thru","Fri","Sat"))

## save into png
dev.copy(png, "plot3.png")
dev.off()
