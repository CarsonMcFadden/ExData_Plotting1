temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
data <- read.table(unz(temp, "household_power_consumption.txt"),header=TRUE,sep=";",na.strings ="?",stringsAsFactors = FALSE)
unlink(temp)

data$DT <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

dataNew <- subset(data, DT>="2007/02/01" & DT<"2007/02/03")

with(dataNew, plot(Sub_metering_1~DT,type="l",ylab="Energy sub metering", xlab = "",col="black"))
lines(dataNew$Sub_metering_2~dataNew$DT,col="red")
lines(dataNew$Sub_metering_3~dataNew$DT,col="blue")

legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"),lty=1)
dev.copy(png, "plot3.png")
dev.off()