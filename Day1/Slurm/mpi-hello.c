#include <mpi.h>  /* Need to include MPI headers */
#include <stdio.h>

int main(int argc, char **argv)
{
  int rank, size;
  char hostname[256];

  MPI_Init(&argc,&argv);  /* Initialize MPI */
  MPI_Comm_size(MPI_COMM_WORLD, &size);  /* Size is the number of MPI processes */
  MPI_Comm_rank(MPI_COMM_WORLD, &rank);  /* Rank is the ID of an MPI process */
  gethostname(hostname,255);

  printf("Hello world!  Out of %d total processes I am number %d on host %s\n", size, rank, hostname);

  MPI_Finalize();  /* Terminate MPI */

  return 0;
}
