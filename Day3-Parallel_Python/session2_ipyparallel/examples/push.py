#Example program illustrating how to use classes with ipyparallel

import ipyparallel

class myclass():
    def __init__(self):
        self.x = 0
        self.y = 0
    def set_x(self,x):
        self.x = x
    def set_y(self,y):
        self.y = y
    def swap(self):
        x = self.x
        y = self.y
        self.set_x(y)
        self.set_y(x)

    def ret_vals(self):
        x = self.x
        y = self.y
        return [x,y]

def use_class(i):
    a = myclass()
    a.set_x(i)
    a.set_y(-i)
    v1 = a.ret_vals()
    a.swap()
    v2 = a.ret_vals()
    return [v1,v2] 

clients = ipyparallel.Client()
nclients = len(clients)
all_proc = clients[:]
all_proc.block =True

print('\n ',nclients," Python clients are active.\n")

#Before the class can be used, its definition must be pushed to the different Python engines

all_proc.push({"myclass": myclass})
results = all_proc.map_sync(use_class,range(nclients))

for i in range(nclients):
    istr = '{:02d}'.format(i)
    res0 = results[i][0]
    res1 = results[i][1]

    x0 = str(res0[0])
    y0 = str(res0[1])
    xy0 = '['+x0+','+y0+']'

    x1 = str(res1[0])
    y1 = str(res1[1])
    xy1 = '['+x1+','+y1+']'
    
    cstr = 'Engine '+istr+' ; [x,y] initial: '+xy0+'; [x,y] swapped: '+xy1
    print(cstr)

