library(dplyr)
library(lubridate)
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "power_consumption.zip")
unzip("power_consumption.zip")
HPC <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")
HPC  <- tbl_df(HPC)
HPC$Date  <- dmy(HPC$Date)
HPC$Time  <- hms(HPC$Time)
HPC2  <- filter(HPC, Date >= "2007-02-01" & Date <= "2007-02-02")
png("Plot2.png", width = 480, height = 480, units ="px")
plot(HPC2$Date + HPC2$Time, HPC2$Global_active_power, type = "l", xlab ="", ylab = "Global Active Power (kilowatts)")
dev.off()
