# Exploratory Data Analysis
# First project - Plot 4
# This R script will run the Feb 1 to Feb 2, 2007 period from the electric power consumption dataset and generate the 
#  fouth plot required by the assignment.
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

png( file = "plot4.png"
     , width = 480
     , height = 480
     , units = "px"
     , bg = "white"
)

#Create 2x2 matrix
par(mfrow = c(2, 2))

#Top Left
plot( DT$DateTime
      , DT$Global_active_power
      , type = "l"
      , xlab = NA
      , ylab = "Global Active Power"
)

#Top Right
plot( DT$DateTime
      , DT$Voltage
      , type = "l"
      , xlab = "datetime"
      , ylab = "Voltage"
)

#Bottom Left
plot( DT$DateTime
      , DT$Sub_metering_1
      , type = "n"
      , xlab = NA
      , ylab = "Energy sub metering"
)

points( DT$DateTime
        , DT$Sub_metering_1
        , type = "l"
        , col = "black"
)

points( DT$DateTime
        , DT$Sub_metering_2
        , type = "l"
        , col = "red"
)

points( DT$DateTime
        , DT$Sub_metering_3
        , type = "l"
        , col = "blue"
)

#legend
legend( "topright"
        , legend = c( "Sub_metering_1"
                      , "Sub_metering_2"
                      , "Sub_metering_3"
        )
        , col = c( "black"
                   , "red"
                   , "blue"
        )
        , lty = 1 
        , bty = "n"
)

#Bottom right
plot( DT$DateTime
      , DT$Global_reactive_power
      , type = "l"
      , xlab = "datetime"
      , ylab = "Global_reactive_power"
)

#Close device and generate image
dev.off()

#Clean up
rm(DT)