# File name: mcpi_rmpi.r
# Description: Calculate pi using Monte Carlo (Rmpi)
# Run: Rscript pi_rmpi.r

# Load the Rmpi library
library(Rmpi)
library(rlecuyer)

approx.pi <- function(n) {
  # approximates pi via MC integration of unit disk
  RNGkind("L'Ecuyer-CMRG")
  set.seed(1.0)

  x <- runif(n, min = -1, max = 1)
  y <- runif(n, min = -1, max = 1)
  V <- 4
  f_hat <- ifelse(x^2 + y^2 <= 1, 1, 0)
  as.double(V * sum(f_hat) / n)
}


#problem size (number of points)
npts <- 1E7

#cluster size 
ncores <- 10

time.start = Sys.time()
npts.core <- npts  # points per core

cat('running parallel version with n.pts = ',npts,' and ncores = ',ncores,' (',npts.core,' pts per core) \n')

#start up and initialize the cluster
mpi.spawn.Rslaves(nslaves = ncores-1)

# Start timer for compute time
tm.comp.st = Sys.time()

# Send variables to workers
mpi.bcast.Robj2slave(npts)
mpi.bcast.Robj2slave(approx.pi)

# Call approx.pi() on slaves
mpi.bcast.cmd(result <- approx.pi(npts))
# Call on master
result <- approx.pi(npts)

# Use mpi.reduce() to total across all processes
# Have to do in two steps to avoid MPI hang
mpi.bcast.cmd(mpi.reduce(result, type=2, op="sum") ) #Slaves
result <- mpi.reduce(result, type=2, op="sum")      #Master

pi.approx <- result / ncores

cat('     pi estimate = ', pi.approx,'\n')

pi.err = abs(pi - pi.approx)/pi
cat('  relative error = ', pi.err,'\n')

tm.tot = as.numeric(Sys.time() - time.start, units="secs")
cat('          total time = ',tm.tot,'\n')
mpi.close.Rslaves(dellog = TRUE)

mpi.quit()

