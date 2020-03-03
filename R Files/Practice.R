install.packages("tidyverse")
library(tidyverse)
view(starwars)
starwars %>%
  select(gender, mass, height, species) %>% 
  filter(species == "Human") %>% 
  na.omit() %>% 
  mutate(height = height /100) %>% 
  mutate(BMI = mass / height^2) %>% 
  group_by(gender) %>% 
  summarise(Average_BMI = mean(BMI))

height <- starwars %>% 
  select(name, height) %>% 
  mutate(height1 = height) %>% 
  mutate(height2 = height, height3 = height) %>% 
  mutate(height4 = height) %>% 
  select(name, height1, height2, height3, height4)
view(height)

#Make "name" column a row name
newheight <- data.frame(height, row.names = "name")
view(newheight)

library(ggplot2)

#Scatterplot x=name, y=height1
ggplot(height, aes(x = name, y = height1, las = 2)) +
  geom_point(alpha=1, color = "red")

#Change x-axis labels vertical
ggplot(height, aes(x = name, y = height1)) +
  geom_point(alpha=1, color = "red")+
  theme(axis.text.x = element_text(angle = 90))

view(iris)
library(ggplot2)
library(dplyr)
library(tidyverse)
view(iris)
plot(iris$Species,iris$Petal.Length)

test <- read.csv("NewRepository.csv", header = TRUE)

view(test)

#plot multiple replicates for SSCID
ggplot(test, aes(x = SSCID, y = R1)) +
  geom_point() +
  geom_point(aes(x = SSCID, y = R2)) +
  geom_point(aes(x = SSCID, y = R3))
  
plot(test$SSCID)
plot(test$SSCID,test$R1)

quit(save = "default", status = 0, runLast = TRUE)

# List [[ returns element, [ returns sublist constaining specified elements
x <- list(song=1, c("a","b"), TRUE, 1 + 4i)
x
x[[2]]
x[2]
x[c(2,3)]
x[[c(2,1)]]

# $ can select element from List if names are used
x$song

# add element to a list
friends <- c("jon", "rachel")
x$sent <- friends
x
# OR
x[[sent]] <- friends

## Control Structures 
## If/Else structure

#if the symbol x is greater than 3 then you select, you set y equal to 10. If it's not greater than 3 then you set y equal to 0.
if(x>3) {
  y <-10
} else {
  y <- 0
}

y <- if(x > 3) {
  10
} else {
  0
}

# Else clause is not necessary
if(<condition1>) {
  
}
if(<condition2>) {
  
}

# for loop (loop index is i, j, k ...) typically covers sequence in integers
x <- c("a", "b", "c", "d")


for(i in 1:10) {
  print(i)
}

# All these for loops are equivalent:
for(i in 1:4) {
  print(x[i])
}

for(i in seq_along(x)) {
  print(x[i])
}

for(letter in x) {
  print(letter)
}

for(i in 1:4) print(x[i])

# for loops can be nested (difficult to understand beyond 2-3 levels)
x <- matrix(1:6, 2, 3)
x
for(i in seq_len(nrow(x))) {
  for(j in seq_len(ncol(x))) {
    print(x[i, j])
  }
}

# while loops begin by testing a condition. If it is true, then they execute loop body.
# Once loop body is executed, the condition is tested again, and so forth.
#And the basic idea is that the while takes a logical expression 
#and will execute the loop based on the value of that logical expression. 

count <- 0
while(count < 10) {
  print(count)
  count <- count + 1
}

#test multiple conditions in while loops
z <- 5
while(z >= 3 && z <= 10) {
  print(z)
  coin <- rbinom(1, 1, 0.5)
  if(coin == 1) { ##random walk
    z <- z + 1
  } else {
      z <- z - 1
    }
}

?rbinom

# Repeat - initiates an infinite loop, not commonly used but has it's uses
# no guarantee that it will stop
# better to set a hard limit on number of iterations (using for a loop) and then report
# whether convergence was achieved or not.
x0 <- 1
tol <- 1e-8

repeat {
  x1 <- computeEstimate()
  if (abs(x1 - x0) < tol) {
    break
  } else {
    x0 <- x1
  }
}

# Next is used to skip an iteration of a loop

for(i in 1:1000) {
  if(i <= 20) {
    ## skip the first 20 iterations
    next
  } ## do something here
}

# Return signals that a function should exit and return to a given value








