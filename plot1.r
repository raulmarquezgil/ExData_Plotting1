library(lubridate)

# Read Input File
filename <- "household_power_consumption.txt"
inputfile <- read.table(filename,sep=";", header=TRUE, na.strings="?")
inputfile$DateTime <- dmy_hms(paste(inputfile$Date,inputfile$Time))

# Filtering Only valid dates (1st and 2nd of february, 2007)
workdata <- subset(inputfile,year(DateTime)==2007)
workdata <- subset(workdata,month(DateTime)==2)
workdata <- subset(workdata,(day(DateTime)==1|day(DateTime)==2))

# Drawing the plot 1
png("plot1.png", width = 480, height = 480)
hist(workdata$Global_active_power, col="red", main="Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()
