
# plot2.R
# Quiz4 (hands on assignment2)
# Exploratory Data Analysis April-May, 2016
# Gopal Ganapathiraju
# Assignment2

# problem to solve:
#   To replicate the given graph plot2 (see assignment instructions)

plot(electricpower$Date, electricpower$Global_active_power,
    type = "l",
    xlab ="",
    ylab = "Global Active Power (kilowatts)")





dev.copy(png, "plot2.png",width=480, height=480)
dev.off()
