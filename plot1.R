allpowerdata<-read.csv("household_power_consumption.txt", sep=";")
useabledata<-subset(allpowerdata, Date =="1/2/2007" | Date == "2/2/2007")
x<-as.numeric(useabledata$Global_active_power)/500
png("plot1.png", height=480, width=480)
hist(x, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()