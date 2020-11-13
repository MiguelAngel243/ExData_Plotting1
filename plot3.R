##Download and uzips file
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url,"data.zip",method="curl")
unzip("data.zip")

##Search for start, where date is 1 Feb, 2007...
start=grep("1/2/2007",readLines("household_power_consumption.txt"))[1]-1
##Load data starting on the index, above calculated, and loads 2880 lines only
data <- read.table("household_power_consumption.txt",sep=";",skip=start,nrows=2881)
##Converts to date and to time columns 1,2 respectively
data$V2 <- strptime(paste(data$V1,data$V2),"%d/%m/%Y %H:%M:%S")
data$V1 <- as.Date(data$V1,"%d/%m/%Y")
##Assign column names
colnames(data) <- read.table("household_power_consumption.txt",sep=";",nrows=1)

##Set plot size
windows(height = 6, width = 6)
##Plot
plot(data$Time,data$Sub_metering_1,type="n",xlab="", ylab="Energy Sub metering")
lines(data$Time,data$Sub_metering_1)
lines(data$Time,data$Sub_metering_2, col="red")
lines(data$Time,data$Sub_metering_3, col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), pch="_"
       ,col=c("black","red","blue"))

dev.copy(png,filename="plot3.png",width=480,height=480)
dev.off()
