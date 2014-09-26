# Get help information on 
?mean
# Create a vector with ( create a list from 0 - 10 ) and 10
x <- c(0:10, 50)
# Print x
x
# Get the mean of the values and assign it to xm
xm <- mean(x)
# Print xm
xm

c(xm, mean(x, trim = 0.10))
