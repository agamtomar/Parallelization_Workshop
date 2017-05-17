# Simply summation of Matrix rows
suppressMessages(library(pbdMPI , quietly = TRUE))
library(microbenchmark)

init ()

.comm.size <- comm.size()
.comm.rank <- comm.rank()
comm.print(.comm.size, all.rank=TRUE)
comm.print(.comm.rank, all.rank=TRUE)

nrows <- 10
if (.comm.rank == 0) {
    M <- matrix(1:nrows^2, nrow = nrows, ncol = nrows)
}

r <- pbdApply(M, 1, sum, pbd.mode="mw", rank.source=0)

comm.print(r)

if (.comm.rank == 0) {
    print("#")
    print(rowSums(M))
}

finalize()

