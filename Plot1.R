setwd("~/R/exdata-data-household_power_consumption")
consumption<-read.table("household_power_consumption.txt",sep=";",header=TRUE, na.strings="?", stringsAsFactors=FALSE,)
as.POSIXct (strptime(paste(consumption$Date,consumption$Time), format = "%d/%m/%Y %H:%M:%S"))->consumption$dt
as.Date(consumption$Date, format = "%d/%m/%Y")->consumption$Date

consumption[order(consumption$dt),]->consumption
t1<-as.Date("01-02-2007", format="%d-%m-%Y")
t2<-as.Date("02-02-2007", format= "%d-%m-%Y")
proj1 <- subset(consumption, Date>=t1 & Date<=t2)


png(filename="Plot1.png", width =480, height= 480)

hist(proj1$Global_active_power, col="red", main= "Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()
