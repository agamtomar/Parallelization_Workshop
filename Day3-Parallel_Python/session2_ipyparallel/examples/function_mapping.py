from functools import reduce
def squarex(x):
    return (x*x)
def add(x):
    return (x+x)

def addtwo(x,y):
    return x+y
def multtwo(x,y):
    return x*y


vals = map(squarex, [1,3,9,27])
print(vals)
v2 = reduce(addtwo,[1,2,3])
v3 = reduce(multtwo,[1,2,3,4])
print v2,v3

