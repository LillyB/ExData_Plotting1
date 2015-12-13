setwd("~/R/exdata-data-household_power_consumption")
consumption<-read.table("household_power_consumption.txt",sep=";",header=TRUE, na.strings="?", stringsAsFactors=FALSE,)
as.POSIXct (strptime(paste(consumption$Date,consumption$Time), format = "%d/%m/%Y %H:%M:%S"))->consumption$dt
as.Date(consumption$Date, format = "%d/%m/%Y")->consumption$Date

consumption[order(consumption$dt),]->consumption
t1<-as.Date("01-02-2007", format="%d-%m-%Y")
t2<-as.Date("02-02-2007", format= "%d-%m-%Y")
proj1 <- subset(consumption, Date>=t1 & Date<=t2)

png(filename="Plot4.png", width =480, height= 480)
par(mfrow= c(2,2))
plot(Global_active_power~dt,data=proj1, type = "s",
     ylab="Global Active Power", xlab="")

plot(Voltage~dt,data=proj1, type = "s",
     ylab="Voltage", xlab="datetime")


plot(Sub_metering_1~dt,data=proj1, type = "s",col=1,
     ylab="Energy sub metering", xlab="")
lines(Sub_metering_2~dt, data=proj1, type = "s",col=2)
lines(Sub_metering_3~dt,data=proj1, type = "s",col=4)
legend('topright',legend=names(proj1)[7:9],lty=1,box.lwd = "n",inset=.05,
       col=c(1,2,4))

plot(Global_reactive_power~dt, data=proj1, type = "s",
    xlab="datetime")

dev.off()
