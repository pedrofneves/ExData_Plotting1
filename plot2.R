# To create the plot 2, put the "plot1.R" and "plot2.R" files into your work directory and execute the following steps:
#   source("plot2.R")
#   febData <- initPlotData()
#   plot2(febData)
#   savePlot2()

source("plot1.R")

plot2 <- function(data)
{
  #Convert the active power to numeric
  data$Global_active_power <- as.numeric(gsub(",", "",data$Global_active_power))
  
  #Create the plot fully configured
  plot(data$DateTime, data$Global_active_power, type="l",col = "black", xlab = "", ylab = "Global Active Power (kilowatts)")
}

savePlot2 <- function()
{
  #Save the png
  dev.copy(png,file="plot2.png")
  
  #Close the graphic device
  dev.off()
}