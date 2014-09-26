# install and load the ggplot package
install.packages("ggplot2", dependencies = TRUE)
library(ggplot2)

# install and load a color package
install.packages("RColorBrewer", dependencies = TRUE)
library(RColorBrewer)

# load the diamonds data set
data(diamonds)

# create scatterplot of price vs carat color by diamond cuts
qplot(data = diamonds, x = carat, y = price, color = cut) +
  scale_color_brewer(palette = "Accent")

