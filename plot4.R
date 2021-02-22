## Aim of this function is to 
## 1. read the household_power_consumption.txt file
## 2. subset for data taken from 2 days: 2007-02-01 and 2007-02-02
## 3. generate 4 plots in 1 space (GAP vs. time, Vol vs. time, submetering vs. time and GRP vs. time)

## Assumes household_power_consumption.txt file located in working dir

#read data
#if(!exists("df"))
df= read.table(file='household_power_consumption.txt', header = TRUE, sep=';', na.strings = c('?'))
#if(!exists("plot_data"))
plot_data = df[df$Date=="1/2/2007"|df$Date =="2/2/2007",]

# convert data time character data to datetime class
plot_data$FullTimeDate <- strptime(paste(plot_data$Date, plot_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# plot data
par(mfrow=c(2,2))

with(plot_data, {
    plot(FullTimeDate, Global_active_power, xlab="", ylab = "Global Active Power", type='l')
    plot(FullTimeDate, Voltage, type='l', xlab="datetime")
    plot(FullTimeDate,Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
    points(FullTimeDate,Sub_metering_1, type="l")
    points(FullTimeDate,Sub_metering_2, type="l", col='blue')
    points(FullTimeDate,Sub_metering_3, type="l", col='red')
    legend("topright", col=c('black','blue','red'), lty=1, lwd=2, legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))
    plot(FullTimeDate, Global_reactive_power, type='l', xlab="datetime")
})


# save data
dev.copy(png, file='plot4.png',width=480, height=480)
dev.off()