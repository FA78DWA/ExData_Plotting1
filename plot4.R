## Read the dataset
library(sqldf)
power <- read.csv.sql("household_power_consumption.txt",
                      sql = "select * from file where Date == '1/2/2007'OR Date == '2/2/2007' ",
                      header = TRUE, sep = ";")

## Global parameters
par(mfrow = c(2,2), mar = c(4,4,1,2), oma = c(0, 0, 2, 0))

## legend
leg.txt <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
leg.col <- c("black", "red", "blue")

with(power, {
        #### plot1
        plot(Global_active_power, type = "l", xaxt="n", xlab = "",
                 ylab = "Global Active Power")
        axis(side = 1, labels = c("Thru","Fri","Sat"), at = seq(0,nrow(power),
                                                                length.out = 3))
        #### plot2
        plot(Voltage, type = "l", xaxt="n", xlab = "datetime",
             ylab = "Voltage")
        axis(side = 1, labels = c("Thru","Fri","Sat"), at = seq(0,nrow(power),
                                                                length.out = 3))
        #### plot3
        plot(Sub_metering_1, type = "l",xlab = "", xaxt = "n", ylab = "Energy sub metering")
        lines(Sub_metering_2, type = "l", col = "red")
        lines(Sub_metering_3, type = "l", col = "blue")
        temp <- legend("topright", legend = leg.txt, col = leg.col, lty = 1, cex = 0.8, bty = "n",
               y.intersp = 0.5)
        
        
        #### plot4
        plot(Global_reactive_power, type = "l", xlab = "datetime", xaxt = "n",
             ylab = "Global_reactive_power")
        axis(side = 1, labels = c("Thru","Fri","Sat"), at = seq(0,nrow(power),
                                                                length.out = 3))
        })

### save to png
dev.copy(png, "plot4.png")
dev.off()
