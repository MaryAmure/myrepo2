# load a base data called mtcars
data("mtcars")

# Load relevant libraries
library(tidyverse)
library(readxl)
library(here)

# Rearrange the columns such that the last column comes first
mtcars1 <- mtcars %>% select(carb, everything())

# Rearrange the colunms such that they are ordered alphabetically
mtcars2 <- mtcars %>% select(sort(colnames(mtcars)))

# %$%

# %in% is used to check whether a something is within a vector
"a" %in% c("a", "b", "c")
"carb" %in% colnames(mtcars)

# Read in relevant data
nhanes2016<-read_excel(here("Data/nhanes_10_16.xlsx"), sheet = "nhanes2016")
nhanes2014<-read_excel(here("Data/nhanes_10_16.xlsx"), sheet = "nhanes2014")
nhanes2012<-read_excel(here("Data/nhanes_10_16.xlsx"), sheet = "nhanes2012")
nhanes2010<-read_excel(here("Data/nhanes_10_16.xlsx"), sheet = "nhanes2010")

# Select certain columns from each dataset
nhanes10 <- nhanes2010 %>% select(SEQN, ends_with("CTC"))  
nhanes12 <- nhanes2012 %>% select(SEQN, ends_with("CTC"))          
nhanes14 <- nhanes2014 %>% select(SEQN, ends_with("CTC"))          
nhanes16 <- nhanes2016 %>% select(SEQN, ends_with("CTC"))          

# Combine the new datasets into 1 (N.B rbind is not the best binder coz it doesn't 
# consider whether or not the columns match)
nhaness <- bind_rows(nhanes10, nhanes12, nhanes14, nhanes16)



check_vars <- function(data1,data2,id_var){
  if(!(is.data.frame(data1) & is.data.frame(data1))){
    stop("only works with dataframes")
  }
  overlapping_colunm= identical(names(data1), names(data2))
  overlapping_row=length(data1[[id_var]] %in% data2[[id_var]])
  return(list("Are the column names same?"= overlapping_colunm,
              "How maany pple are overlapping?"= overlapping_row))
}




