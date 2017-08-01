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
png(file="plot3.png", width = 480, height = 480)

#Set the global parameters 
par(mfrow=c(1,1), mar=c(5,5,5,5))

#Draw the third plot
with(TB, {
     plot(datetime, Sub_metering_1, type = "l", col="black",ylab="Energy Submetering", xlab="")
     lines(datetime, Sub_metering_2, type = "l", col="red")
     lines(datetime, Sub_metering_3, type = "l", col="blue")
     })

#Add the legend to the topright
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

#Close the device
dev.off()