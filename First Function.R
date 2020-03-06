add2 <- function(x, y) {
  x + y
}
add2(3,5)

above10 <- function(x) {
  use <- x > 10
  x[use]
}

above <- function(x, n) {
  use <- x > n
  x[use]
}

x <- 1:20
above (x, 12)

above10v2 <- function(x, n = 10) {
  use <- x > n
  x[use]
}

above10v2(x)

# arguments can be either x or y (doesn't matter)
columnmean <- function(y, removeNA = TRUE) {
  nc <- ncol(y)
  means <- numeric(nc)
  for(i in 1:nc) {
    means[i] <- mean(y[, i], na.rm = removeNA)
  }
  means   
}

columnmean(airquality)

## Broken down
columnmean(airquality, FALSE)
nc <- ncol(airquality)
numeric(nc)
means <- numeric(nc)
means
for(i in 1:nc) {
  means[i] <- mean(airquality[, i], na.rm = TRUE)
}
means

ncol(airquality)

