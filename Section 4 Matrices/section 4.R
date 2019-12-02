# matrix
matrix(data = 1:20, nrow = 5, byrow = TRUE)

# rbind
v1 <- c(1,2,3)
v2 <- c("a", "b", "c")
rbind(v1, v2)

# cbind
cbind(v1, v2)
# numeric cast into character, because matrix must only contain 1 data type



# NAMING VECTOR
A <- 1:5

names(A) <- c("satu", "dua", "tiga", "empat", "lima")
A

A[1] == A["satu"] # access named vector

names(A) <- NULL # delete vector name
A

# NAMING MATRIX
temp <- rep(c("a", "b", "c"), each = 3)
B <- matrix(temp, nrow = 3)
rownames(B) <- c("row1", "row2", "row3")
B
colnames(B) <- c("col1", "col2", "col3")
B

B["row1", "col2"] == B[1,2]



# OPERATIONS
round(FieldGoals/Games, 2)
round(MinutesPlayed/Games, 2)



# MATPLOT
FGpG <- t(FieldGoals/Games)
matplot(FGpG,
        type = "b",
        pch = 15:18,
        col = c(1:4, 6))
legend("bottomleft",
       inset = 0.01,
       legend = Players,
       pch = 15:18,
       col = c(1:4, 6),
       horiz = FALSE
       )



# SUBSETTING
x <- c("u", "v", "w", "x", "y", "z")
x[c(1:2)]

Games[1:2, 3:4]
Games[c(1,10), ]
Games[ ,c("2008", "2009")]

Games[1, ] # this is vector, not matrix
is.matrix(Games[1, ])
is.vector(Games[1, ])

Games[1, ,drop = FALSE] # this is matrix, not vector
is.matrix(Games[1, ,drop = FALSE])
is.vector(Games[1, ,drop = FALSE])



# VISUALIZING SUBSET
data1 <- t(MinutesPlayed[1:4, ])
data2 <- t(MinutesPlayed[1, ,drop=FALSE])
data <- data2 # data1 or data2
matplot(data,
        type = "b",
        pch = 15:18,
        col = c(1:4, 6))
legend("bottomleft",
       inset = 0.01,
       legend = colnames(data),
       pch = 15:18,
       col = c(1:4, 6),
       horiz = FALSE
)



# FUNCTION
myplot <- function(matrix, rows=1:10){
  data <- t(matrix[rows, ,drop=FALSE])
  matplot(data,
          type = "b",
          pch = 15:18,
          col = c(1:4, 6))
  legend("bottomleft",
         inset = 0.01,
         legend = colnames(data),
         pch = 15:18,
         col = c(1:4, 6),
         horiz = FALSE
  )
}

myplot(Games, 1)
myplot(MinutesPlayed, 1:5)
myplot(Salary)
myplot(MinutesPlayed/Games)