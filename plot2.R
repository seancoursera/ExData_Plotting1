library(dplyr)

house_p_07 <- household_power_consumption %>% filter(Date == '1/2/2007' | Date =='2/2/2007')

house_p_07$Date <- paste(house_p_07$Date, house_p_07$Time)

house_p_07$Date <- strptime(house_p_07$Date, '%d/%m/%Y %H:%M:%S')

weekday <- as.factor(weekdays(house_p_07$Date))

plot(house_p_07$Date, house_p_07$Global_active_power, 
     xlab =' ', ylab = 'Global Active Power (kilowatts)',
     type = 'n')
lines(house_p_07$Date, house_p_07$Global_active_power)

dev.copy(png, 'plot2.png')
dev.off()
