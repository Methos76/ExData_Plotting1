
x <-read.csv('household_power_consumption.txt', sep = ';')

x$Date = as.Date(x$Date,"%d/%m/%Y")
x$Time = strptime(paste(x$Date,x$Time,sep=" "),"%Y-%m-%d %H:%M:%S")
relData = x[x$Date >'2007-01-31' & x$Date<'2007-02-03',]

relData$Global_active_power = as.numeric(relData$Global_active_power)
relData$Sub_metering_1 = as.numeric(relData$Sub_metering_1)
relData$Sub_metering_2 = as.numeric(relData$Sub_metering_2)
relData$Sub_metering_3 = as.numeric(relData$Sub_metering_3)

png(filename = "plot3.png", width = 480, height = 480,
    pointsize = 12, bg = "white")

plot (relData$Time, relData$Sub_metering_1,
            ylab = "Energy sub metering",
            xlab = "",
            type="l",
            col = "black")
lines(relData$Time,relData$Sub_metering_2,col="red")
lines(relData$Time,relData$Sub_metering_3,col="blue")
legend("topright",
      c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
      col=c("black","red","blue"),
      lty=1:1:1)
      
dev.off()