library(lubridate)

# Read Input File
filename <- "household_power_consumption.txt"
inputfile <- read.table(filename,sep=";", header=TRUE, na.strings="?")
inputfile$DateTime <- dmy_hms(paste(inputfile$Date,inputfile$Time))

# Filtering Only valid dates (1st and 2nd of february, 2007)
workdata <- subset(inputfile,year(DateTime)==2007)
workdata <- subset(workdata,month(DateTime)==2)
workdata <- subset(workdata,(day(DateTime)==1|day(DateTime)==2))

# Drawing the plot 4
png("plot4.png", width = 480, height = 480)
par(mfcol=c(2,2))
# Position 1,1
plot(workdata$DateTime,workdata$Global_active_power, type="l", 
     ylab="Global Active Power", xlab="")
# Position 1,2
plot(workdata$DateTime,workdata$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
points(workdata$DateTime,workdata$Sub_metering_2, type="l", col="red")
points(workdata$DateTime,workdata$Sub_metering_3, type="l", col="blue")
legend("topright", lty=c(1,1,1), col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty="n")
# Position 2,1
plot(workdata$DateTime,workdata$Voltage, type="l", 
     ylab="Voltage", xlab="datetime")
# Position 2,2
plot(workdata$DateTime,workdata$Global_reactive_power, type="l", 
     ylab="Global_reactive_power", xlab="datetime")
dev.off()
