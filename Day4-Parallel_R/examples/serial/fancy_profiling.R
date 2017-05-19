# Simple profiling example
library(profvis)

f <- function() {
  pause(0.6)
  g()
  h()
}

g <- function() {
  pause(0.1)
  h()
}

h <- function() {
  pause(0.5)
}

p <- profvis({f()})
p
#htmlwidgets::saveWidget(p, 'simple.html', selfcontained = FALSE)


