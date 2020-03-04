install.packages("readr")
x <- 4
class(x)
x <- c(4, "a", TRUE)
class(x)
x <- c(1,3,5)
y <- c(3,2,10)
cbind(x,y)
x <- list(2, "a", "b", TRUE)
x[[1]]
x <- 1:4
y <- 2:3
x+y
class(x+y)
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
install.packages("tidyverse")
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
max(z, z$Ozone, na.rm = TRUE)

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
which(complete.cases(w1ds))
na_vec <- which(complete.cases(w1ds$Ozone))
na_vec
w1ds_no_NA <- w1ds[na_vec,]
w1ds_no_NA
w1ds_NAomit <- na.omit(w1ds)
w1ds_NAomit
mean(w1ds_NAomit$Ozone)

w1ds[1]
w1ds[[1]]
w1ds[c(1,3), "Ozone"]

x <- list(2, "a", "b", TRUE)
x[[2]]
y <- x[[2]]
class(y)

x <- c(17, 14, 4, 5, 13, 12, 10) 
x[x>10]<-4
x[x>=11]<-4
x
max(w1ds$Ozone, na.rm = TRUE)
x <- c(1,3, 5)
y <- c(3, 2, 10)
cbind(x,y)
x <- list(2, "a", "b", TRUE)
x[[2]]
class(x[[2]])

sub <- subset(w1ds, Ozone>31)
sub
?subset
sub2 <- subset(w1ds, Temp>90)
sub2

x <- 1:4
y <- 2
x+y
w1ds[47, ]
sum(is.na(w1ds$Ozone))
mean(w1ds$Ozone, na.rm = TRUE, dims = 1)

x <- c(3, 5, 1, 10, 12, 6)
x[x < 6] == 0
x[x %in% 1:5] < 0
x[x != 6] <- 0

x[x>6] <- 0
x[x==6] <- 0
x
x[x<6] == 0
x[x<6] <- 0
x[x==0] <- 6
x

x
