
x <-read.csv('household_power_consumption.txt', sep = ';')

x$Date = as.Date(x$Date,"%d/%m/%Y")
x$Time = strptime(paste(x$Date,x$Time,sep=" "),"%Y-%m-%d %H:%M:%S")
relData = x[x$Date >'2007-01-31' & x$Date<'2007-02-03',]

relData$Global_active_power = as.numeric(relData$Global_active_power)

png(filename = "plot1.png", width = 480, height = 480,
    pointsize = 12, bg = "white")

hist(relData$Global_active_power,
          main="Global Active Power",
          xlab="GlobalActivePower (kilowatts)",
          col="red"
)

dev.off()