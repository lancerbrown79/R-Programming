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






























