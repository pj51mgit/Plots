setwd("C:/Users/Peter/Documents/Data Scientist Toolbox/Exploratory Data Analysis")
Febdata <-read.csv("household_power_consumption_February.txt", header = TRUE)

X <- paste(Febdata$Date, Febdata$Time)
Febdata$X <- strptime(x, "%Y-%m-%d %H:%M:%S")
par(mfrow=c(2,2), mar=c(4.1,4.1,1.1,1.0), oma=c(0,0,1,0))
with(Febdata, {
  plot(Febdata$X, Febdata$Global_active_power, type="n", xlab="", ylab="Global Active Power (kilowatts)")
  lines(Febdata$X, Febdata$Global_active_power)
  plot(Febdata$X, Febdata$Voltage, type = "n", xlab = "datetime", ylab = "Voltage")
  lines(Febdata$X, Febdata$Voltage)
  plot(Febdata$X,Febdata$Sub_metering_1, type = "n", xlab="", ylab="Energy sub Metering")
  lines(Febdata$X,Febdata$Sub_metering_1)
  lines(Febdata$X,Febdata$Sub_metering_2, col = "red")
  lines(Febdata$X,Febdata$Sub_metering_3, col = "darkblue")
  legend("topright", lty = 1, cex = 0.4, col = c("black", "darkblue", "red"), legend = c("Sub_metering_1","Sub-metering_2", "Sub-metering_3"))
  plot(Febdata$X, Febdata$Global_reactive_power, type="n", xlab="datetime", ylab="Global_reactive_power")
  lines(Febdata$X,Febdata$Global_reactive_power, col="black")
})
mtext("Plot 4", outer = TRUE, line =-0.5)
dev.copy(png, file = "plot4.png")  ## Copy of plot4 to a PNG file
dev.off()  ## Close PNG device!
