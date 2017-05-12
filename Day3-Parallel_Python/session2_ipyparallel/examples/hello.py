#########################################################################3
#           Example:  Initializing IPyParallel
#
#                     This example demonstrates how to access the individual
#                     ipython engines running within the cluster.
#


import ipyparallel
import os
import socket

#identify the our python engines
clients=ipyparallel.Client()
nclients = len(clients)

#create views into each engine
all_proc  = clients[:]

#Only the hub prints this
print('\n ',nclients," Python clients are active.\n")

# Each Python engine calls the gethostname and getpid functions
hostnames = all_proc.apply_sync(socket.gethostname)
pids = all_proc.apply_sync(os.getpid)

for i in range(nclients):
    istr = '{:02d}'.format(i)  # returns a 2-digit string whose value is i
    pstr = str(pids[i])
    hstr = str(hostnames[i])
    msg = 'Client '+istr+':   pid = '+pstr+';  hostname ='+hstr
    print(msg)
print(' ')
