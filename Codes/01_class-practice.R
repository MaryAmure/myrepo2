####creating a histogram####

#load package----
library(here)

#here function helps to bring the file from anywhere in that project----
data<-read.csv(here("Data/raw.csv"))

#histogram of the 8th variable----
hist(data$abc_7)  hist(data [ , 8])  hist(data[[8]])

#save the output into the graphs folder----
tiff(here("Graphs/fig01_histogram.tiff"),res = 300,width=4,height=3,unit="in")
hist(data [ , 8])
dev.off()    
#or
# tiff("Graphs/fig01_histogram.tiff",res = 300,width=4,height=3,unit="in"), also works

tiff(here::here("Graphs/Explor/01_explr-histogram.tiff"),
     height = 4, width = 6, units = "in", res=300)
par(mfrow=c(3,3))
hist(dt[ , 4])
hist(dt[ , 5])
hist(dt[ , 6])
hist(dt[ , 7])
hist(dt[ , 8])
hist(dt[ , 9])
dev.off()





























































# 20201-05-01 - Meeting with statistician----





















#load package dplyr----
