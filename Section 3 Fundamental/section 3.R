v1 <- c(1, 2, 3)
is.numeric(v1) # TRUE
is.integer(v1) # FALSE
is.double(v1) # TRUE
# without L = not an integer

v2 <- c(1L, 2L, 3L)
is.numeric(v2) # TRUE
is.integer(v2) # TRUE
is.double(v2) # FALSE

v3 <- c("a", "b", "c", 4)
is.character(v3) # 4 -> "4"

# sequence, ':'
seq(1, 15) # start, end
1:15 # start:end
seq(1, 15, 2) # start, end, step

# replicate
rep(3, 50) # replicate the number 3, 50 times
rep(1:5, 5) # replicate vector


v1[1]
v2[1:2]
v3[c(1,3,4)]

v1[-1]
v2[-1:-2]
v3[-c(1,3,4)]
