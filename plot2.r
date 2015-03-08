hpc<- read.table("household_power_consumption.txt", header = TRUE,sep=";",na.strings ='?')
hpc_subset<-hpc[hpc$Date=='1/2/2007' | hpc$Date=='2/2/2007',]

hpc_subset$Date = as.Date(hpc_subset$Date, "%d/%m/%Y")
hpc_subset$DateTime = strptime(paste(hpc_subset$Date, hpc_subset$Time), format="%Y-%m-%d %H:%M:%S")
clean_data<- hpc_subset
png(file = paste(getwd(),"/plot2.png",sep=""),width=480,height=480,units="px")
par(mfrow = c(1,1))
plot(x=clean_data$DateTime,y=clean_data$Global_active_power,type='l',ylab ="Global Active Power(kilowatts)",xlab=" ")
dev.off()