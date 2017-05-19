# Simply summation of Matrix rows

nrows <- 10
M <- matrix(1:nrows^2, nrow = nrows, ncol = nrows)
print(M)
for (i in 1:nrows) {
  print(sum(M[i, ]))
}
