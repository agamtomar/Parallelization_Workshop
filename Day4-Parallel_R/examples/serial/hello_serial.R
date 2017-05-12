
hello <- function () {
    info <- Sys.info()[c("nodename", "machine")]
    paste("Hello World from", info[1], "on CPU type", info[2])
}

hello()
