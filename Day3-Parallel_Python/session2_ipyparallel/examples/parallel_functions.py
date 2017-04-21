import ipyparallel
import os

def squared(x):
    import os
    return (x**2,os.getpid())

#identify the our python engines
clients=ipyparallel.Client()
nclients = len(clients)

#create views into each engine
all_proc  = clients[:]
all_proc.block=True

#Only the hub prints this
print('\n ',nclients," Python clients are active.\n")

n=nclients*4

#We map 
results = all_proc.map_sync(squared,range(n))
pids = all_proc.apply_sync(os.getpid)
pdict = {}

for i,p in enumerate(pids):
    pdict[p] = i

for i in range(n):
    istr = '{:4d}'.format(i) 
    vstr = '{:6d}'.format(results[i][0]) 
    pstr = '{:6d}'.format(results[i][1]) 
    estr = '{:2d}'.format(pdict[results[i][1]])
    msg = istr+'^2 is '+vstr+' according to process PID: '+pstr + ', Engine: '+estr
    print(msg)
