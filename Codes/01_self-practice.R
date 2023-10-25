# install and load relevant library and data
install.packages("gapminder")
library(gapminder)
data(gapminder)

# explore the data----
str(gapminder) "its a long format data"
head(gapminder)
tail(gapminder)

# save the data into codes subfolder in MyFavouriteProject folder----
write.csv(gapminder, "Codes/gap.csv")
# or save it into MyFavouriteProject folder
write.csv(gapminder, "gap.csv")

# load the data into the environment
gap<-read.csv("Codes/gap.csv")

# load library
library(tidyverse)

# pipes- helpful to take the output from a function and pass it to another function
g1 <- gap$year
g2 <- mean(g1)
g3 <- round(g2, digits = 0)

gap$year %>% mean() %>% round(0)

# select- helpful to selcect specific columns
g4 <- gap %>% select(country, continent, year)
g5 <- gap %>% select(starts_with("c"), ends_with("r"))
g6 <- gap %>% select(everything())
g7 <- gap %>% select(last_col())
g7a <- gap  %>% select(-[[2]])"and so much more ?select"

# filter- helpful to select specific rows
g8 <- gap %>% filter(continent == "Asia")
g9 <- gap %>% filter(continent == c("Asia", "Africa", "Europe"))
g10 <- gap %>% filter(continent %in% c("Asia", "Africa", "Europe"))
g11 <- gap %>% filter(continent == "Asia" & year < 1970)

# arrange
g12 <- gap %>% arrange(year)
g13 <- gap %>% arrange(year, lifeExp)

# group
g14 <- gap %>% group_by(continent) %>% count()
g15 <- gap %>% group_by(continent, country) %>% count()

# summarize
g16 <- gap %>% group_by(continent) %>% summarise_at(.vars = "lifeExp", .funs= "mean")
g17 <- gap %>% group_by(continent) %>% summarise_at(.vars = c("lifeExp","pop"), .funs= "mean")
g17 <- gap %>% group_by(continent) %>% summarise_at(.vars = c("lifeExp","pop"), .funs= c("mean","median"))




