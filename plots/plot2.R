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

## plot 2
x <- strptime(paste(dataeletric[,"Date"], dataeletric[, "Time"]), "%d/%m/%Y %H:%M:%S")

plot(x, dataeletric$Global_active_power, 
     type = "l", 
     xlab = "",
     ylab = "Global Active Power (Kilowatts)")
dev.copy(png, file = "plot2.png")
dev.off()