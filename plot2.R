# Plot of Global Active Power vs Time for 2007-02-01 and 2007-02-02
df <- read.csv2("household_power_consumption.txt", header=TRUE)
sub_df <- subset(df, (Date=="1/2/2007" | Date=="2/2/2007") &
                 Global_active_power != "?" & Time != "?",
                 select=c(Date, Time, Global_active_power))
x <- strptime(paste(sub_df$Date, sub_df$Time), format="%d/%m/%Y %H:%M:%S")
y <- as.numeric(as.character(sub_df$Global_active_power))
png("plot2.png") #default dimensions are width=480 and height=480
plot(x, y, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
