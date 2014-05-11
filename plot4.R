# Plots of Global Active Power, Voltage, Energy Sub Metering and
# Global Reactive Power for 2007-02-01 and 2007-02-02
df <- read.csv2("household_power_consumption.txt", header=TRUE)
sub_df <- subset(df, (Date=="1/2/2007" | Date=="2/2/2007") & Time != "?",
                 select=c(Date, Time,
                          Global_active_power, Global_reactive_power,
                          Voltage,
                          Sub_metering_1, Sub_metering_2, Sub_metering_3))
sub_df1 <- subset(sub_df, Global_active_power != "?",
                  select=c(Date, Time, Global_active_power))
sub_df2 <- subset(sub_df, Voltage != "?",
                  select=c(Date, Time, Voltage))
sub_df3 <- subset(sub_df, Sub_metering_1 != "?" & Sub_metering_2 != "?" &
                  Sub_metering_3 != "?",
                  select=c(Date, Time, Sub_metering_1, Sub_metering_2,
                           Sub_metering_3))
sub_df4 <- subset(sub_df, Global_reactive_power != "?",
                  select=c(Date, Time, Global_reactive_power))

png("plot4.png") #default dimensions are width=480 and height=480
par(mfrow=c(2,2))

x <- strptime(paste(sub_df1$Date, sub_df1$Time), format="%d/%m/%Y %H:%M:%S")
y <- as.numeric(as.character(sub_df1$Global_active_power))
plot(x, y, type="l", xlab="", ylab="Global Active Power (kilowatts)")

x <- strptime(paste(sub_df2$Date, sub_df2$Time), format="%d/%m/%Y %H:%M:%S")
y <- as.numeric(as.character(sub_df2$Voltage))
plot(x, y, type="l", xlab="datetime", ylab="Voltage")

x <- strptime(paste(sub_df3$Date, sub_df3$Time), format="%d/%m/%Y %H:%M:%S")
y1 <- as.numeric(as.character(sub_df3$Sub_metering_1))
y2 <- as.numeric(as.character(sub_df3$Sub_metering_2))
y3 <- as.numeric(as.character(sub_df3$Sub_metering_3))
plot(x, y1, type="l", xlab="", ylab="Energy sub metering")
points(x, y2, type="l", col="red")
points(x, y3, type="l", col="blue")
legend("topright",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=1, lwd=2)

x <- strptime(paste(sub_df4$Date, sub_df4$Time), format="%d/%m/%Y %H:%M:%S")
y <- as.numeric(as.character(sub_df4$Global_reactive_power))
plot(x, y, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
