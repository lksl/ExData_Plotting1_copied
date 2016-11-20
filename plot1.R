# loading data
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile="./data/Dataset.zip")
unzip(zipfile="./data/Dataset.zip",exdir="./data")

# reading data
powercons <- read.table("./data/household_power_consumption.txt",
                        header = TRUE,
                        sep=";")

# select data for 2007-02-01 and 2007-02-02
subpowercons <- subset(powercons,
                       powercons$Date == "1/2/2007" | powercons$Date == "2/2/2007")

# make a plot
par(mfrow=c(1,1))

hist(as.numeric(as.character(subpowercons$Global_active_power)),
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

# copy to file
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()
