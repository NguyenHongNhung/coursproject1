setwd("E://STUDY//R//Coursera - Exploratory data//Course project 1")

#Read the original data
household_power_consumption <- read.csv("E:/STUDY/R/Coursera - Exploratory data/household_power_consumption.txt", sep=";")

#Subset the data on 1/2/2007 and 2/2/2007
dat1 <- subset(household_power_consumption, household_power_consumption$Date == "1/2/2007")
dat2 <- subset(household_power_consumption, household_power_consumption$Date == "2/2/2007")
dat <- rbind(dat1, dat2)

#Convert data frame from factor to numeric and date format

dat$Date<- with(dat, paste(Date, Time))
dat$Date <- strptime(dat$Date, format="%d/%m/%Y %H:%M:%S")

dat$Global_active_power <- as.numeric(as.character(dat$Global_active_power))
dat$Global_reactive_power <- as.numeric(as.character(dat$Global_reactive_power))
dat$Voltage <- as.numeric(as.character(dat$Voltage))
dat$Global_intensity <- as.numeric(as.character(dat$Global_intensity))
dat$Sub_metering_2 <- as.numeric(as.character(dat$Sub_metering_2))
dat$Sub_metering_1 <- as.numeric(as.character(dat$Sub_metering_1))

#Plot4

par(mfrow = c(2,2))
png(file="plot4.png", width = 480, height = 480, units = "px")


plot(x=dat$Date, y=dat$Global_active_power, 
     type="l",
     main=NULL, xlab="DateTime", ylab="Global Active Power (kilowatts)")


plot(x=dat$Date, y=dat$Voltage, 
     type="l",
     main=NULL, xlab="DateTime", ylab="Voltage")

plot(x=dat$Date, y = dat$Sub_metering_1, 
     type="l", main = NULL, xlab="DateTime", ylab="Energy sub metering")
points(x=dat$Date, y = dat$Sub_metering_2, type="l", col="red")
points(x=dat$Date, y = dat$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1), 
       lwd=c(2.5,2.5, 2.5),
       col=c("black", "red", "blue"))

plot(x=dat$Date, y=dat$Global_reactive_power, 
     type="l",
     main=NULL, xlab="DateTime", ylab="Global reactive power")

dev.off()

