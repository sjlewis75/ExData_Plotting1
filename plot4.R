allpowerdata<-read.csv("household_power_consumption.txt", sep=";")
useabledata<-subset(allpowerdata, Date =="1/2/2007" | Date == "2/2/2007")
x1<-as.numeric(as.character(useabledata$Global_active_power))/500
x2<-as.numeric(as.character(useabledata$Sub_metering_1))
y2<-as.numeric(as.character(useabledata$Sub_metering_2))
z2<-as.numeric(as.character(useabledata$Sub_metering_3))
x3<-as.numeric(as.character(useabledata$Voltage))
x4<-as.numeric(as.character(useabledata$Global_reactive_power))/400
len1<-length(x1)
len2<-length(x2)
len3<-length(x3)
len4<-length(x4)

png("plot4.png", height=480, width=480)
par(mfcol=c(2,2))
#Graph 1
plot(x1, type = "l", ylab = "Global Active Power (kilowatts)", xaxt="n", xlab="")
axis(side=1, at=seq(0,len1, by=len1/2), labels=c("Thu", "Fri", "Sat"))


#Graph 2
plot(x2-2, type = "l", ylab = "Energy sub metering", xaxt="n", yaxt="n",ylim=c(0, max(x2)), xlab="")
lines((y2-2)/10, type="l", col="red")
lines(z2, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col = c("black","red","blue"), bty="n", cex=0.8)
axis(side=1, at=seq(0,len, by=len2/2), labels=c("Thu", "Fri", "Sat"))
axis(side=2, at=seq(0,max(x2), by=10))

#Graph 3
plot(x3, type = "l",  ylab = "Voltage", xaxt="n", xlab = "datetime" )
axis(side=1, at=seq(0,len4, by=len4/2), labels=c("Thu", "Fri", "Sat"))

#Graph 4
plot(x4, type = "l",  ylab = "Global_reactive_power", xaxt="n", xlab = "datetime",ylim=c(0, 0.5))
axis(side=1, at=seq(0,len4, by=len4/2), labels=c("Thu", "Fri", "Sat"))
axis(side=2, at=seq(0,0.5, by=0.1), cex.lab=0.75, labels = c("0.0","0.1","0.2","0.3","0.4","0.5"))
dev.off()