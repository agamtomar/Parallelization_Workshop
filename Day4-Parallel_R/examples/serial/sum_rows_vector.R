library(microbenchmark)

nrows <- 10
M <- matrix(1:nrows^2, nrow = nrows, ncol = nrows)


sumrows1 <- function(M, nrows) { 
  s <- c(nrows)
  for (i in 1:nrows) 
    s[i] = sum(M[i, ])
  return(s)
}

sumrows2 <- function(M) { 
  rowSums(M)
}

microbenchmark(sumrows1(M, nrows), sumrows2(M))

print(sumrows1(M, nrows))
print(sumrows2(M))
