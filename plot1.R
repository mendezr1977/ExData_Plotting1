
#1. download file from url
#2. create data frame with complete data
#3. convert dates fields to date format: strptime() and as.date() function
#4. subset data frame for 2007-02-01 till 2007-02-02, and removing "?" missing values
#5. create the plot and generate a png file


plot1 <- function() {
        
        my_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        dest_folder <- "./ExploratoryDataAnalysis-W1 assigment/Electric_Power_Consumption.zip"
        my_csv <- "./ExploratoryDataAnalysis-W1 assigment/household_power_consumption.txt"
        if(!dir.exists("./ExploratoryDataAnalysis-W1 assigment")){
                dir.create("./ExploratoryDataAnalysis-W1 assigment/")}
        
        
        
        download.file(my_url,dest_folder)
        unzip(dest_folder,exdir="./ExploratoryDataAnalysis-W1 assigment")
        
        
        pc <- read.csv(my_csv,header = TRUE, sep = ";")
        pc[,"Date"] <- as.Date(pc$Date,format='%d/%m/%Y')
        pc <- pc[pc$Date==as.Date("2007-02-01") | pc$Date==as.Date("2007-02-02"),]
        
                
        #send plot to screen device
        hist(as.numeric(as.character(pc$Global_active_power)),col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
        
        #send plot to png device
        png(file="plot1.png")
        hist(as.numeric(as.character(pc$Global_active_power)),col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
        dev.off()
        
        x < - "plot1.png generated."
        x
        
}


