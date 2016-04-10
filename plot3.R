# To create the plot 3, put the "plot1.R" and "plot3.R" files into your work directory and execute the following steps:
#   source("plot3.R")
#   febData <- initPlotData()
#   initPlot3()
#   plot3(febData, TRUE)
#   savePlot3()

source("plot1.R")

initPlot3 <- function()
{
  #dev.copy() cutting off legend
  png(filename = "plot3.png")
}

plot3 <- function(data, borderLegend)
{
  #Convert sub metering to numeric
  data$Sub_metering_1 <- as.numeric(gsub(",", "", data$Sub_metering_1))
  data$Sub_metering_2 <- as.numeric(gsub(",", "", data$Sub_metering_2))
  data$Sub_metering_3 <- as.numeric(gsub(",", "", data$Sub_metering_3))
  
  #Initialize the empty plot
  plot(data$DateTime,data$Sub_metering_1, type="n", xlab = "", ylab = "Energy sub metering")
  
  #Add the lines for each sub metering
  lines(data$DateTime, data$Sub_metering_1, col="black", type="l")
  lines(data$DateTime, data$Sub_metering_2, col="red",   type="l")
  lines(data$DateTime, data$Sub_metering_3, col="blue",  type="l")
  
  #Add the legend
  border <- "o"
  if(!borderLegend){
    border <- "n"
  }
  legend("topright", lty = 1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty = border)
}

savePlot3 <- function()
{
  #Save the png (dev.copy cutting off legend)
  #dev.copy(png, file="plot3.png", family="arial")
  
  #Close the graphic device
  dev.off()
}