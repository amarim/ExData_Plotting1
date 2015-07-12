## Read csv just two days from February
dataeletric <- read.csv("household_power_consumption.txt", 
                        sep = ";", 
                        skip = 66636, 
                        nrows = 2880, 
                        colClasses = "character")

## Take col names
colunas <- read.csv("household_power_consumption.txt", sep = ";", nrows = 1)

## Set col names
names(dataeletric) <- names(colunas)

##delete NA values
dataeletric <- dataeletric[!is.na(dataeletric[,"Date"]),] 

## Set value as numeric
dataeletric[,"Global_active_power"] <- as.numeric(dataeletric[,"Global_active_power"])

## plot4.png
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1))

## 1
plot(x, dataeletric$Global_active_power, 
     type = "l", 
     xlab = "",
     ylab = "Global Active Power (Kilowatts)")

## 2
plot(x, dataeletric$Voltage, 
     type = "l", 
     xlab = "datetime",
     ylab = "Voltage")

## 3
plot(x, dataeletric$Sub_metering_1, 
     type = "l", 
     ylab = "Energy sub metering", xlab = ""
)
points(x, dataeletric$Sub_metering_2,type = "l", col = "orangered")
points(x, dataeletric$Sub_metering_3, type = "l", col = "blue")
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "orangered", "blue"), 
       lty = "solid",
       cex = c(0.6, 0.6, 0.6))

## 4
plot(x, dataeletric$Global_reactive_power, 
     type = "l", 
     xlab = "datetime",
     ylab = "Global_reactive_power")

##plot 1,2,3 and 4
dev.copy(png, file = "plot4.png")
dev.off()