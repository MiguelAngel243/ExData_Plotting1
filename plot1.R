##Download and uzips file
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url,"data.zip",method="curl")
unzip("data.zip")

##Search for start, where date is 1 Feb, 2007...
start=grep("1/2/2007",readLines("household_power_consumption.txt"))[1]-1
##Load data starting on the index, above calculated, and loads 2880 lines only
data <- read.table("household_power_consumption.txt",sep=";",skip=start,nrows=2880)
##Converts to date and to time columns 1,2 respectively
data$V2 <- strptime(paste(data$V1,data$V2),"%d/%m/%Y %H:%M:%S")
data$V1 <- as.Date(data$V1,"%d/%m/%Y")
##Assign column names
colnames(data) <- read.table("household_power_consumption.txt",sep=";",nrows=1)
##Histogram
windows(height = 6, width = 6)
hist(data$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",
     main="Global Active Power")
dev.copy(png,filename="plot1.png",width=480,height=480)
dev.off()


