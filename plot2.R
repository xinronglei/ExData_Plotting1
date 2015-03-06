setwd("C:/Users/xlei/Downloads")
dt1<-read.table("household_power_consumption.txt",nrow=1,header=TRUE, sep = ";")
classes <- sapply(dt1, class)
dt2<-read.table("household_power_consumption.txt",nrow=2880,header=FALSE,skip=66637,sep = ";",colClasses = classes)
colnames(dt2)<-colnames(dt1)

x <- paste(dt2$Date, dt2$Time)

t<-strptime(x, "%d/%m/%Y %H:%M:%S")
png("plot2.png", width=480, height=480)
with(dt2,plot(t,Global_active_power,type='n',xlab='',ylab="Global Active Power(kilowatts)"))

lines(t,dt2$Global_active_power)
dev.off()