# Histogram of Global Active Power for 2007-02-01 and 2007-02-02
df <- read.csv2("household_power_consumption.txt", header=TRUE)
sub_df <- subset(df, (Date=="1/2/2007" | Date=="2/2/2007") &
                   Global_active_power != "?", select=Global_active_power)
png("plot1.png") #default dimensions are width=480 and height=480
hist(as.numeric(as.character(sub_df$Global_active_power)), col="red",
                  main="Global Active Power",
                  xlab="Global Active Power (kilowatts)")
dev.off()
