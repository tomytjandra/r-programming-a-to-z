# Integer
x <- 5L #without L -> double
typeof(x)

# Double
y <- 2.5
typeof(y)

# Complex
z <- 1 + 2i
typeof(z)

# Character
a <- "a"
typeof(a)

# Logical (T/TRUE, F/FALSE)
b <- FALSE
typeof(b)


A <- 10
B <- 5
C <- A+B
C

var1 <- 0.5
var2 <- 3
result <- var2/var1
result

ans <- sqrt(result)
ans

greeting <- "Hello"
name <- "Tom"
msg <- paste(greeting, name)
msg

# LOGICAL
# TRUE T
# FALSE F

# == !=
# < > <= >=
# !
# | &
# isTRUE(x)

# WHILE
count <- 1
while(count < 12){
  print(count)
  count <- count + 1
}

# FOR
for(i in 1:5){
  print("Hello")
}

# NORM + IF
rm(ans)
x <- rnorm(1)
if(x > 1){
  ans <- "Greater than 1"
} else {
  
  if(x >= -1) {
    ans <- "Between -1 and 1"
  } else {
    ans <- "Less than -1"
  }
  
}
ans

# HOMEWORK
 
n <- 100
counter <- 0
for (num in rnorm(n)){
  if (num >= -1 & num <= 1) {
    counter <- counter + 1
  }
}
mean <- counter/n
mean


