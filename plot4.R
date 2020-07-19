#read data
data <- read.table(file.choose(), sep=";",
                   na.strings="?",
                   stringsAsFactors = FALSE)
#column names
colnames(data) <- c("Date","Time","Global_active_power",
                    "Global_reactive_power","Voltage","Global_intensity",
                    "Sub_metering_1","Sub_metering_2","Sub_metering_3" )
#select data
subsetDate <- subset(data, Date %in% c("1/2/2007","2/2/2007"))

#convert to data
subsetDate$Date <- as.Date(subsetDate$Date, format="%d/%m/%Y")

#convert time
date_time <- paste(as.Date(subsetDate$Date),subsetDate$Time)
subsetDate$Datetime <- as.POSIXct(date_time)

#convert to numeric Glogal active power
subsetDate$Global_active_power <- as.numeric(subsetDate$Global_active_power)

#plot
par(mfrow = c(2, 2))
plot(subsetDate$Datetime, subsetDate$Global_active_power, type = "l",
     ylab = "Global Active Power (kilowatts)")
plot(subsetDate$Datetime, subsetDate$Voltage, type = "l", xlab = "datetime",
     ylab = "Voltage")
plot(subsetDate$Datetime, subsetDate$Sub_metering_1, type = "l", 
     xlab = "", ylab = "Energy sub metering", col = "black")
lines(subsetDate$Datetime, subsetDate$Sub_metering_2, type = "l", col = "red")
lines(subsetDate$Datetime, subsetDate$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, lwd=2.5, col=c("black", "red", "blue"))
plot(subsetDate$Datetime, subsetDate$Global_reactive_power, 
     type="l",xlab="datetime", ylab = "Global_reactive_power")

