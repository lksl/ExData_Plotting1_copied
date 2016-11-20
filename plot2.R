library(lubridate)

# reading data
powercons <- read.table("./data/household_power_consumption.txt",
                        header = TRUE,
                        sep=";")

# select data for 2007-02-01 and 2007-02-02
subpowercons <- subset(powercons,
                       powercons$Date == "1/2/2007" | powercons$Date == "2/2/2007")

# make a plot
par(mfrow=c(1,1))

plot(as.POSIXct(dmy_hms(as.character(paste(subpowercons$Date, subpowercons$Time)))),
     as.numeric(as.character(subpowercons$Global_active_power)),
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)"
     )

# copy to file
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()
