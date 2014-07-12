## set working directory
setwd("C:/Users/Peter/Documents/Data Scientist Toolbox/Exploratory Data Analysis")
##Create a temporary file to download the zip file to
temp <- tempfile()

##Download the zipfile from the URL to the Working Directory
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL, temp, mode="wb")
##Important to use 'mode = "wb"' to ensure data is extractable

##unzip temp file to extract directory with data files to Working Directory
unzip(temp)
unlink(temp)

powerdata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
powerdata[,1] <- as.Date(powerdata[,1], "%d/%m/%Y")
Febdata <- subset(powerdata, powerdata$Date == "2007-02-01" | powerdata$Date == "2007-02-02")
Febdata$Global_active_power <- as.numeric(Febdata$Global_active_power)
write.csv(Febdata, "household_power_consumption_February.csv")  ##Save the February data for later plotting

##Febdata <-read.table("household_power_consumption_February.txt", header = TRUE, sep = ",")
##head(Febdata,10)
par(mfrow=c(1,1), mar=c(5.1,4.1,4.1,2.1), oma=c(0,0,1,0))
hist(Febdata$Global_active_power, col='red', main="Global Active Power", xlab = "Global Active Power(kilowatts)")
mtext("Plot 1", outer = TRUE, line =-1)
dev.copy(png, file = "plot1.png")  ## Copy of plot1 to a PNG file
dev.off()  ## Close PNG device!



