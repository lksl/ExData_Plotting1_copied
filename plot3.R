library(lubridate)

# reading data
powercons <- read.table("./data/household_power_consumption.txt",
                        header = TRUE,
                        sep=";")

# select data for 2007-02-01 and 2007-02-02
subpowercons <- subset(powercons,
                       powercons$Date == "1/2/2007" | powercons$Date == "2/2/2007")

# make a plot
subpcDateTime <- as.POSIXct(dmy_hms(as.character(paste(subpowercons$Date, subpowercons$Time))))
subM1 <- as.numeric(as.character(subpowercons$Sub_metering_1))
subM2 <- as.numeric(as.character(subpowercons$Sub_metering_2))
subM3 <- as.numeric(as.character(subpowercons$Sub_metering_3))

par(mfrow=c(1,1))

plot(subpcDateTime, subM1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(subpcDateTime, subM2, col = "red")
lines(subpcDateTime, subM3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1         ", "Sub_metering_2         ", "Sub_metering_3         "))

# copy to file
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()
