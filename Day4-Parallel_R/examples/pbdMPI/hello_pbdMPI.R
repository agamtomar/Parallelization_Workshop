# File: helloworld_pbdr.r
# Description: pbdR Hello World
# Run: mpiexec -np 8 Rscript --vanilla helloworld_pbdr.r

# Load pbdMPI and initialize the communicator
library(pbdMPI, quiet = TRUE)
init()

# Print Hello World
comm.cat("Hello World from process",comm.rank(),"of",comm.size(),"!\n", all.rank=TRUE)
k <- 10
comm.print(k*comm.rank(), all.rank=TRUE)

# Wrap up
finalize()
