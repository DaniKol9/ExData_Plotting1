setwd("C:/Users/Dani/Documents/Coursera/JHU Exploratory Data Analysis/04_Projects/Project_1")

## Download data
fileurl <-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url = fileurl, destfile = "household_power_consumption.zip")

## Read data
#Unzip
unzip("household_power_consumption.zip", "household_power_consumption.txt")

#Read full dataset
full_dataset <- read.table(file = "household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

#Keep only records from the 1st and 2nd of February, 2007
el_data <- subset(full_dataset,(Date=="1/2/2007" |Date == "2/2/2007"))

#Remove full dataset
rm(full_dataset)

# Convert Date and Time into DateTime (POSIXlt)
el_data$DateTime <-strptime(paste(el_data$Date,el_data$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

##Plot Data
#Plot3 (the transparent background color is chosen to match the example png files in the repo)
png(file = "plot3.png", bg="transparent",width = 480, height = 480)
with(el_data, plot(DateTime, Sub_metering_1, type = "n", , xlab = "", ylab = "Energy sub metering"))
lines(el_data$DateTime, col = "black", y = el_data$Sub_metering_1)
lines(el_data$DateTime, col = "red", y = el_data$Sub_metering_2)
lines(el_data$DateTime, col = "blue", y = el_data$Sub_metering_3)
legend("topright", lty=1, col=c('black', 'red', 'blue'), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

