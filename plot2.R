##plot1
## chose Directory
dir <- choose.dir()
setwd(dir)
## Load Data
dat <- read.csv("household_power_consumption.txt", sep=";", na.strings = "?", header=T, colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
red <- subset(dat, as.character(dat$Date) == "1/2/2007" | as.character(dat$Date) == "2/2/2007")
plot (red[,3] ~ as.POSIXct(paste(red$Date, red$Time, sep=" "), format="%d/%m/%Y %H:%M:%S"),
      type="l", pch=".", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file = "Plot2.png")
dev.off()