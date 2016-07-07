# Plot3.R
# Assignment1

# Exploratory Data Analysis April-May 2016
# Base Plotting System in R
# Gopal Ganapathiraju

# output plot3.png
# plot size width=480, height= 480
#plot.window(c(0,480),c(0,480))

# with (electricpower, plot(Date, Sub_metering_1, col="black",type = "l"))
# with (electricpower, plot(Date, Sub_metering_2, col="red",type = "l"))
# with (electricpower, plot(Date, Sub_metering_3, col="blue",type = "l"))
with (electricpower,plot(Date, Sub_metering_1,
                         type = "l",
                         col = "black",
                         ylab="Energy Sub Metering",
                         xlab=""  
                         )
      )
lines(electricpower$Date, electricpower$Sub_metering_2, col="red")
lines(electricpower$Date, electricpower$Sub_metering_3, col="blue")

legend("topright", 
      legend=c("Sub_meetering_1","Sub_meetering_2", "Sub_meetering_3"),
      col=c("black","red","blue"), 
      lty="solid",lwd=3
      )

dev.copy(png, "plot3.png",width=480, height=480)
dev.off()

