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