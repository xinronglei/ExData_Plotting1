setwd("C:/Users/xlei/Downloads")
dt1<-read.table("household_power_consumption.txt",nrow=1,header=TRUE, sep = ";")
classes <- sapply(dt1, class)
dt2<-read.table("household_power_consumption.txt",nrow=2880,header=FALSE,skip=66637,sep = ";",colClasses = classes)
colnames(dt2)<-colnames(dt1)

x <- paste(dt2$Date, dt2$Time)

t<-strptime(x, "%d/%m/%Y %H:%M:%S")

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))
with(dt2,{
  plot(t,dt2$Global_active_power,type='n',xlab='',ylab="Global Active Power")
  lines(t,dt2$Global_active_power)
  
  plot(t,dt2$Voltage,type='n',xlab='datetime',ylab="Voltage")
  lines(t,dt2$Voltage)
  
  with(dt2,plot(t,Sub_metering_1,type='n',xlab='',ylab="Energy sub metering)"))
  lines(t,dt2$Sub_metering_1)
  lines(t,dt2$Sub_metering_2,col="red")
  lines(t,dt2$Sub_metering_3,col="blue")
  legend("topright", pch = '-', col = c("black","blue", "red"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),cex=0.6,  pt.cex = 1,bty = "n")
  
  plot(t,dt2$Global_reactive_power,type='n',xlab='datetime',ylab="Global_reactive_power")
  lines(t,dt2$Global_reactive_power)  
})

dev.off()
