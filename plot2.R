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

#plot
plot(subsetDate$Datetime, subsetDate$Global_active_power, type = "l", xlab = ""
     ylab = "Global Active Power (kilowatts)")

dev.off()