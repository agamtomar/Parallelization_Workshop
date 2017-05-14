#######################################################################
#
#   Exercise Solution:  Scatter/Gather
#
#   Scatter list a to all even processors, assigning its values to the variable mylist
#   Scatter list b to all odd processors, assigning its values to mylist
#   Gather from all processors to create the list [0,1,0,1,2,3,4,9,....]
#

import ipyparallel

#identify the our python engines
clients=ipyparallel.Client()
nclients = len(clients)

#create views into each engine
all_proc  = clients[:]
even_proc = clients[range(0,nclients,2)]
odd_proc  = clients[range(1,nclients,2)]

all_proc.block=True
even_proc.block=True
odd_proc.block=True

a = []
b = []
lsize=nclients
for i in range(0,lsize):
	a.append(i)
	b.append(i**2)
even_proc.scatter('mylist',a)
odd_proc.scatter('mylist',b)

sub_lists = all_proc['mylist']

#Only the hub prints this
print('\n ',nclients," Python clients are active.\n")




print(' ')
for i in range(nclients):
    istr = '{:02d}'.format(i)  # returns a 2-digit string whose value is i
    msg = 'Engine '+istr+':   list segment = '
    print(msg, sub_lists[i])
print(' ')
gathered = all_proc.gather('mylist')
print('Gathered list: ', gathered)
