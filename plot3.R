##plot1
## chose Directory
dir <- choose.dir()
setwd(dir)
## Load Data
dat <- read.csv("household_power_consumption.txt", sep=";", na.strings = "?", header=T, colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
##Sort
blue <- subset(dat, as.character(dat$Date) == "1/2/2007" | as.character(dat$Date) == "2/2/2007")
data <- as.POSIXct(paste(blue$Date, blue$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
##Plot
plot(blue[,7] ~ data, type="l", pch=".", xlab="", ylab="Energy Sub Metering")
lines(blue[,8] ~ data, col="red")
lines(blue[,9] ~ data, col="blue")
legend("topright", lty=1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


dev.copy(png, file = "Plot3.png")

dev.off()
