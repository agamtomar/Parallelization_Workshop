import ipyparallel

#identify the our python engines
clients=ipyparallel.Client()
nclients = len(clients)

#create views into each engine
all_proc  = clients[:]
even_proc = clients[range(0,nclients,2)]
odd_proc  = clients[range(1,nclients,2)]

a = []
lsize=36
for i in range(0,lsize):
	a.append(i**2)
all_proc.scatter('mylist',a)
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
print('Gathered list: ', gathered[:], type(gathered))
