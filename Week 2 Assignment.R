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

complete("/Users/lancer/Documents/R Programming/CourseEra/specdata/", 1:2)












