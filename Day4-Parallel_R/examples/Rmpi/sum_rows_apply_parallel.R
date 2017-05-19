# Simply summation of Matrix rows
library(parallel)
library(microbenchmark)

ncores = detectCores()
print(ncores)

cl <- makeCluster(ncores)

nrows <- 1000
M <- matrix(1:nrows^2, nrow = nrows, ncol = nrows)

microbenchmark(parApply(M, 1, sum, cl=cl), mclapply(M, sum, mc.cores=ncores), times=10)

stopCluster(cl)

## better

parsumrows <- function(M, ncores) {
  cl <- makeCluster(ncores)
  parApply(M, 1, sum, cl=cl)
  stopCluster(cl)
}

microbenchmark(parsumrows(M, ncores), mclapply(M, sum, mc.cores=ncores), times=10)