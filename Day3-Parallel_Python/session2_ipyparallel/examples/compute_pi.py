#############################################################################
#       Example:  Parallel computation of pi using IPyParallel
#
#                 In this example, each engine computes a unique estimate of pi.
#                 The result is averaged across all engines in the cluster.
#
import ipyparallel
import random
import time
import numpy as np
 
def estimate_pi(n):
    # (a) This function uses the random module.
    # If we import random here, we are guaranteed that
    # all processes will import the module.  However, see (b)

    # import random
    count = 0
    for i in range(n):
        x = random.random()
        y = random.random()
        if (x**2 + y**2) <= 1:
            count += 1
    return 4.0*count/float(n)

clients=ipyparallel.Client()
nclients = len(clients)
all_proc = clients[:]
all_proc.block=True

#(b) Alternatively, we can sync our module imports from the hub
with all_proc.sync_imports():
    import random

# First in serial
print('\n\n\n')
print('Serial Estimation of Pi')
print('')

for i in range(8):
    nx = 10**i

    t0 = time.time()

    est_pi = estimate_pi(nx)

    t1 = time.time()
    tval = t1-t0

    msg = 'Estimation based on '+str(i)+' points: '
    tmsg = 'Calculation time (seconds) : '
    print(msg,est_pi,tmsg,tval)


print('\n\n\n')
print('Parallel Estimation of Pi')
print('')

#Now in parallel
for i in range(2,8):
    nx = 10**i

    t0 = time.time()

    #[nx//clients]*nclients creates a list of length nclients, where each element
    # has value nx//nclients.  Each process gets one element of this list 
    # and passes it to estimate_pi

    pi_estimates = all_proc.map_sync(estimate_pi, [nx//nclients]*nclients)

    est_pi = np.mean(pi_estimates)

    t1 = time.time()
    tval = t1-t0

    msg = 'Estimation based on '+str(i)+' points: '
    tmsg = 'Calculation time (seconds) : '
    print(msg,est_pi,tmsg,tval)

