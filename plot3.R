allpowerdata<-read.csv("household_power_consumption.txt", sep=";")
useabledata<-subset(allpowerdata, Date =="1/2/2007" | Date == "2/2/2007")
x<-as.numeric(as.character(useabledata$Sub_metering_1))
y<-as.numeric(as.character(useabledata$Sub_metering_2))
z<-as.numeric(as.character(useabledata$Sub_metering_3))
dates<-paste(useabledata$Date, useabledata$Time)
finaldates<-strptime(dates, "%d/%m/%Y %H:%M:%S")
png("plot3.png", height=480, width=480)
plot(finaldates, x, type = "l", ylab = "Energy sub metering", xlab="")
lines(finaldates, y, type="l", col="red")
lines(finaldates, z, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col = c("black","red","blue"))
dev.off()