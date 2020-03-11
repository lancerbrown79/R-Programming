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

## Make "name" column a row name
newheight <- data.frame(height, row.names = "name")
view(newheight)

library(ggplot2)

## Scatterplot x=name, y=height1
ggplot(height, aes(x = name, y = height1, las = 2)) +
  geom_point(alpha=1, color = "red")

## Change x-axis labels vertical
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

## plot multiple replicates for SSCID
ggplot(test, aes(x = SSCID, y = R1)) +
  geom_point() +
  geom_point(aes(x = SSCID, y = R2)) +
  geom_point(aes(x = SSCID, y = R3))

plot(test$SSCID)
plot(test$SSCID,test$R1)

quit(save = "default", status = 0, runLast = TRUE)

## List [[ returns element, [ returns sublist constaining specified elements
x <- list(song=1, c("a","b"), TRUE, 1 + 4i)
x
x[[2]]
x[2]
x[c(2,3)]
x[[c(2,1)]]

## $ can select element from List if names are used
x$song

## add element to a list
friends <- c("jon", "rachel")
x$sent <- friends
x
## OR
x[[sent]] <- friends

## Control Structures 
## If/Else structure

## if the symbol x is greater than 3 then you select, you set y equal to 10. If it's not greater than 3 then you set y equal to 0.
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
y

## Else clause is not necessary
if(<condition1>) {
  
}
if(<condition2>) {
  
}

## for loop (loop index is i, j, k ...) typically covers sequence in integers
x <- c("a", "b", "c", "d")


for(i in 1:10) {
  print(i)
}

## All these for loops are equivalent:
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

## for loops can be nested (difficult to understand beyond 2-3 levels)
x <- matrix(1:6, 2, 3)
x
for(i in seq_len(nrow(x))) {
  for(j in seq_len(ncol(x))) {
    print(x[i, j])
  }
}

## while loops begin by testing a condition. If it is true, then they execute loop body.
## Once loop body is executed, the condition is tested again, and so forth.
## And the basic idea is that the while takes a logical expression 
## and will execute the loop based on the value of that logical expression. 

count <- 0
while(count < 10) {
  print(count)
  count <- count + 1
}

## test multiple conditions in while loops
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

## Repeat - initiates an infinite loop, not commonly used but has it's uses
## no guarantee that it will stop
## better to set a hard limit on number of iterations (using for a loop) and then report
## whether convergence was achieved or not.
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

## Next is used to skip an iteration of a loop

for(i in 1:1000) {
  if(i <= 20) {
    ## skip the first 20 iterations
    next
  } ## do something here
}

## Return signals that a function should exit and return to a given value

## Get working directory
getwd()
## List files
list.files("/Users/lancer/Documents/R Programming/R-Programming/testdir")
## Remove directory
unlink("/Users/lancer/Documents/R Programming/R-Programming/testdir", recursive = TRUE)

## Functions
f <- function(<argument>) {
  ## Do something interesting
}

## Functions have named arguments which have potential default values

## 1. The formal arguments are the arguments included in the function definition
## 2. The formals function returns a list of all the formal arguments of a function
## 3. Not every function call in R makes use of all the formal arguments
## 4. Function arguments can be missing or might have default values

## R functions arguments can be matched positionally or by name. These are all equivalent:

mydata <- rnorm(100)
sd(mydata)
sd(x = mydata)
sd(x = mydata, na.rm = FALSE)
sd(na.rm = FALSE, x = mydata)
sd(na.rm = FALSE, mydata)

##  You can mix positional matching with matching by name. When an argument is matched by name,
## it is "taken out" of the argument list and the remaining unnamed arguments are matched in the order
## that they are listed in the function definition

args(lm)
function(formula, data, subset, weights, na.action, method = "qr", model = TRUE, x = FALSE, 
  y = FALSE, qr = TRUE, singular.ok = TRUE, contrasts = NULL, offset, ...)
  
  ## The following two calls are equivalent
  
  lm(data = mydata, y ~ x, model = FALSE, 1:100)
lm(y ~ x, mydata, 1:100, model = FALSE)

