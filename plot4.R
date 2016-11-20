library(lubridate)

# reading data
powercons <- read.table("./data/household_power_consumption.txt",
                        header = TRUE,
                        sep=";")

# select data for 2007-02-01 and 2007-02-02
subpowercons <- subset(powercons,
                       powercons$Date == "1/2/2007" | powercons$Date == "2/2/2007")

# creating plots
subpcDateTime <- as.POSIXct(dmy_hms(as.character(paste(subpowercons$Date, subpowercons$Time))))
subpcGlActPow <- as.numeric(as.character(subpowercons$Global_active_power))
subpcVoltage <- as.numeric(as.character(subpowercons$Voltage))
subM1 <- as.numeric(as.character(subpowercons$Sub_metering_1))
subM2 <- as.numeric(as.character(subpowercons$Sub_metering_2))
subM3 <- as.numeric(as.character(subpowercons$Sub_metering_3))
subpcGlReActPow <- as.numeric(as.character(subpowercons$Global_reactive_power))

par(mfrow=c(2,2))

plot(subpcDateTime, subpcGlActPow, type = "l", xlab = "", ylab = "Global Active Power")

plot(subpcDateTime, subpcVoltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(subpcDateTime, subM1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(subpcDateTime, subM2, col = "red")
lines(subpcDateTime, subM3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), cex = 0.7,
       legend = c("Sub_metering_1          ", "Sub_metering_2          ", "Sub_metering_3          "))

plot(subpcDateTime, subpcGlReActPow, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

# copy to file
dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()
