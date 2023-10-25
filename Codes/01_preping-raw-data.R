# Preparing the raw data

# Loading libraries----
library(here)

# Importing data----
# Raw data needs to be prepared before analysis
dt <- read.csv(here("Data","raw.csv"))               

# 20201-05-01 - Meeting with statistician----
# The first column is serial number, should remove it
colnames(dt)

dt$X <- NULL

# abc_1, 2, 3 should be categorized
dt$abc_1 <- cut(dt$abc_1, breaks=c(10,0,-10),
                include.lowest = TRUE)

dt$abc_2 <- cut(dt$abc_2, breaks=c(5,0,-5),
                include.lowest = TRUE)

dt$abc_3 <- cut(dt$abc_3, breaks=c(2,0,-3),
                include.lowest = TRUE)

# abc_4,5,6 should be re-centered to mean 20, 15, 6
dt$abc_4 <- dt$abc_4+20
dt$abc_5 <- dt$abc_4+15
dt$abc_6 <- dt$abc_4+6

