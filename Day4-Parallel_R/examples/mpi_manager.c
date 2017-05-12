/* MPI2 Manager Code */
/* from http://ppomorsk.sharcnet.ca/Lecture_6_a_process_creation.pdf */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <mpi.h>
int main(int argc, char** argv) {
  int rank, size, namelen, version, subversion, universe_size;
  MPI_Comm family_comm;
  char processor_name[MPI_MAX_PROCESSOR_NAME], worker_program[100];
  int rank_from_child,ich, ich0;
  MPI_Init(&argc, &argv);
  MPI_Comm_rank(MPI_COMM_WORLD, &rank);
  MPI_Comm_size(MPI_COMM_WORLD, &size);
  MPI_Get_processor_name(processor_name, &namelen);
  MPI_Get_version(&version, &subversion);
  printf("I’m manager %d of %d on %s running MPI %d.%d\n", rank, size,
	 processor_name, version, subversion);
  if (size != 1) printf("Error: Only one manager process should be running, but %d were started.\n", size);
  /* set total number of process to be running, including manager */
  universe_size = 4;
  strcpy(worker_program, "./mpi2_worker");
  printf("Spawning %d worker processes running %s\n", universe_size-1,
	 worker_program);
  MPI_Comm_spawn(worker_program, MPI_ARGV_NULL, universe_size-1,
		 MPI_INFO_NULL, 0, MPI_COMM_SELF, &family_comm, MPI_ERRCODES_IGNORE);
  /* communicate with child processes */
  for(ich=0;ich<(universe_size-1);ich++){
    MPI_Recv(&rank_from_child,1,MPI_INT,ich0,1,family_comm,MPI_STATUS_IGNORE);
    printf("Received rank %d from child %d \n",rank_from_child,ich);
  }
  MPI_Bcast(&rank,1,MPI_INT,MPI_ROOT,family_comm);
  MPI_Comm_disconnect(&family_comm);
  MPI_Finalize();
  return 0;
}
