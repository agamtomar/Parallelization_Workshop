# Simple profiling example
library(lineprof)
f <- function() {
  pause(1)
  g()
  h()
}

g <- function() {
  pause(0.2)
  h()
}

h <- function() {
  pause(0.5)
}

