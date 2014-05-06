# if the work directory doesn't has a folder called data or the folder doesn't 
# contain a file called "household_power_consumption.txt", run the following 
# code to get the raw data for the plot. If the data has already in the right
# places, just add a '#' to skip the download process.

source('getdata.R')

# read the data needed

data <- read.table('./data/household_power_consumption.txt',
                   sep=';',
                   na.string='?',
                   skip=66637,
                   nrows=2880)
colnames(data) <- colnames(read.table('./data/household_power_consumption.txt',sep=';',header=T,nrows=1)) 

# convert the Date and Time variables to Date/Time classes

data$DT <- strptime(paste(data$Date,data$Time),format="%d/%m/%Y%H:%M:%S")
data$Date <- as.Date(data$Date,format="%d/%m/%Y")
data$Time <- strptime(data$Time,format="%H:%M:%S")

# plot the global active power

png('plot2.png')
plot(data$DT,data$Global_active_power,
     type='l',
     xlab='',
     ylab='Global Active Power (kilowatt)')
dev.off()