#########################################################################3
#       Exercise:  Assignment 
#           
#                 Modify this program so that var1 receives the value n,
#                 where n is the remainder of the process ID divided by 3.
#                 i.e., n = pid % 3


import ipyparallel
import os
import socket

#identify the our python engines
rc=ipyparallel.Client(profile='crestone-cpu')
nengines = len(rc)

#create views into each engine
all_proc  = rc[:]
proc0 = rc[0]
proc2 = rc[2]
even_proc = rc[range(0,nengines,2)]
odd_proc  = rc[range(1,nengines,2)]

#Only the hub prints this
print('\n ',nengines," Python engines are active.\n")

# Each Python engine calls the gethostname and getpid functions
hostnames = all_proc.apply_sync(socket.gethostname)
pids = all_proc.apply_sync(os.getpid)

#Assign a list-value of [0,1] to the variable 'b' on all python engines
all_proc['b']=[0,1]
#We can view the value on all engines
vals = all_proc['b']
print('All values of b: ',vals) # or use all_proc['b']
#or on a single engine:
print('')
print("Engine zero's value of b: ", proc0['b']) #could also use vals[0]

#Assign a value of 1 to var1 on all python engines
all_proc['var1']=1

#Assign a value of 2 to var2 on all python engines
all_proc['var2']=2

#Change the value of var2 to 3 and 4 on engines 0 and 2 respectively
proc0['var2'] = 3
proc2['var2'] =4

even_proc['var3']=0
odd_proc['var3']=1


vars1 = all_proc['var1']
vars2 = all_proc['var2']
vars3 = all_proc['var3']
print(' ')
for i in range(nengines):
    istr = '{:02d}'.format(i)  # returns a 2-digit string whose value is i
    v1str = str(vars1[i])
    v2str = str(vars2[i])
    v3str = str(vars3[i])
    msg = 'Engine '+istr+':   var1 = '+v1str+';  var2 ='+v2str+';  var3 ='+v3str
    print(msg)
print(' ')
