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

plot(hh$datetime,hh$Sub_metering_1,type="n",ylab="Energy sub metering",xlab="")
lines(hh$datetime,hh$Sub_metering_1)
lines(hh$datetime,hh$Sub_metering_2,col="red")
lines(hh$datetime,hh$Sub_metering_3,col="blue")
legend("topright",  pch=c(NA,NA) , col = c("blacK", "blue", "red"), cex=0.8,text.width=44000,legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lwd=1, lty=1)
dev.copy(png, file = "plot3.png")  ## Copy my plot to a PNG file
dev.off()  ## close the PNG device