## in addition to not specifying a default value, you can also set an argument value to NULL
## Null usually means nothing there

f <- function(a, b = 1, c = 2, d = NULL) {
  
}

## Lazy evaluation
## Arguments to functions are evaluated lazily, so they are evaluated only as needed

f <- function(a, b) {
  a^2
}
f(2)

## ^^ THis function never actually uses the argument b, so calling f(2) will not produce an error
## because the 2 gets positionally matched to a.
## if 'b' is in function, it needs to be specified (below)

f <- function(a, b) {
  print(a)
  print(b)
}

f(45)

## The ... argument indicates a variable number of arguments that are usually passed on to other arguments.

myplot <- function(x, y, type = "l", ...) {
  plot(x, y, type = type, ...)
}

## Generic functions use ... so that extra arguments can be passed to methods (more later)

mean
function(x, ...)
  UseMethod("mean")

## The ... argument is necessary when the number of arguments passed to the function cannot be known in advance.

args(paste)
function(..., sep = " ", collapse = NULL)
  
  args(cat)
function(..., file = "", sep = " ", fill = FALSE,
  labels = NULL, append = FALSE)
  
  ## One catch with ... is any arguments that appear after ... on argument list must be explicitly named.
  
  args(paste)
function(..., sep = " ", collapse = NULL)
  paste("a", "b", sep = ":")
paste("a", "b", se = ":")


## Symbol Binding
## How does R know which value to assign to which symbol? How does R know what value to assign to lm? Why
## doesn't it give the value lm that is in the stats package?

lm <- function(x) { x * x }
lm

## When R assigns value to symbol, it searches through series of environments to find appropriate value.
## The order is roughly:
## 1. Search global environment (work space) for a symbol name matching one requested.
## 2. Search namespaces of each of the packages on the search list.

## Scoping rules for R are main feature to make R different from S
## 1. Scoping rules determine how a value is associated with a free variable in a function
## 2. R uses lexical scoping or static scoping. Alternative is dynamic scoping.
## 3. Related to the scoping rules is how R uses the search list to bind a value to a symbol
## 4. Lexical scoping turns out to be particularly useful for simplifying statistical computations.

f <- function(x, y) {
  x^2 + y / z
}

## Where did Z come from? It is a free variable and scoping rules determine how values are assigned to free variables

## Lexical scoping in R means that:
## The values of free variables are searched for in the environment for which the function was defined.
## A function + an environment = a closure or function closure

quit()

getwd()

str(w1ds)
library(tidyverse)

## Making data frame
names <- c("Lancer", "Kelly", "Bill")
number <- c(32, NA, 43)
day <- c(26, 15, 10)
prac <- data.frame(names, number, day)
good <- complete.cases(prac)
good
which(complete.cases(prac))
na_vec <- which(complete.cases(prac$number))
na_vec
pracnoNA <- prac[na_vec,]
pracnoNA
## Or remove NAs by
prac_NAomit <- na.omit(prac)
prac_NAomit
mean(prac_NAomit$number)

boring_function <- function(x) {
  x
}

