plot3 <- function (){
  library("stringr")
  library("dplyr");
  
  data <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors=FALSE, na.strings = "?");
  
  data$Date <- as.Date(data$Date, "%d/%m/%Y");
  
  filtered <- filter(data, Date == "2007-02-01" | Date == "2007-02-02");
  
  filtered$Time <- as.POSIXct(paste(filtered$Date, filtered$Time), format = "%Y-%m-%d %H:%M:%S");
  
  png(file = "plot3.png");
  
  plot(y = filtered$Sub_metering_1, x = filtered$Time, xlab = "", ylab = "Energy sub metering", type = "l");
  lines(y = plot2data$Sub_metering_2, x = plot2data$Time, col = "red");
  lines(y = plot2data$Sub_metering_3, x = plot2data$Time, col = "blue");
  
  legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty=1);
  
  dev.off();
  
  return("plot3 created")
}