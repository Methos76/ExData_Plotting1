
x <-read.csv('household_power_consumption.txt', sep = ';')

x$Date = as.Date(x$Date,"%d/%m/%Y")
x$Time = strptime(paste(x$Date,x$Time,sep=" "),"%Y-%m-%d %H:%M:%S")
relData = x[x$Date >'2007-01-31' & x$Date<'2007-02-03',]

relData$Global_active_power = as.numeric(relData$Global_active_power)

png(filename = "plot2.png", width = 480, height = 480,
    pointsize = 12, bg = "white")

plot(relData$Time,
     relData$Global_active_power, 
     type ="l", 
     col="black",
     xlab="",
     ylab="Global Active Power (kilowatts)")


dev.off()