##########################################################3
#       Exercise:   Parallel Function Evaluation
#
#       Modify this code as follows:
#
#        i) Have squared return the tuple ( x^2,  process ID).  
#       ii) Revise the formatting of the loop output to read as follows:                                                
#                  47^2 is 2209 according to process PID: 192159


import ipyparallel
import os

def squared(x):
    import os
    return x**2

#Initialize Communication
clients  = ipyparallel.Client()
nclients = len(clients)

#create views into each engine
all_proc  = clients[:]
all_proc.block=True

#Only the hub prints this
print('\n ',nclients," Python clients are active.\n")

n=nclients*4

#Engine 0 gets arguments [0,1,2,3]
#Engine 1 gets arguments [4,5,6,7] etc.
results = all_proc.map_sync(squared,range(n))
pids = all_proc.apply_sync(os.getpid)
pdict = {}

for i,p in enumerate(pids):
    pdict[p] = i

for i in range(n):
    istr = '{:4d}'.format(i) 
    vstr = ''
    pstr = ''
    estr = '{:2d}'.format(pdict[results[i][1]])
    msg = istr+'^2 is '+vstr+' according to process PID: '+pstr + ', Engine: '+estr
    print(msg)