my_mean <- function(my_vector) {
sumvec <- sum(my_vector)
lengthvec <- length(my_vector)
mean <- sumvec / lengthvec
mean
evaluate <- function(func, dat){
  eval <- func(dat)
    eval
}
  
submit()
evaluate(sd, c(1.4, 3.6, 7.9, 8.8))
evaluate(function(x){x+1}, 6)
evaluate(function(x){x[2]}, c(8, 4, 0))
  
  
remainder <- function(num, divisor = 2) {
  rem <- num %% divisor
  rem
  }
  
submit()
remainder(5)
remainder(11, 5)
remainder(divisor = 11, num = 5)
remainder(4, div = 2)
args(remainder)
  
mad_libs <- function(...){
  args <- list(...)
  place <- args[["place"]]
  adjective <- args[["adjective"]]
  noun <- args[["noun"]]
  paste("News from", place, "today where", adjective, "students took to the streets in protest of the new", noun, "being installed on campus.")
  }
  
  
"%p%" <- function(left, right){
  paste(left, right, sep = " ")
    
## Lexical scoping
    
make.power <- function(n) {
  pow <- function(x) {
    x^n
    }
  pow
  }
    
cube <- make.power(3)
square <- make.power(2)
cube(3)
square(3)
    
ls(environment(cube))
get("n", environment(cube))
ls(environment(square))
get("n", environment(square))
    
## Lexical scoping vs Dynamic scoping
y <- 10
    
f <- function(x) {
  y <- 2
  y^2 + g(x)
  }
    
g <- function(x) {
  x*y
  }

f(3)
    
## Dynamic scoping would call y value as 2, Lexical scoping looks up y in the
## environment in which the function was defined, so y = 10
## In dynamic scoping, the value of y is looked up in environment from whic the function was
## called (sometimes referred to as the calling environment), so y would be 2.
## - In R the calling environment = parent frame

## lapply: loop over a list and evaluate a function on each element
## sapply: Same as lapply but try to simplify the result
## apply: Apply a function over the margins of an array
## tapply: Apply a function over subsets of a vector
## mapply: Multivariate version of lapply

## An auxiliary function split is also useful, particularly in conjunction with lapply

## lapply takes 3 arguments 1. a list x; 2. a function (or name of a function) FUN; 3. other arguments 
## via its ... argument. If x is not a list, it will be coerced to a list using as.list.

function (X, FUN, ...) {
  FUN <- match.fun(FUN)
  if(!is.vector(X) || is.object(X))
    X <- as.list(X)
  .Internal(lapply(X, FUN))
}
<bytecode: 0x7ff7a1951c00>
<environment: namsepace:base>

## lapply always returns a list, regardless of input class
x <- list(a = 1.5, b = rnorm(10))
lapply(x, mean)

x <- list(a = 1:4, b = rnorm(10), c = rnorm(20, 1), d = rnorm(100, 5))
lapply(x, mean)    
x <- 1:4
lapply(x, runif)
x <- 1:4
lapply(x, runif, min = 0, max = 10)

## lapply and friends make heavy use of anonymous functions
x <- list(a = matrix(1:4, 2, 2), b = matrix(1:6, 3, 2))
x    
## anonymous function for extrating first column in each matrix (function doesn't have a name)
lapply(x, function(elt) elt[, 1])

## sapply will try to simplify result of lapply
## If the result is a list where every element is length 1, then a vector is returned
## If the result is a list where every element is a vector of the same length (>1) matrix is returned.
## If it can't figure things out, a list is returned.
x <- list(a = 1:4, b = rnorm(10), c = rnorm(20, 1), d = rnorm(100, 5))
sapply(x, mean)

## apply is used to evaluate a function (often anonymous) over the margins of an array
## It is most often used to apply a function to the rows or columns of matrix.
## It can be used with general arrays, e.g. taking the average of an array of matrices.
## It is not really faster than writing a loop, but it works in one line.

str(apply)
## function (X, MARGIN, FUN, ...)  X is an array, MARGIN is integer vector indicating which margins should be
## retained, FUN is a function to be applied, ... is for other arguments to be passed to FUN.

x <- matrix(rnorm(200), 20, 10)
apply(x, 2, mean) ## take mean of each column, retain columns.

apply(x, 1, sum) ## take sum of each row, retain rows.

For sums and means of matrix dimensions, we have shortcuts:

rowSums = apply(x, 1, sum)
rowMeans = apply(x, 1, mean)
colSums = apply(x, 2, sum)
colMeans = apply(x, 2, mean)

x <- matrix(rnorm(200), 20, 10)
apply(x, 1, quantile, probs = c(0.25, 0.75))

## Average matrix in an array
a <- array(rnorm(2 * 2 * 10), c(2, 2, 10))
apply(a, c(1, 2), mean)
rowMeans(a, dims = 2)

## mapply is multivariate apply of sorts which applies function in parallel
## over a set of arguments.

str(mapply)
## function (FUN, ..., MoreArgs = NULL, SIMPLIFY = TRUE, USE.NAMES = TRUE)
## FUN is a function to apply, ... contains arguments to apply over, MoreArgs is a 
## list of other arguments to FUN. SIMPLIFY indicates whether result should be simplified.
list(rep(1, 4), rep(2, 3), rep(3, 2), rep(4, 1))
instead we can:

mapply(rep, 1:4, 4:1)
noise <- function(n, mean, sd) {
  rnorm(n, mean, sd)
}
noise(5, 1, 2)
noise(1:5, 1:5, 2)
mapply(noise, 1:5, 1:5, 2)
## ^^ is same as
list(noise(1, 1, 2), noise(2, 2, 2), noise(3, 3, 2), noise(4, 4, 2), noise(5, 5, 2))

## tapply is used to apply a function over subsets of a vector.
str(tapply)
## function (X, INDEX, FUN = NULL, ..., default = NA, simplify = TRUE)
## X is a vector, INDEX is a factor or list of factors, FUN is function to be applied, 
## ... contains other arguments to be passed FUN, simplify - should we simplify result?

x <- c(rnorm(10), runif(10), rnorm(10, 1))
f <- gl(3, 10)
f
tapply(x, f, mean)
tapply(x, f, range)

## split takes a vector or other objects and splits it into groups determined by a factor
## or a list of factors. Always returns a list back.
str(split)
## function (x, f, drop = FALSE, ...) 
## x is a vector (or list) or data frame, f is a factor (or coerced to one) or a list
## of factors, drop indicates whether empty factors levels should be dropped.

x <- c(rnorm(10), runif(10), rnorm(10, 1))
f <- gl(3, 10)
split(x, f)
lapply(split(x, f), mean) ## or use tapply function which will do exact same thing.

library(datasets)
head(airquality)

s <- split(airquality, airquality$Month)
lapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")]))

sapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")]))

sapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")], na.rm = TRUE))

## Splitting on more than one level

x <- rnorm(10)
f1 <- gl(2, 5)
f2 <- gl(5, 2)
?gl
f1
f2
interaction(f1,f2)
str(split(x, list(f1, f2))) ##list(f1, f2) automatically calls interaction
str(split(x, list(f1, f2), drop = TRUE)) #drop removes empty levels created by splitting.

## Debugging

## message: generic notification produced by message function; execution of function continues.
## warning: An indication something is wrong but is not fatal; execution of function continues; 
## error: An indication that a fatal problem has occurred; execution stops; produced by the stop function
## condition: A generic concept for indication something unexpected can occcur; programmers
## can create their own conditions.

## Warning
log(-1)

printmessage <- function(x) {
  if(x>0)
    print("x is greater than zero")
  else
    print("x is less than or equal to zero")
  invisible(x)
}

printmessage(1)
printmessage(NA)

printmessage2 <- function(x) {
  if(is.na(x))
    print("x is a missing value")
  else if (x>0)
    print("x is greater than zero")
  else
    print("x is less than or equal to zero")
  invisible(x)
}

x <- log(-1)

printmessage2(x)

## Debugging questions
## What was your input? How did you call the function?
## What were you expecting?
## What did you get?
## How does what you get differ from what you were expecting?
## Were your expectations correct in the first place?
## Can you reproduce the problem (exactly)?

## Debugging tools in R
## traceback: prints out the function call stack after an error occurs; does nothing if there's no error
## debug: flags a function for "debug" mode which allows you to step through execution of a function one
## line at a time.
## browser: suspends the execution of a function wherever it is called and puts the function
## in debug mode.
## trace: allows you to insert debugging code into a function at specific places.
## recover: allows you to modify the error behavior so that you can browse the function call stack.

mean(x)
traceback()
lm(y ~ x)
n
traceback()
debug(lm)

# Recover

options(error = NULL)
read.csv("nosuchfile")
1

## Summary
## There are three main indications of problem/condition: message, warning, error
## only error is fatal
## Interactive debuggin tools traceback, debug, browser, trace, and recover can be used
## to find problematic code in functions
## Debugging tools are not a substitute for thinking!




    
    
    