# You can change your working directory according to your environment.
# e.g.: setwd("G:\\Cursos\\Coursera - Data Science\\Exploratory Data - Week 1\\assignment")

# To create the plot 1, put the "plot1.R" into your work directory and execute the following steps:
#   source("plot1.R")
#   febData <- initPlotData()
#   plot1(febData)
#   savePlot1()

initPlotData <- function()
{
  #Change locale to English
  Sys.setlocale(category = "LC_ALL", locale = "english")
  
  #Load the data. Put the data file in your work directory as you defined above.
  data<-read.csv("household_power_consumption.txt",header = TRUE,sep = ";")
  
  #Filter the date (February) 
  feb <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
  
  #Create datetime column
  feb$DateTime <- strptime(paste(feb$Date, feb$Time),"%d/%m/%Y%H:%M:%S")
  
  feb
}

plot1 <- function(data)
{
  #configure canvas to use 4 plots
  par(mfrow=c(1,1))
  
  #Convert the active power to numeric
  global_active_power <- as.numeric(gsub(",", "",data$Global_active_power))
  
  #Create the histogram fully configured
  hist(global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
}

savePlot1 <- function()
{
  #Save the pngdata
  dev.copy(png,file="plot1.png")
  
  #Close the graphic device
  dev.off()
}




