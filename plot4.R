#Need this to make Dates nicer
library(lubridate)
par(mfcol = c(1, 1))
# Readin the data (Note: separted by semicolons)
household<-read.csv("R/data//exdata-data-household_power_consumption/household_power_consumption.txt", sep=";",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings="?")
household$Date<-dmy(household$Date)
#Select only the correct dates
hh<-household[(household$Date==dmy("1/2/2007")|household$Date==dmy("2/2/2007")), ]
#Format dates
hh$datetime<-ymd_hms(paste(as.character(hh$Date),hh$Time))
# Do 4 up plot
# Reset to do columns first
par(mfcol = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))

plot(hh$datetime,hh$Global_active_power,xlab="",type="n",ylab="Global Active Power (kilowatts)")
lines(hh$datetime,hh$Global_active_power)


plot(hh$datetime,hh$Sub_metering_1,type="n",ylab="Energy sub metering",xlab="")
lines(hh$datetime,hh$Sub_metering_1)
lines(hh$datetime,hh$Sub_metering_2,col="red")
lines(hh$datetime,hh$Sub_metering_3,col="blue")
#Legend with no box bty "o"
legend("topright",  pch=c(NA,NA) ,cex=0.7,text.width=69000, col = c("blacK", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lwd=1, lty=1, bty="n")

with(hh,plot(datetime,Voltage,type="n",ylab="Voltage"))
lines(hh$datetime,hh$Voltage)

with(hh,plot(datetime,Global_reactive_power,type="n",ylab="Global_reactive_power"))
lines(hh$datetime,hh$Global_reactive_power)
dev.copy(png, file = "plot4.png")  
dev.off()  ## close the PNG device