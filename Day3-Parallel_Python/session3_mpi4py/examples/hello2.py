#!/usr/bin/env python
def main():
    """
    Python, mpi4py parallel hello world.
    """

    from mpi4py import MPI
    import sys

    num_proc  = MPI.COMM_WORLD.Get_size()
    my_rank   = MPI.COMM_WORLD.Get_rank()
    node_name = MPI.Get_processor_name()

    if (my_rank == 0):
        # Sometimes we might like for only a single thread to report certain information.
        # This avoids redundant output.
        sys.stdout.write("  %d MPI Processes are now active.\n" %(num_proc))

    sys.stdout.write(
        "  Hello from node %s, rank %d out of %d processes.\n"
        % (node_name, my_rank, num_proc))
    MPI.Finalize()
main()

