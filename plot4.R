# To create the plot 3, put the "plot1.R", "plot2.R", "plot3.R" and "plot4.R" files into 
# your work directory and execute the following steps:
#   source("plot4.R")
#   febData <- initPlotData()
#   initPlot4()
#   plot4(febData)
#   savePlot4()

source("plot1.R")
source("plot2.R")
source("plot3.R")

plotReactivePower <- function(data)
{
  #Convert the active power to numeric
  data$Global_reactive_power <- as.numeric(gsub(",", "",data$Global_reactive_power))
  
  #Create the plot fully configured
  plot(data$DateTime, data$Global_reactive_power, type="l", col = "black", xlab = "datetime", ylab = "Global_reactive_power")
}

plotVoltage <- function(data)
{
  #Convert the active power to numeric
  data$Voltage <- as.numeric(gsub(",", "",data$Voltage))
  
  #Create the plot fully configured
  plot(data$DateTime, data$Voltage, type="l", col = "black", xlab = "datetime", ylab = "Voltage")
}

initPlot4 <- function(data)
{
  #dev.copy() cutting off legend
  png(file = "plot4.png")
}

plot4 <- function(data)
{
  #configure canvas to use 4 plots
  par(mfrow=c(2,2))
  
  plot2(data)
  
  plotVoltage(data)
  
  plot3(data, FALSE)

  plotReactivePower(data)
}

savePlot4 <- function()
{
  #Save the png (dev.copy() cutting off legend)
  #dev.copy(png,file="plot4.png")
  
  #Close the graphic device
  dev.off()
}


