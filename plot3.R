library(dplyr)

house_p_07 <- household_power_consumption %>% filter(Date == '1/2/2007' | Date =='2/2/2007')

house_p_07$Date <- paste(house_p_07$Date, house_p_07$Time)

house_p_07$Date <- strptime(house_p_07$Date, '%d/%m/%Y %H:%M:%S')

plot(house_p_07$Date, house_p_07$Sub_metering_1,
     xlab = '', ylab ='Energy sub metering',
     type = 'n')

lines(house_p_07$Date, house_p_07$Sub_metering_1)
lines(house_p_07$Date, house_p_07$Sub_metering_2, col = 'red')
lines(house_p_07$Date, house_p_07$Sub_metering_3, col = 'blue')

legend('topright', legend = c('Sub_metering_1       ',  'Sub_metering_2        ','Sub_metering_3        ' ), 
       lwd=c(1,1,1),col=c("black","red", 'blue'))   

dev.copy(png, 'plot3.png')
dev.off()