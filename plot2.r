library(lubridate)

# Read Input File
filename <- "household_power_consumption.txt"
inputfile <- read.table(filename,sep=";", header=TRUE, na.strings="?")
inputfile$DateTime <- dmy_hms(paste(inputfile$Date,inputfile$Time))

# Filtering Only valid dates (1st and 2nd of february, 2007)
workdata <- subset(inputfile,year(DateTime)==2007)
workdata <- subset(workdata,month(DateTime)==2)
workdata <- subset(workdata,(day(DateTime)==1|day(DateTime)==2))

# Drawing the plot 2
png("plot2.png", width = 480, height = 480)
plot(workdata$DateTime,workdata$Global_active_power, type="l", 
     ylab="Global Active Power (kilowatts)", xlab="")
dev.off()
