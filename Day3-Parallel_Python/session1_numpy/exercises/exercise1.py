#//////////////////////////////////////////////////////////////
#                   Exercise 1:
# Rewrite the following program using numpy arrays and 
# array operations where possible (instead of explicit loops).

n = 1000000  

a = []
b = []
for i in range(1,n+1):
    a.append(4*i)
    b.append(i**2)

dsum = 0.0
for i in range(n):
    dsum += a[i]*b[i]

print 'dsum is: ', dsum
