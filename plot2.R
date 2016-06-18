temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
data <- read.table(unz(temp, "household_power_consumption.txt"),header=TRUE,sep=";",na.strings ="?",stringsAsFactors = FALSE)
unlink(temp)

data$DT <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

dataNew <- subset(data, DT>="2007/02/01" & DT<"2007/02/03")

with(dataNew, plot(Global_active_power~DT,type="l",ylab="Global Active Power (kilowatts)", xlab = ""))
dev.copy(png, "plot2.png")
dev.off()