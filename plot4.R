library(dplyr)

house_p_07 <- household_power_consumption %>% filter(Date == '1/2/2007' | Date =='2/2/2007')

house_p_07$Date <- paste(house_p_07$Date, house_p_07$Time)

house_p_07$Date <- strptime(house_p_07$Date, '%d/%m/%Y %H:%M:%S')

par(mfrow = c(2,2))

#1
plot(house_p_07$Date, house_p_07$Global_active_power, 
     xlab =' ', ylab = 'Global Active Power (kilowatts)',
     type = 'n')
lines(house_p_07$Date, house_p_07$Global_active_power)

#2
plot(house_p_07$Date, house_p_07$Voltage,
     xlab = 'datetime', ylab ='Voltage', type = 'n')
lines(house_p_07$Date, house_p_07$Voltage)

#3
plot(house_p_07$Date, house_p_07$Sub_metering_1,
     xlab = '', ylab ='Energy sub metering',
     type = 'n')

lines(house_p_07$Date, house_p_07$Sub_metering_1)
lines(house_p_07$Date, house_p_07$Sub_metering_2, col = 'red')
lines(house_p_07$Date, house_p_07$Sub_metering_3, col = 'blue')

legend('topright', legend = c('Sub_metering_1       ',  'Sub_metering_2        ','Sub_metering_3        ' ), 
       lwd=c(1,1,1),col=c("black","red", 'blue'))   

#4
plot(house_p_07$Date, house_p_07$Global_reactive_power,
     xlab = 'datetime', ylab ='Global_reactive_power',
     type = 'n')
lines(house_p_07$Date, house_p_07$Global_reactive_power)

dev.copy(png, 'plot4.png')
dev.off()
