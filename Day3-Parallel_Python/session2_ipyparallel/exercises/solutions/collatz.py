import ipyparallel
import numpy as np
import time
def collatz_length(n):
    val = n
    length = 1
    while (val != 1):
        length += 1
        if ((val % 2) == 0):
            val = val//2
        else:
            val =3*val+1
    return length


n = 10000
max_len = 1
max_i = 1

print('\n')
print('...........................')
print('Serial Calculation')
print('')


t0 = time.time()
for i in range(1,n):
    length = collatz_length(i)
    if (length > max_len):
        max_i = i
        max_len = length
t1 = time.time()
dt = t1-t0
msg = 'The integer with the longest collatz sequence in the interval [1,'+str(n)+'] is '
msg2 = str(max_i)+', whose sequence has length '+str(max_len)+'.'
print(msg+msg2)
print('Calculation time (serial; seconds): ', dt)

clients=ipyparallel.Client()
nclients = len(clients)
all_proc = clients[:]
all_proc.block=True

print('\n')
print('...........................')
print('Parallel Calculation')
print('')

#Generate a list of numbers whose collatz-sequence lengths we want to know
numbers=[]
for i in range(1,n):
    numbers.append(i)

# Map the list of numbers to all processes, evaluate collatz_length
# using numbers as arguments.

t0 = time.time()
lengths = all_proc.map_sync(collatz_length, numbers)
max_len=np.max(lengths)
max_i = lengths.index(max_len)+1 # search the
t1 = time.time()
dt=t1-t0


msg = 'The integer with the longest collatz sequence in the interval [1,'+str(n)+'] is '
msg2 = str(max_i)+', whose sequence has length '+str(max_len)+'.'
print(msg+msg2)
print('Calculation time (parallel; seconds): ', dt)

