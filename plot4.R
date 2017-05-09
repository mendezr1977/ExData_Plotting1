
#1. download file from url
#2. create data frame with complete data
#3. convert dates fields to date format: strptime() and as.date() function
#4. subset data frame for 2007-02-01 till 2007-02-02, and removing "?" missing values
#5. create the plot and generate a png file


plot4 <- function() {
        
        my_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        dest_folder <- "./ExploratoryDataAnalysis-W1 assigment/Electric_Power_Consumption.zip"
        my_csv <- "./ExploratoryDataAnalysis-W1 assigment/household_power_consumption.txt"
        if(!dir.exists("./ExploratoryDataAnalysis-W1 assigment")){
                dir.create("./ExploratoryDataAnalysis-W1 assigment/")}
        
        
        
        download.file(my_url,dest_folder)
        unzip(dest_folder,exdir="./ExploratoryDataAnalysis-W1 assigment")
        
        
        pc <- read.csv(my_csv,header = TRUE, sep = ";")
        pc[,"Date"] <- as.Date(pc$Date,format='%d/%m/%Y')
        #pc[,"Time"] <- as.Date(strptime(paste(pc$Date, pc$Time,sep = ":"),format='%Y-%m-%d:%H:%M:%S'))
        pc <- pc[pc$Date==as.Date("2007-02-01") | pc$Date==as.Date("2007-02-02"),]
        
        
        #expose plot to window device
        par(mfrow = c(2,2))
        plot(strptime(paste(pc$Date, pc$Time,sep = ":"),format='%Y-%m-%d:%H:%M:%S'),as.numeric(as.character(pc$Global_active_power)), type = "l", xlab = "", ylab = "Gloabl Active Power (kilowatts)")
        
        plot(strptime(paste(pc$Date, pc$Time,sep = ":"),format='%Y-%m-%d:%H:%M:%S'),as.numeric(as.character(pc$Voltage)), type = "l", ylab = "Voltage", xlab= "datetime")
        
        plot(strptime(paste(pc$Date, pc$Time,sep = ":"),format='%Y-%m-%d:%H:%M:%S'),as.numeric(as.character(pc$Sub_metering_1)), type = "l", ylab = "Energy sub metering", xlab = "")
        lines(strptime(paste(pc$Date, pc$Time,sep = ":"),format='%Y-%m-%d:%H:%M:%S'),as.numeric(as.character(pc$Sub_metering_2)), col ="red")
        lines(strptime(paste(pc$Date, pc$Time,sep = ":"),format='%Y-%m-%d:%H:%M:%S'),as.numeric(as.character(pc$Sub_metering_3)), col ="blue")
        legend("topright",  lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        
        plot(strptime(paste(pc$Date, pc$Time,sep = ":"),format='%Y-%m-%d:%H:%M:%S'),as.numeric(as.character(pc$Global_reactive_power)), type = "l", ylab = "Global_reactive_power", xlab = "datetime")
        
        
        #send plot to png device
        png(file="plot4.png")
        
        par(mfrow = c(2,2))
        
        plot(strptime(paste(pc$Date, pc$Time,sep = ":"),format='%Y-%m-%d:%H:%M:%S'),as.numeric(as.character(pc$Global_active_power)), type = "l", xlab = "", ylab = "Gloabl Active Power (kilowatts)")
        
        plot(strptime(paste(pc$Date, pc$Time,sep = ":"),format='%Y-%m-%d:%H:%M:%S'),as.numeric(as.character(pc$Voltage)), type = "l", ylab = "Voltage", xlab= "datetime")
        
        plot(strptime(paste(pc$Date, pc$Time,sep = ":"),format='%Y-%m-%d:%H:%M:%S'),as.numeric(as.character(pc$Sub_metering_1)), type = "l", ylab = "Energy sub metering", xlab = "")
        lines(strptime(paste(pc$Date, pc$Time,sep = ":"),format='%Y-%m-%d:%H:%M:%S'),as.numeric(as.character(pc$Sub_metering_2)), col ="red")
        lines(strptime(paste(pc$Date, pc$Time,sep = ":"),format='%Y-%m-%d:%H:%M:%S'),as.numeric(as.character(pc$Sub_metering_3)), col ="blue")
        legend("topright",  lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        
        plot(strptime(paste(pc$Date, pc$Time,sep = ":"),format='%Y-%m-%d:%H:%M:%S'),as.numeric(as.character(pc$Global_reactive_power)), type = "l", ylab = "Global_reactive_power", xlab = "datetime")
        
        dev.off()
        
        x <- "plot4.png generated."
        x
        
}


