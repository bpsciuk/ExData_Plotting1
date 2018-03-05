# Set Directory
setwd('/Users/brian/Desktop/Coursera/brian_r/exploratory_data_analysis/week1/household_power_consumption/')

# Read in data
df1 <- read.csv('household_power_consumption.txt', sep = ';', dec = '.', na.strings = '?')

# Subset the data by date
df1sub1 <- subset(df1, as.Date(Date, format = '%d/%m/%Y') >= '2007-02-01' &
                    as.Date(Date, format = '%d/%m/%Y') <= '2007-02-02')

# Plot 2
png(file = 'plot2.png')
plot(strptime(paste(df1sub1$Date, df1sub1$Time), format = '%d/%m/%Y %H:%M:%S'), df1sub1$Global_active_power,
     type = 'l', xlab = '', ylab = 'Global Active Power (kilowatts)')
dev.off()