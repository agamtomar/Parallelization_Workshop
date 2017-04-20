library(Rmpi)

hello <- function () {
    info <- Sys.info()[c("nodename", "machine")]
    paste("Hello World from", info[1], "number", id, "on CPU type", info[2], "out of", np-1)
}

## number of slave to spawn
## get from environment on Yeti
nslaves <- 39 

mpi.spawn.Rslaves(nslaves = nslaves)

mpi.remote.exec(id <- mpi.comm.rank())
mpi.remote.exec(np <- mpi.comm.size())

mpi.bcast.Robj2slave(hello)

mpi.remote.exec(hello())

mpi.close.Rslaves(dellog = TRUE)
mpi.exit()
