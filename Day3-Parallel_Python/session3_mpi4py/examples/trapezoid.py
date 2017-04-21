#!/usr/bin/env python
def myfunc(x):
    val = x*x*x
    return val
def trapezoid_int(a, b, ntrap):
    ## Integrates myfunc(x) from a to b
    h = (b-a)/(ntrap-1)

    val = myfunc(a)
    integral = 0.5*val
    val = myfunc(b)
    integral = integral+0.5*val

    for i in range(ntrap):
        x = a+i*h
        integral = integral+myfunc(x)

    integral = integral*h
    return integral

def main():
    """
    Python, mpi4py parallel hello world.
    """

    from mpi4py import MPI
    import sys
    import numpy

    num_proc  = MPI.COMM_WORLD.Get_size()
    my_rank   = MPI.COMM_WORLD.Get_rank()
    node_name = MPI.Get_processor_name()
    comm = MPI.COMM_WORLD

    if (my_rank == 0):
        sys.stdout.write("  %d MPI Processes are now active.\n" %(num_proc))
    comm.Barrier()


    ntests = 10000
    ntrap = 1000000/num_proc  # Each rank gets 1000,000/num_proc trapezoids

    ntests = 2  #comment this line out once your code is working correctly


    xone = 1.0  # The global limits of integration
    xtwo = 2.0

    # Each rank should integrate between a unique pair of values myxone and myxtwo
    # What should deltax and myxone be to make this work?
    deltax = (xtwo-xone)
    myxone = xone
    myxtwo = myxone+deltax

    local_integral = numpy.array(0.0,'d') 
    global_integral = numpy.array(0.0, 'd')
    for i in range(ntests):

        local_integral = 0*local_integral+trapezoid_int(myxone,myxtwo,ntrap)
        # The call to Allreduce will sum the value of local_integral across
        # all processes, and store it in global_integral        	
        comm.Allreduce([local_integral, MPI.DOUBLE], [global_integral,MPI.DOUBLE], op=MPI.SUM)

    sys.stdout.write("  Rank %d contributes %f to the global integral value of %f.\n" 
                     % (my_rank, local_integral, global_integral))
    MPI.Finalize()
main()

