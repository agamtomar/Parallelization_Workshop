# Description: Hello World
# Run: mpirun -n 4 Rscript hello_deadLock.R

# Load pbdMPI and initialize the communicator
library(pbdMPI, quiet = TRUE)
init()

# Print Hello World
id <- comm.rank()
nprocs <- comm.size()

comm.cat("Hello World from process",comm.rank(),"of",comm.size(),"!\n", all.rank=TRUE)

# 

if (id > 5) {
    k <- 10
    comm.print(k, all.rank=TRUE)
} else {
    k <- -10*id
    comm.print(k, all.rank=TRUE)
}    

# Wrap up
finalize()
