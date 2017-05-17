# Simply summation of Matrix rows
library(parallel)
library(microbenchmark)

#ncores = detectCores()
ncores = 4
print(ncores)

cl <- makeCluster(ncores)

nrows <- 10
M <- matrix(1:nrows^2, nrow = nrows, ncol = nrows)

microbenchmark(parApply(M, 1, sum, cl=cl), times=10)

print(parApply(M, 1, sum, cl=cl))


stopCluster(cl)

