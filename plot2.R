# Exploratory Data Analysis
# First project - Plot 2
# This R script will run the Feb 1 to Feb 2, 2007 period from the electric power consumption dataset and generate the 
#  second plot required by the assignment.
#
# PRERREQUISITES
# household_power_consumption.txt must be in the working directory

#Read the relevant rows to a data table
dtime <- difftime(as.POSIXct("2007-02-03"), as.POSIXct("2007-02-01"),units="mins")
rowsToRead <- as.numeric(dtime)
DT <- fread("household_power_consumption.txt", skip="1/2/2007", nrows = rowsToRead, na.strings = c("?", ""))
setnames(DT, colnames(fread("household_power_consumption.txt", nrows=0)))

#Concatenate Date and Time and add it as a new column called DateTime
DT$DateTime <- as.POSIXct(paste(DT$Date,DT$Time), format="%d/%m/%Y %H:%M:%S")


png( file = "plot2.png"
     , width = 480
     , height = 480
     , units = "px"
     , bg = "white"
)

#Create the line graph
plot( DT$DateTime
      , DT$Global_active_power
      , type = "l"
      , xlab = NA
      , ylab = "Global Active Power (kilowatts)"
)

#Generate file and close device
dev.off()

#Clean up
rm(DT)