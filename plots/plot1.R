dataeletric <- read.csv("household_power_consumption.txt", sep = ";", skip = 66636, nrows = 2880, colClasses = "character")
colunas <- read.csv("household_power_consumption.txt", sep = ";", nrows = 1)
names(dataeletric) <- names(colunas)

dataeletric <- dataeletric[!is.na(dataeletric[,"Date"]),] ##Exclui NA
dataeletric[,"Global_active_power"] <- as.numeric(dataeletric[,"Global_active_power"])

hist(dataeletric$Global_active_power, 
     main = "Global Active Power", 
     xlab = "Global Active Power (Kilowatts)", 
     ylab = "Frequency", 
     col = "orangered")
dev.copy(png, file = "plot1.png")
dev.off()