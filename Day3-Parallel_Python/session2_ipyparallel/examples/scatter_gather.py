################################################################
#           Example:  Scattering and Gathering Lists in Python
#
#           One common task when parallel programming involves
#           distributing (scattering) a list of numbers among
#           the different processes or collating (gathering)
#           a distributed list of numbers back to the hub processes.
#           This example illustrates the basic mechanics of scattering
#           and gathering.

import ipyparallel

#identify the our python engines
clients  =ipyparallel.Client()
nclients = len(clients)

#create views into each engine
all_proc  = clients[:]


a = []
lsize=6*nclients
for i in range(0,lsize):
	a.append(i**2)

#We scatter the list "a" from the hub out to all clients/engines
#Each process stores a portion of "a" locally in the variable "mylist"
all_proc.scatter('mylist',a)

#Create a variable that holds the contents of 'mylist'
sub_lists = all_proc['mylist']

#Only the hub prints this
print('\n ',nclients," Python clients are active.\n")

print(' ')
for i in range(nclients):
    istr = '{:02d}'.format(i)  # returns a 2-digit string whose value is i
    msg = 'Engine '+istr+':   list segment = '
    print(msg, sub_lists[i])
print(' ')

#Gather 'mylist' back to the hub, store the contents in a single list: gathered
gathered = all_proc.gather('mylist')
print('Gathered list: ', gathered[:], type(gathered))
