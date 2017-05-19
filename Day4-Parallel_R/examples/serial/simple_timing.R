# Simple timing
library(microbenchmark)
mean1 <- function(x) mean(x)
mean2 <- function(x) sum(x) / length(x)
n <- 100000000
microbenchmark(mean1(n), mean2(n))

