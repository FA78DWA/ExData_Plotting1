## Read the dataset
library(sqldf)
power <- read.csv.sql("household_power_consumption.txt",
                      sql = "select * from file where Date == '1/2/2007'OR Date == '2/2/2007' ", 
                      header = TRUE, sep = ";")
hist(power$Global_active_power, main = "Global Active Power",
     col = "red", xlab = "Global Active Power (kilowatts)")

dev.copy(png, file = "plot1.png")
dev.off()

