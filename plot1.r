# This file reads the Electric power consumption data for domestic households and produces useful figures

setwd('~/Projects/DaSci/EDA')
#read in the data and format the dates
data<-read.csv("household_power_consumption.txt", sep =";",
               colClasses=c("character","character", rep("numeric",7)),
               na.strings ="?")
data$Date <- as.Date(data$Date, format ="%d/%m/%Y")

#set date subset variables
x = as.Date("2007-02-01", format = "%Y-%m-%d")
y = as.Date("2007-02-02", format = "%Y-%m-%d")

#subset the data
data_sub <-subset(data, Date == x | Date == y)
data_sub$Global_active_power <- as.numeric(data_sub$Global_active_power)


png(file = "plot1.png")
hist(data_sub$Global_active_power, 
     col = 'red',
     xlab = "Global Active Power (Kilowatts)")

dev.off()

