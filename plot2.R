# ## Read the dataset
library(sqldf)
power <- read.csv.sql("household_power_consumption.txt",
                      sql = "select * from file where Date == '1/2/2007'OR
                        Date == '2/2/2007' ", header = TRUE, sep = ";")

## Create a day variable and make it a factor
with(power, plot(Global_active_power, type = "l", xaxt="n", xlab = "",
                 ylab = "Global Active Power (kilowatts)"))
axis(side = 1, labels = c("Thru","Fri","Sat"), at = seq(0,nrow(power),length.out = 3))

dev.copy(png, "plot2.png")
dev.off()



