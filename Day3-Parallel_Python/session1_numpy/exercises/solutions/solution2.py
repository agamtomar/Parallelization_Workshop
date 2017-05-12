#/////////////////////////////////////////////////////////////////
#                           Exercise 2:  Solution
#
from functools import reduce
def twox(x):
    return (2*x)

def multtwo(x,y):
    return x*y

n = 4

#                               Step 1: 
#  Replace the following code with a call to map, using the function twox
#
#b = []
#for i in range(1,n+1):
#    b.append(2*i)
#print b

b = map(twox, range(1,n+1))

#                               NOTE 1: 
#
#   We could also define the twox functionality within the call to map via: 
#b = map(lambda x : 2*x, range(1,n+1))


#                               Step2 : 
#  Replace the following code with a call to reduce, 
#  using the function multtwo and the list b
#
# prod = 1
# for i in range(n):
#     prod = prod*b[i]
# print(prod)

prod = reduce(multtwo,b)

#                               Note 2:
#  We can similarly define multtwo within the call to reduce via:
#  prod = reduce(lambda x,y : x*y, b)
print '   b: ', b
print 'prod: ', prod




