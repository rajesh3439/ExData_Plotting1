## Aim of this function is to 
## 1. read the household_power_consumption.txt file
## 2. subset for data taken from 2 days: 2007-02-01 and 2007-02-02
## 3. generate a plot of different submetering vs time

## Parameters: none
## Assumes household_power_consumption.txt file located in working dir
df= read.table(file='household_power_consumption.txt', header = TRUE, sep=';', na.strings = c('?'))
plot_data = df[df$Date=="1/2/2007"|df$Date =="2/2/2007",]

# convert data time character data to datetime class
plot_data$FullTimeDate <- strptime(paste(plot_data$Date, plot_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# plot data
par(mfrow=c(1,1))
with(plot_data,plot(FullTimeDate,Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))

# save data
dev.copy(png, file='plot2.png',width=480, height=480)
dev.off()