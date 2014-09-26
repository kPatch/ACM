library(kernlab)
data(spam)
set.seed(333)
smallSpam <- spam[sample(dim(spam)[1], size=10),]
spamLabel <- (smallSpam$type == "spam")*1 + 1
plot(smallSpam$capitalAve, col=spamLabel)

# Prediction Rule 1
# capitalAve > 2.7 = "spam"
# capitalAve < 2.40 = "nonspam"
# We can make a rule for that outlier on the right
# capitalAve between 2.40 and 2.45 = "spam"
# captialAve between 2.45 and 2.7 = "nonspam"

rule1 <- function(x) {
  prediction <- rep(NA, length(x))
  prediction[x > 2.7] <- "spam"
  prediction[x < 2.40] <- "nonspam"
  prediction[(x >= 2.40 & x <= 2.45)] <- "spam"
  prediction[(x > 2.45 & x <= 2.70)] <- "nonspam"
  return(prediction)
}

table(rule1(smallSpam$capitalAve), smallSpam$type)
#           nonspam spam
# nonspam       5    0
# spam          0    5
# To good...

# Prediction Rule 2
# capitalAve > 2.40 = "spam"
# capitalAve <= 2.40 = "nonspam"

rule2 <- function(x) {
  prediction <- rep(NA, length(x))
  prediction[x > 2.8] <- "spam"
  prediction[x <= 2.8] <- "nonspam"
  return(prediction)
}
# So now, we'll miss that outlier within our small sample

table(rule2(smallSpam$capitalAve), smallSpam$type)

#           nonspam spam
# nonspam       5    1
# spam          0    4


# But, let's see what happens when we use the whole data set.

table(rule1(spam$capitalAve), spam$type)

table(rule2(spam$capitalAve), spam$type)

# The average number of times we got it right

# The more specific rule
sum(rule1(spam$capitalAve)==spam$type)

# The more simplistic and generalized rule
sum(rule2(spam$capitalAve)==spam$type)



#Signal and Noise
# find the signal and avoid the noise

# Prevent overfitting by not tuning it too tighlty to our training sample
