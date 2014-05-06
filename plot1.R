# if the work directory doesn't has a folder called data or the folder doesn't 
# contain a file called "household_power_consumption.txt", run the following 
# code to get the raw data for the plot. If the data has already in the right
# places, just add a '#' to skip the download process.

source('getdata.R')

# read the raw data

data <- read.table('./data/household_power_consumption.txt',
                   sep=';',
                   header=T,
                   na.string='?')

# convert the Date and Time variables to Date/Time classes

data$DT <- strptime(paste(data$Date,data$Time),format="%d/%m/%Y%H:%M:%S")
data$Date <- as.Date(data$Date,format="%d/%m/%Y")
data$Time <- strptime(data$Time,format="%H:%M:%S")

# subset data from the dates 2007-02-01 and 2007-02-02


index <- which(data$Date == '2007-02-01'|data$Date == '2007-02-02')

subdata <- data[index,]

# summary the index and the subdata to get the rows index and the length and 
# next time we could read the data by the following code
# data <- read.table('./data/household_power_consumption.txt',
#                    sep=';',
#                    na.string='?',
#                    skip=66637,
#                    nrows=2880)
# colnames(data) <- colnames(read.table('./data/household_power_consumption.txt',sep=';',header=T,nrows=1)) 

# histgram

png('plot1.png')
hist(subdata$Global_active_power,
     col='red',
     xlab='Global Active Power (kilowatt)',
     main='Global Actlve Power')
dev.off()