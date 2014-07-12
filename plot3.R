setwd("C:/Users/Peter/Documents/Data Scientist Toolbox/Exploratory Data Analysis")
Febdata <-read.csv("household_power_consumption_February.txt", header = TRUE)
head(Febdata,5)

X <- paste(Febdata$Date, Febdata$Time)
Febdata$X <- strptime(x, "%Y-%m-%d %H:%M:%S")
par(mfrow=c(1,1), mar=c(5.1,4.1,4.1,2.1), oma=c(0,0,1,0))
with(Febdata, {
  plot(Febdata$X,Febdata$Sub_metering_1, type = "n", xlab="", ylab="Energy sub Metering")
  lines(Febdata$X,Febdata$Sub_metering_1)
  lines(Febdata$X,Febdata$Sub_metering_2, col = "red")
  lines(Febdata$X,Febdata$Sub_metering_3, col = "darkblue")
})
legend("topright", lty = 1, cex = 0.6, col = c("black", "darkblue", "red"), legend = c("Sub_metering_1","Sub-metering_2", "Sub-metering_3"))
mtext("Plot 3", outer = TRUE, line =-1)
dev.copy(png, file = "plot3.png")  ## Copy of plot3 to a PNG file
dev.off()  ## Close PNG device!


