#! /path/to/Rscript
#Read in the txt file
tb <- read.table("household_power_consumption.txt",
                 header = TRUE,
                 sep = ";",
                 na.strings = "?"
)

#Select the Date from 2007-02-01 to 2007-02-02
TB <- tb[tb$Date=="1/2/2007" | tb$Date=="2/2/2007", ]
datetime <- strptime(paste(TB$Date, TB$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Open the graphic device of PNG
png(file="plot2.png", width = 480, height = 480)

#Set the global parameters 
par(mfrow=c(1,1), mar=c(5,5,5,5))

#Draw the second plot
with(TB,plot(datetime, Global_active_power, type = "l", xlab="", ylab="Global Active Power(kilowatts)"))

#Close the device
dev.off()