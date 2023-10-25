# Exploratory analysis

# Sourcing the prep script
# Data file is 'dt'
source(here::here("Codes/01_preping-raw-data.R"))
source("Codes/01_preping-raw-data.R")

# loading library ----
library(tidyverse)

# Visual inspection
tiff(here::here("Graphs","Explor","01_explr-histogram.tiff"),
     height = 4, width = 6, units = "in", res=300)
par(mfrow=c(2,2))
for(i in 5:8){
  hist(dt[[i]], main = colnames(dt)[i], xlab=colnames(dt)[i])
}
dev.off()

?hist




