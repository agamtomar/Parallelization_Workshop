#///////////////////////////////////////////////////////////////
#                   Exercise 2:
#       Rewrite the following code using the map and 
#       reduce functions.

from functools import reduce

n = 4
b = []
for i in range(1,n+1):
    b.append(2*i)
print b

prod = 1
for i in range(n):
    prod = prod*b[i]
print(prod)
