list.files(specdata)
getwd()
listfiles <- list.files("/Users/lancer/Documents/R Programming/CourseEra/specdata", full.names = TRUE)
listfiles
head(listfiles)
dat <- rbind(listfiles)
vec <- numeric()
dat
data1 <- read.csv("/Users/lancer/Documents/R Programming/CourseEra/specdata/001.csv")
data1
?options
options(max.print=10000000)
data1_2 <- rbind(data1, read.csv("/Users/lancer/Documents/R Programming/CourseEra/specdata/002.csv"))
str(data1_2)
data1_2
data2 <- read.csv("/Users/lancer/Documents/R Programming/CourseEra/specdata/002.csv")
data2
head(data1_2)
tail(data1_2)
head(data1_2)
test
filelist <- list.files("C:/Users/battl/Dropbox/Lancer/R Programming/Coursera/specdata", pattern = "*.csv", full.names=TRUE)
values <- numeric()
data <- read.csv(filelist[1])
values <- c(values, data$sulfate)
values
mean(values, na.rm = TRUE)             
pollutantmean <- function(path, pollutant, id = 1:332) {
  filelist <- list.files("/Users/lancer/Documents/R Programming/CourseEra/specdata/", pattern = "*.csv", full.names=TRUE)
  values <- numeric()
  for(i in id) {
    data <- read.csv(filelist[i])
    values <- c(values, data[[pollutant]])
  }
  mean(values, na.rm = TRUE)
}

pollutantmean("/Users/lancer/Documents/R Programming/CourseEra/specdata/", pollutant = "sulfate")

filelist
getwd()
nobs <- sum(complete.cases(read.csv("/Users/lancer/Documents/R Programming/CourseEra/specdata/001.csv")))
id <- 1
cctable <- data.frame(id, nobs)
cctable

complete <- function(directory, id = 1:332) {
  filelist <- list.files("/Users/lancer/Documents/R Programming/CourseEra/specdata/", pattern = "*.csv", full.names=TRUE)
  nobs <- numeric()
  for(i in id) {
    cc <- read.csv(filelist[i])
    nobs <- c(nobs, sum(complete.cases(cc)))
  }
  cctable <- data.frame(id, nobs)
  print(cctable)
}


source("complete.R")
source("pollutantmean.R")
complete("specdata", 1)
complete("specdata")
pollutantmean("specdata", "sulfate", 1:10)
pollutantmean("specdata", "nitrate", 70:72)
pollutantmean("specdata", "sulfate", 34)
pollutantmean("specdata", "nitrate")
cc <- complete("specdata", c(6, 10, 20, 34, 100, 200, 310))
print(cc$nobs)
cc <- complete("specdata", 54)
print(cc$nobs)
RNGversion("3.5.1")  
set.seed(42)
cc <- complete("specdata", 332:1)
use <- sample(332, 10)
print(cc[use, "nobs"])
cr <- corr("specdata")                
cr <- sort(cr)   
RNGversion("3.5.1")
set.seed(868)                
out <- round(cr[sample(length(cr), 5)], 4)
print(out)

cr <- corr("specdata", 2000)                
n <- length(cr)                
cr <- corr("specdata", 1000)                
cr <- sort(cr)
print(c(n, round(cr, 4)))

x <- read.csv("001.csv")
x
ccx <- complete.cases(x)
cc1 <- x[ccx, ]
nrow(cc1)
print(cor(cc1$nitrate, cc1$sulfate))

corr <- function(directory, threshold = 0) {
  filelist <- list.files("/Users/lancer/Documents/R Programming/CourseEra/specdata/", pattern = "*.csv", full.names=TRUE)
  dat_csv <- ldply(filelist, read_csv)
  dat_csvcc <- complete.cases(dat_csv)
  cc1 <- dat_csv[dat_csvcc, ]
  z <- data.frame()
  for (i in 1:332) {
    rowcount <- nrow(filter(cc1, ID==i))
      if(rowcount < threshold) {
        print(as.numeric(c(0)))
      } else {
        thresh <- rbind(z, filter(cc1, ID==i))
        print(cor(thresh$nitrate, thresh$sulfate))
      }
  }
  
  }

corr("specdata", 20000)

x
options(max.print = 5000000)
cc1
library(tidyverse)
dat_csv <- ldply(filelist, read_csv)
dat_csv
library(plyr)
library(readr)

library(dplyr)

cr <- corr("specdata", 129)                
cr <- sort(cr)                
n <- length(cr)    
RNGversion("3.5.1")
set.seed(197)                
out <- c(n, round(cr[sample(n, 5)], 4))
print(out)

cr <- corr("specdata", 2000)                
n <- length(cr)                
cr <- corr("specdata", 1000)                
cr <- sort(cr)
print(c(n, round(cr, 4)))
