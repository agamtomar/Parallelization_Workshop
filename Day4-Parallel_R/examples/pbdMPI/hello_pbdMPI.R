# File: helloworld_pbdr.r
# Description: pbdR Hello World
# Run: mpiexec -np 8 Rscript --vanilla helloworld_pbdr.r

# Load pbdMPI and initialize the communicator
library(pbdMPI, quiet = TRUE)
init()

# Print Hello World
cat("Hello World from process",comm.rank(),"of",comm.size(),"!\n")

# Wrap up
finalize()
