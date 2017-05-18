library(lubridate)

# Read Input File
filename <- "household_power_consumption.txt"
inputfile <- read.table(filename,sep=";", header=TRUE, na.strings="?")
inputfile$DateTime <- dmy_hms(paste(inputfile$Date,inputfile$Time))

# Filtering Only valid dates (1st and 2nd of february, 2007)
workdata <- subset(inputfile,year(DateTime)==2007)
workdata <- subset(workdata,month(DateTime)==2)
workdata <- subset(workdata,(day(DateTime)==1|day(DateTime)==2))

# Drawing the plot 3
png("plot3.png", width = 480, height = 480)
plot(workdata$DateTime,workdata$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
points(workdata$DateTime,workdata$Sub_metering_2, type="l", col="red")
points(workdata$DateTime,workdata$Sub_metering_3, type="l", col="blue")
legend("topright", lty=c(1,1,1), col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
