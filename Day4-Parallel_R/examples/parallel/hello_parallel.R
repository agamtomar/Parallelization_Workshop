library(parallel)

hello <- function () {
    info <- Sys.info()[c("nodename", "machine")]
    paste("Hello World from", info[1], "on CPU type", info[2])
}

## number of slave to spawn
np = detectCores()

cl <- makeCluster(np)

clusterCall(cl, hello)

stopCluster(cl)
