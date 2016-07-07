# script plot1.R
#  Quiz2 (hands on Assignment1) - Base Plotting System in R
#  plot1.R
#  Exploratory Data Analysis April-May 2016
#  Gopal Ganapathiraju

# problem to solve:
# To replicate give graph plot1 (see assignment instructions)

try(dev.off(),silent=TRUE)
hist(electricpower$Global_active_power, col="red", 
     xlab="Global Active Power (Kilowatts)",ylab="Frequency",lwd=2,
     main="Global Active Power")

#title(main="Global Active Power")

dev.copy(png, "plot1.png",width=480, height=480)
dev.off()

