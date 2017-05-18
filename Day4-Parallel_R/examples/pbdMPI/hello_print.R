# Description: Hello World
# Run: mpirun -n 8 Rscript  hello_pbdMPI.R

# Load pbdMPI and initialize the communicator
library(pbdMPI, quiet = TRUE)
init()

# Print Hello World
id <- comm.rank()
nprocs <- comm.size()
cat("Hello World from process", id,"of", nprocs,"!\n", all.rank=TRUE)
k <- 10*nprocs
print(k, all.rank=TRUE)

# Wrap up
finalize()
