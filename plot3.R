# Plot of Energy Metering vs Time for 2007-02-01 and 2007-02-02
df <- read.csv2("household_power_consumption.txt", header=TRUE)
sub_df <- subset(df, (Date=="1/2/2007" | Date=="2/2/2007") & Time != "?" &
                 Sub_metering_1 != "?" & Sub_metering_2 != "?" &
                 Sub_metering_3 != "?",
                 select=c(Date, Time,
                          Sub_metering_1, Sub_metering_2, Sub_metering_3))
						  
x <- strptime(paste(sub_df$Date, sub_df$Time), format="%d/%m/%Y %H:%M:%S")
y1 <- as.numeric(as.character(sub_df$Sub_metering_1))
y2 <- as.numeric(as.character(sub_df$Sub_metering_2))
y3 <- as.numeric(as.character(sub_df$Sub_metering_3))

png("plot3.png") #default dimensions are width=480 and height=480
plot(x, y1, type="l", xlab="", ylab="Energy sub metering")
points(x, y2, type="l", col="red")
points(x, y3, type="l", col="blue")
legend("topright",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=1, lwd=2)
dev.off()
