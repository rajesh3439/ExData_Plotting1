## Aim of this function is to 
## 1. read the household_power_consumption.txt file
## 2. subset for data taken from 2 days: 2007-02-01 and 2007-02-02
## 3. generate a histogram for Global active power

## Parameters: none
## Assumes household_power_consumption.txt file located in working dir

#read data
df= read.table(file='household_power_consumption.txt', header = TRUE, sep=';', na.strings = c('?'))
#subset data for 2 days
plot_data = df[df$Date=="1/2/2007"|df$Date =="2/2/2007",]

#histogram
par(mfrow=c(1,1))
hist(plot_data$Global_active_power, col='red', xlab = 'Global Active Power (kilowatts)', main='Global Active Power')

# save data
dev.copy(png, file='plot1.png',width=480, height=480)
dev.off()