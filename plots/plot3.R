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

## plot3.png
x <- strptime(paste(dataeletric[,"Date"], dataeletric[, "Time"]), "%d/%m/%Y %H:%M:%S")
plot(x, dataeletric$Sub_metering_1, 
     type = "l", 
     ylab = "Energy sub metering", 
     xlab = "")
points(x, dataeletric$Sub_metering_2,type = "l", col = "orangered")
points(x, dataeletric$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "orangered", "blue"), lty = "solid")
dev.copy(png, file = "plot3.png")
dev.off()