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
x <- c(3, 5, 1, 10, 12, 6)
x[x == 0] <- 6
x[x<6] == 0
x[x <= 5] <- 0
x[x < 6] <- 0
x[x != 6] <- 0
x[x &in% 1:5] <- 0
x[x < 6] <- 0
w1ds <- read.csv("hw1_data.csv")
w1ds
w1ds nrow(2)
nrow(w1ds, 2)
w1row2 <- data.frame(nrow =2)
w1row2
head (w1ds, 2)
tail (w1ds, 2)
is.na(w1ds)
bad <- is.na(w1ds)
x[!bad]
bad
mean(w1ds, "Ozone")
mean(w1ds, Ozone)
good <- complete.cases(w1ds, Ozone)
head (w1ds)
mean (w1ds, 1)
good <- complete.cases(w1ds)
head(w1ds[good, ])
mean(good)
mean(Ozone)
mean(w1ds, Ozone)
mean(good, "Ozone")
colMeans(w1ds, na.rm = TRUE, dims = 1)
w1ds
x <- data.frame(Ozone>31)
x <- data.frame(w1ds, Ozone>31)

library(tidyverse)
x <- w1ds %>%
  select(temp)
x
y <- filter(w1ds, Ozone>31, Temp>90, Solar.R)
y
mean(y, Solar.R)
summarise(mean(Solar.R))
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
w1ds(nrows)
maxval(z, Ozone)
x <- 4L
class()
class(x)
nrow(w1ds)
x <- c(17, 14, 4, 5, 13, 12, 10)
x
x[x>10] == 4
x
x[x>4] <- 10
x[x==4]>10
head(w1ds)
head(w1ds, 2)
tail(w1ds, 2)
w1ds
w1ds %>%
  filter(Ozone, )


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
