  temp <- tempfile()
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
  data <- read.table(unz(temp, "household_power_consumption.txt"),header=TRUE,sep=";",na.strings ="?",stringsAsFactors = FALSE)
  unlink(temp)
  
  data$Date <- as.Date(data$Date, "%d/%m/%Y")
  dataNew <- subset(data, Date>="2007/02/01" & Date<="2007/02/02")
  
  hist(dataNew$Global_active_power,main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "Red")
  dev.copy(png, "plot1.png")
  dev.off()
