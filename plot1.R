setwd("C:/Users/xlei/Downloads")
dt1<-read.table("household_power_consumption.txt",nrow=1,header=TRUE, sep = ";")

#dt1$Date<-as.Date(dt1$Date)
classes <- sapply(dt1, class)

dt2<-read.table("household_power_consumption.txt",nrow=2880,header=FALSE,skip=66637,sep = ";",colClasses = classes)
colnames(dt2)<-colnames(dt1)
dt2$Date<-strptime(dt2$Date, "%y/%m/%d")
attach(dt2)
png("plot1.png", width=480, height=480)
hist(Global_active_power,xlab="Global Active Power(kilowatts)",col="red",main="Global Active Power")
dev.off()
