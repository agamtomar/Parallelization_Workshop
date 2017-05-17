#################################################
#
#   Solution:  Parallel Function Evaluation
#
#
import ipyparallel
import os

def squared(x):
    import os
    return (x**2,os.getpid())

#identify the our python engines
rc=ipyparallel.Client(profile='crestone-cpu')
nengines = len(rc)

#create views into each engine
all_proc  = rc[:]
all_proc.block=True

#Only the controller prints this
print('\n ',nengines," Python engines are active.\n")

n=nengines*4

#We map 
results = all_proc.map_sync(squared,range(n))

# We can use the process ID's to create a dictionary mapping
# process ID to engine #
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
