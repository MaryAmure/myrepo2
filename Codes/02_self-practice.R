## Lowest 6 values of mpg

# First,sorts mpg variable in ascending order
mpg_sorted <- sort(mtcars$mpg)

# Then, print the first 6 values
mpg_sorted[c(1:6)]
head(mpg_sorted)

# OR
head(sort(mtcars$mpg))

# OR
mtcars$mpg %>% sort() %>% head()

## Manipulating several variables in a data-set

# Categorize the continuous variable displacements in three categories with roughly 
# equal number of observations
dat <- mtcars %>% mutate(disp_cat = cut_number(disp, n=3))
table(dat$disp_cat)

# This is what I would have done. But it is easier to
# do the above (Utilize the pipe operator)
mtcars$disp_cat<- cut_number(mtcars$disp, n=3)
table(mtcars$disp_cat)

## Subsetting

# Create a data-set with cars which have more than 3 gears and variables: 
# mpg, cyl, disp, hp, and gear only
mt <- mtcars %>% select("mpg", "cyl", "disp", "hp","gear") %>% filter(gear > 3)

# OR
dat1 <- subset(mtcars, select=c("mpg","cyl","disp","hp","gear"), subset=gear>3)


## Using matrix indices and using varname
# Indexing based on position
mtcars[1, ] mtcars[[1]] mtcars[ ,2] mtcars[c(4:10), ]

# Indexing based on variable names
mtcars[ ,"mpg"] mtcars[ ,c("mpg","cyl")] mtcars[["disp"]] 

# Subsetting using indices
dat2 <- mtcars[mtcars$gear>3, c("mpg","cyl","disp","hp","gear")]


# Using dplyr (select)
dat3 <- mtcars %>% 
  select(mpg, cyl, disp, hp, gear) %>%
  filter(gear>3)

# create a data-set with only new_sp* variables and country variable from ‘who’
data(who)
names(who)
who1<- who %>% select(country,starts_with("new_sp"))
names(who1)

# create a data-set with variables starts with ‘new_sp’ and ends in a ‘4’ and 
# the country variable from ‘who’
who3<- who %>% select(country,(starts_with("new_sp") & ends_with("4")))
str(who3)

# OR
who3 <- who %>% select(country, starts_with("new_sp")) %>%
  select(country, ends_with("4"))

## Loops: useful to repeat a particular function several times
for(i in 1:5){
  print(i^2)
}
# the code above means- for numbers 1 to 5, each represented by letter i,
# print i raise to the power 2

vars <- c("drat", "hp", "wt")
for(j in vars){
  print(mean(mtcars[[j]]))
}
# you first have to define what the letter represents

vars<- mtcars %>% select(drat, hp, wt)
for(j in vars){
  print(mean(j))
}
# I understand this better

# Saving outputs of loops to an object (come back)

# using all the above functions together 
par(mfrow=c(1,2))
for(i in c("mpg","hp","disp")){
  boxplot(mtcars[[i]], main=paste("Boxplot of",i))
  qqnorm(mtcars[[i]], main=paste("QQplot of",i))
  qqline(mtcars[[i]])
}

par(mfrow=c(1,2))
vars<- mtcars %>% select(drat, hp, wt)
for(j in vars){
  boxplot(j)
  qqnorm(j)
  qqline(j)
}

par(mfrow=c(3,2))
vars<- mtcars %>% select(drat, hp, wt)
for(j in vars){
  boxplot(j)
  qqnorm(j)
  qqline(j)
}



# Example with a uni-variate linear regressions with different independent variables
uniregs <- list()
vars <- c("gear","cyl","wt")

for(i in vars){
  uniregs[[i]] <- mtcars %>% select(i,mpg) %>% lm(formula=mpg~.)
}

stargazer::stargazer(uniregs, type="text", report="vcs", ci=TRUE, omit.stat = "f", 
                     omit.table.layout = "n")




