#Need this to make Dates nicer
library(lubridate)
par(mfcol = c(1, 1))
# Readin the data (Note: separted by semicolons)
household<-read.csv("R/data//exdata-data-household_power_consumption/household_power_consumption.txt", sep=";",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings="?")
household$Date<-dmy(household$Date)
#Select only the correct dates
hh<-household[(household$Date==dmy("1/2/2007")|household$Date==dmy("2/2/2007")), ]
#Format dates
hh$Date<-ymd_hms(paste(as.character(hh$Date),hh$Time))
#Plot Histogram
hist((hh$Global_active_power),main = "Global Active Power", col="red",ylab="Frequency",xlab="Global Active Power (kilowatts)")
#Push out a png file
dev.copy(png, file = "plot1.png") 
dev.off()  ## close the PNG device

