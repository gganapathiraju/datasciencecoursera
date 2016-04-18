#script  plot4.R
# Assignment(Course Project) 1
# Exploratory Data Analysis, April-May, 2016
# Gopal Ganapathiraju
#

# Problem to solve:
#  To replicate the given plot (plot4) of the assignment


par(mfrow=c(2,2))
with(electricpower, plot(Date, Global_active_power,
                         type="l",
                         ylab="Global Active Power",
                         xlab=""
                         )
    )
with(electricpower, plot(Date, Voltage,
                         type="l",
                         ylab="Voltage",
                         xlab="datetime"
                        )
    )
with(electricpower, plot(Date, Sub_metering_1,
                         type="l",
                         ylab= "Energy Sub Metering",
                         xlab=""
                         )
    )
lines(electricpower$Date, electricpower$Sub_metering_2, col="red")
lines(electricpower$Date, electricpower$Sub_metering_3, col="blue")

legend("topright",
      legend=c("Sub_meetering_1","Sub_meetering_2", "Sub_meetering_3"),
      col=c("black","red","blue"),
      lty="solid",lwd=3, 
      cex=0.8  #  to reduce the font size of text 
               #  so that it does not occlude the graph
      )
with(electricpower, plot(Date, Global_reactive_power,
                         type="l",
                         ylab="Global Reactive Power",
                         xlab="datetime"
                        )
     )
par(mfrow=c(1,1), cex=1)
dev.copy(png, "plot4.png", width=480, height=480)
dev.off()

