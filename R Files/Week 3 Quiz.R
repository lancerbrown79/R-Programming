library(datasets)
data(iris)
?iris
tapply(iris$Sepal.Length, iris$Species, mean)
lapply(iris$Sepal.Length, mean)
head(iris)
apply(iris[, 1:4], 2, mean)
data(mtcars)
?mtcars
apply(mtcars, 2, mean)
split(mtcars, mtcars$cyl)
mean(mtcars$mpg, mtcars$cyl)
sapply(mtcars, cyl, mean)
sapply(split(mtcars$mpg, mtcars$cyl), mean)
lapply(mtcars, mean)
tapply(mtcars$cyl, mtcars$mpg, mean)
tapply(mtcars$mpg, mtcars$cyl, mean)
with(mtcars, tapply(mpg, cyl, mean))
tapply(mtcars$hp, mtcars$cyl, mean)
debug(ls)
ls()
