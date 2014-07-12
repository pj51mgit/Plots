setwd("C:/Users/Peter/Documents/Data Scientist Toolbox/Exploratory Data Analysis")
##Read in February data subset saved with "plot1.R from "household_power_consumption.txt"
Febdata <-read.csv("household_power_consumption_February.csv", header = TRUE)

X <- paste(Febdata$Date, Febdata$Time)
Febdata$X <- strptime(x, "%Y-%m-%d %H:%M:%S")

par(mfrow=c(1,1), mar=c(5.1,4.1,4.1,2.1), oma=c(0,0,1,0))
plot(Febdata$X, Febdata$Global_active_power, type="n", xlab="", ylab="Global Active Power (kilowatts)")
lines(Febdata$X, Febdata$Global_active_power)
mtext("Plot 2", outer = TRUE, line =-1)
dev.copy(png, file = "plot2.png")  ## Copy of plot2 to a PNG file
dev.off()  ## Close PNG device!
