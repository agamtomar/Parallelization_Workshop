# Simply summation of Matrix rows
library(parallel)
library(microbenchmark)

# serial calculation

nrows <- 240000
M <- matrix(1:nrows^2, nrow = nrows, ncol = nrows)

sumrows.serial <- function(M) { 
  rowSums(M)
}

ncores = 24
timings = numeric(ncores)


timings[1] = mean(microbenchmark(sumrows.serial(M), times=10)[,2])

# strong scaling parallel on a summit node with 24 cores
for (i in 2:ncores) {
    sprintf("running on %d cores", i)
    cl <- makeCluster(i)
    timings[i] <- mean(microbenchmark(parApply(M, 1, sum, cl=cl), times=10)[,2])
    stopCluster(cl)
}

print(timings)

