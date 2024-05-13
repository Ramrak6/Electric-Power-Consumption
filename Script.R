
data_power <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", 
                         colClasses = c('character','character','numeric','numeric',
                                        'numeric','numeric','numeric','numeric','numeric'))
## Format date to Type Date
data_power$Date<- as.Date(data_power$Date, format= "%d/%m/%Y")

## Filter data set from feb. 1, 2007 to Feb. 2, 2007
data<- subset(data_power, Date >= "2007-02-01" & Date <= "2007-02-02")

datetime<- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

# generate plot 1
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
# generate plot 2
plot(data$Global_active_power~data$Datetime, type="l", 
     ylab="Global Active Power (kilowatts)", xlab="")
#generate plot 3
with(data, {
  plot(Sub_metering_1~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#generate plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data, {
  plot(Global_active_power~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~Datetime, type="l", ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", ylab="Global Rective Power (kilowatts)",xlab="")
})