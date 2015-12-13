setwd("~/R/exdata-data-household_power_consumption")
consumption<-read.table("household_power_consumption.txt",sep=";",header=TRUE, na.strings="?", stringsAsFactors=FALSE,)
as.POSIXct (strptime(paste(consumption$Date,consumption$Time), format = "%d/%m/%Y %H:%M:%S"))->consumption$dt
as.Date(consumption$Date, format = "%d/%m/%Y")->consumption$Date

consumption[order(consumption$dt),]->consumption
t1<-as.Date("01-02-2007", format="%d-%m-%Y")
t2<-as.Date("02-02-2007", format= "%d-%m-%Y")
proj1 <- subset(consumption, Date>=t1 & Date<=t2)

png(filename="Plot3.png", width =480, height= 480)
plot(proj1$dt,proj1$Sub_metering_1, type = "s",col=1,
     ylab="Energy sub metering", xlab="")
lines(proj1$dt,proj1$Sub_metering_2, type = "s",col=2)
lines(proj1$dt,proj1$Sub_metering_3, type = "s",col=4)
legend('topright',legend=names(proj1)[7:9],lty=1,inset=.05, col=c(1,2,4))

dev.off()
