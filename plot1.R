# Exploratory Data Analysis
# First project - Plot 1
# This R script will run the Feb 1 to Feb 2, 2007 period from the electric power consumption dataset and generate the 
#  first plot required by the assignment.
#
# PRERREQUISITES
# household_power_consumption.txt must be in the working directory

#Read the relevant rows to a data table
dtime <- difftime(as.POSIXct("2007-02-03"), as.POSIXct("2007-02-01"),units="mins")
rowsToRead <- as.numeric(dtime)
DT <- fread("household_power_consumption.txt", skip="1/2/2007", nrows = rowsToRead, na.strings = c("?", ""))
setnames(DT, colnames(fread("household_power_consumption.txt", nrows=0)))

png( file = "plot1.png"
     , width = 480
     , height = 480
     , units = "px"
     , bg = "white"
)

hist( DT$Global_active_power
      , col = "Red"
      , xlab = "Global Active Power (kilowatts)"
      , main = "Global Active Power"
)

dev.off()

rm(DT)
