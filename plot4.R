# Set Directory
setwd('/Users/brian/Desktop/Coursera/brian_r/exploratory_data_analysis/week1/household_power_consumption/')

# Read in data
df1 <- read.csv('household_power_consumption.txt', sep = ';', dec = '.', na.strings = '?')

# Subset the data by date
df1sub1 <- subset(df1, as.Date(Date, format = '%d/%m/%Y') >= '2007-02-01' &
                    as.Date(Date, format = '%d/%m/%Y') <= '2007-02-02')

# Plot 4
png(file = 'plot4.png')
par(mfrow = c(2, 2))
plot(strptime(paste(df1sub1$Date, df1sub1$Time), format = '%d/%m/%Y %H:%M:%S'), df1sub1$Global_active_power,
     type = 'l', xlab = '', ylab = 'Global Active Power')
plot(strptime(paste(df1sub1$Date, df1sub1$Time), format = '%d/%m/%Y %H:%M:%S'), df1sub1$Voltage,
     type = 'l', xlab = 'datetime', ylab = 'Voltage')
plot(strptime(paste(df1sub1$Date, df1sub1$Time), format = '%d/%m/%Y %H:%M:%S'), df1sub1$Sub_metering_1,
     type = 'l', xlab = '', ylab = 'Energy sub metering')
lines(strptime(paste(df1sub1$Date, df1sub1$Time), format = '%d/%m/%Y %H:%M:%S'), df1sub1$Sub_metering_2,
      type = 'l', col = 'red')
lines(strptime(paste(df1sub1$Date, df1sub1$Time), format = '%d/%m/%Y %H:%M:%S'), df1sub1$Sub_metering_3,
      type = 'l', col = 'blue')
legend('topright', legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col = c('black', 'red', 'blue'),
       lty = 1)
plot(strptime(paste(df1sub1$Date, df1sub1$Time), format = '%d/%m/%Y %H:%M:%S'), df1sub1$Global_reactive_power,
     type = 'l', xlab = 'datetime', ylab = 'Global_reactive_power', ylim = c(0, 0.5))
dev.off()