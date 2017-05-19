# File name: mcpi_pbdr.r
# Description: Calculate pi using Monte Carlo
# Run: mpiexec -np 8 Rscript --vanilla mcpi_pbdr.r

# Load pbdMPI and initialize the communicator
library(pbdMPI, quiet = TRUE)
init()

# Number of points to use
n.pts <- 1000000

# Function to calculate whether a point is in the unit circle
in.ucir <- function(x) { as.integer((x[,1]^2 + x[,2]^2) <= 1) }

# Function to generate n.pts random points in the unit
# square and count the number in the unit circle
count.in.cir <- function(n.pts) {
  # Create a list of n.pts random (x,y) pairs
  m <- matrix(runif(n.pts*2),n.pts,2)
  # Determine whether each point is in unit circle
  in.cir <- in.ucir(m)
  # Count the points in the unit circle
  return ( sum(in.cir) )
}

# Call count.in.cir on each process
n.in.cir <- count.in.cir(n.pts)
comm.print(n.in.cir, all.rank=TRUE)
# Use reduce() to total across processes
n.in.cir <- reduce(n.in.cir, op="sum")
comm.print(n.in.cir, all.rank=TRUE)

# Approximate pi
pi.approx <- 4*n.in.cir/( comm.size()*n.pts )
pi.err <- abs(pi - pi.approx)/pi

# Output from RANK 0 since reduce() will dump only to 0 by default
comm.print(paste('approximate value of pi is: ',pi.approx,'\n'))
comm.print(paste('            relative error: ',pi.err,'\n'))

# Wrap up
finalize()
