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












