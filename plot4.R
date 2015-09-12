allpowerdata<-read.csv("household_power_consumption.txt", sep=";")
useabledata<-subset(allpowerdata, Date =="1/2/2007" | Date == "2/2/2007")
x1<-as.numeric(as.character(useabledata$Global_active_power))
x2<-as.numeric(as.character(useabledata$Sub_metering_1))
y2<-as.numeric(as.character(useabledata$Sub_metering_2))
z2<-as.numeric(as.character(useabledata$Sub_metering_3))
x3<-as.numeric(as.character(useabledata$Voltage))
x4<-as.numeric(as.character(useabledata$Global_reactive_power))
dates<-paste(useabledata$Date, useabledata$Time)
datetime<-strptime(dates, "%d/%m/%Y %H:%M:%S")


png("plot4.png", height=480, width=480)
par(mfcol=c(2,2))
#Graph 1
plot(datetime, x1, type = "l", ylab = "Global Active Power (kilowatts)")

#Graph 2
plot(datetime, x2, type = "l", ylab = "Energy sub metering", xlab="")
lines(datetime, y2, type="l", col="red")
lines(datetime, z2, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col = c("black","red","blue"), bty="n", cex=0.8)

#Graph 3
plot(datetime, x3, type = "l",  ylab = "Voltage")

#Graph 4
plot(datetime, x4, type = "l",  ylab = "Global_reactive_power")
dev.off()