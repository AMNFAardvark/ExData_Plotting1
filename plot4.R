dat <- read.csv("household_power_consumption.txt", sep=";", na.strings = "?", header=T, colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
red <- subset(dat, as.character(dat$Date) == "1/2/2007" | as.character(dat$Date) == "2/2/2007")
data <- as.POSIXct(paste(red$Date, red$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

par(mfrow = c(2,2))

plot(red[,3] ~ data, type="l", pch=".", xlab="", ylab="Global Active Power")
plot(red[,5] ~ data, type="l", pch=".", xlab="datetime", ylab="Voltage")

plot(red[,7] ~ data, type="l", pch=".", xlab="", ylab="Energy Sub Metering")
lines(red[,8] ~ data, col="red")
lines(red[,9] ~ data, col="blue")
legend("topright", lty=1, col = c("black", "blue", "red"), cex=0.7, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(red[,3] ~ data, type="l", pch=".", xlab="datetime", ylab="Global_Reactive_Power")

dev.copy(png, file = "Plot4.png")
dev.off()