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
rc  =ipyparallel.Client(profile='crestone-cpu')
nengines = len(rc)

#create views into each engine
all_proc  = rc[:]

# This keeps the engines in-sync with one another
# Engines do not proceed to instruction 'b' until all engines
# have completed instruction 'a.'
all_proc.block=True

a = []
lsize=6*nengines
for i in range(0,lsize):
	a.append(i**2)

#We scatter the list "a" from the hub out to all engines
#Each process stores a portion of "a" locally in the variable "mylist"
all_proc.scatter('mylist',a)

# Create a variable on the controller that holds the contents of 'mylist' for each engine
# sub_lists is a nested list, sub_list[i][:] holds the value 'mylist' for engine 'i'
sub_lists = all_proc['mylist']


#Only the controller prints this
print('\n ',nengines," Python engines are active.\n")

print(' ')
for i in range(nengines):
    istr = '{:02d}'.format(i)  # returns a 2-digit string whose value is i
    msg = 'Engine '+istr+':   list segment = '
    print(msg, sub_lists[i])
print(' ')

#Gather 'mylist' back to the controller, store the contents in a list named gathered
gathered = all_proc.gather('mylist')
print('Gathered list: ', gathered[:], type(gathered))
