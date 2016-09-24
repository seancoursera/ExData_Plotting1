library(dplyr)

house_p_07 <- household_power_consumption %>% filter(Date == '1/2/2007' | Date =='2/2/2007')

house_p_07$Date <- paste(house_p_07$Date, house_p_07$Time)

house_p_07$Date <- strptime(house_p_07$Date, '%d/%m/%Y %H:%M:%S')

hist(round(as.numeric(house_p_07$Global_active_power), 1), 
     xlab = 'Global Active Power(kilowatts)', ylab = 'Frequency',
     main = 'Global Active Power', col = 'red')

dev.copy(png, 'plot1.png')
dev.off()
