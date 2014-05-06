# This script show the steps of getting data fot the assessments
# set the work direction

setwd("~/ExData_Plotting1")

# Download the data from the internet and save it in the data folder

if (!file.exists("data")) {
  dir.create("data")
}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "./data/DATA.zip", method = "curl")

# Unzip the data and show the file list using the function unzip in the utils 
# package

library(utils)
unzip('./data/DATA.zip', exdir = './data/')

# Here I found the infomation for cleaning the data in the txt files and the 
# data files 