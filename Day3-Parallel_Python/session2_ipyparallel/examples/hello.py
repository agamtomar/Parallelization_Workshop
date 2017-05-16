#########################################################################3
#           Example:  Initializing IPyParallel
#
#                     This example demonstrates how to access the individual
#                     ipython engines running within the cluster.
#


import ipyparallel
import os
import socket

#Create a client instance, used to connect the controller to the remote engines
rc=ipyparallel.Client(profile='crestone-cpu')
nengines = len(rc)

#create direct views into each engine
all_proc  = rc[:]  # all_proc is a list of ipython DirectView objects

#Only the controller prints this
print('\n ',nengines," Python engines are active.\n")

# Each Python engine calls the gethostname and getpid functions
hostnames = all_proc.apply_sync(socket.gethostname)
pids = all_proc.apply_sync(os.getpid)

for i in range(nengines):
    istr = '{:02d}'.format(i)  # returns a 2-digit string whose value is i
    pstr = str(pids[i])
    hstr = str(hostnames[i])
    msg = 'Engine '+istr+':   pid = '+pstr+';  hostname ='+hstr
    print(msg)
print(' ')
