allpowerdata<-read.csv("household_power_consumption.txt", sep=";")
useabledata<-subset(allpowerdata, Date =="1/2/2007" | Date == "2/2/2007")
x<-as.numeric(useabledata$Global_active_power)/500
len<-length(x)
png("plot2.png", height=480, width=480)
plot(x, type = "l", ylab = "Global Active Power (kilowatts)", xaxt="n", xlab = "")
axis(side=1, at=seq(0,len, by=len/2), labels=c("Thu", "Fri", "Sat"))
dev.off()