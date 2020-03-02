install.packages("readr")
x <- -4
class(x)
x <- c(4, "a", TRUE)
class(x)
x <- c(1,3,5)
y <- c(2,4,6)
cbind(x,y)
x <- list(2, "a", "b", TRUE)
x[[1]]
x <- 1:4
y <- 2:3
x+y

w1ds <- read.csv("hw1_data.csv")
w1ds
sum(is.na(w1ds$Ozone))
head (w1ds, 2)
tail (w1ds, 2)
is.na(w1ds)
head(w1ds)
good <- complete.cases(w1ds)
good

colMeans(w1ds, na.rm = TRUE, dims = 1)
w1ds

library(tidyverse)
y <- filter(w1ds, Ozone>31, Temp>90, Solar.R)
y
summarise(y, mean(Solar.R))

z <- w1ds %>%
  select(Temp, Month)
z 
z1 <- filter(z, Month == 6)
z1
summarise(z1, mean(Temp))
z <- w1ds %>%
  select(Ozone, Month) %>%
  filter(Month == 5)
z
x <- 4L
class()
class(x)
nrow(w1ds)

w1ds
x <- c(4, TRUE)
x
class(x)
x <- c(1,3,5)
y <- c(3, 2, 10)
rbind(x,y)
class(x)
x <- 1:4
y <- 2
w1ds[47,]

sum(is.na(w1ds$Ozone))
colMeans(w1ds, na.rm = TRUE, dims = 1)


head(w1ds)
tail(w1ds)
good <- complete.cases(w1ds)
good
which(!complete.cases(w1ds))
na_vec <- which(!complete.cases(w1ds))
na_vec
w1ds_no_NA <- w1ds[-na_vec,]
w1ds_no_NA
w1ds_NAomit <- na.omit(w1ds)
w1ds_NAomit
mean(w1ds_NAomit$Ozone)
