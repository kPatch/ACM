# SPAM Detection Example
# Building an intuition towards prediction
install.packages("kernlab") # Install the kernlab package, take note of the quotation marks

library(kernlab)            # Use the kernlab package

data(spam)                  # Let's take a look at the data set
head(spam)

# The data in the kernlab package contains the 
# frequency of which certain words appear in an 
# e-mail

# Let's view these frequencies in a density plot
# On the x-axis: the frequency of which "your" appears
# On the y-axis: the density, the number of times that 
#             that frequency appear among the e-mails

# Let's plot the nonspam frequency line
plot(density(spam$your[spam$type=="nonspam"]),
     col="blue", main="", xlab="Frequency of 'your'")

# Let's plot the spam frequency line
lines(density(spam$your[spam$type=="spam"]), col="red")

# The cutoff, if the frequency of "your" is above 0.1 
# it's spam, else is not
# abline(v=0.1, col="black")
abline(v=0.5, col="black")

# Review of alogrithm

# Evaluation of our prediction
