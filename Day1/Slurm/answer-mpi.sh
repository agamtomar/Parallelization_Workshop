#!/bin/bash
#SBATCH --nodes=1	# Number of requested nodes
#SBATCH --ntasks=24	# Number of tasks per job, ie number of cores
#SBATCH --time=00:02:00	# Max wall time
#SBATCH --reservation=parallelD1	# Specify workshop reservation
#SBATCH --partition=shas		# Specify Summit haswell nodes
#SBATCH --job-name=mpi			# Job name
#SBATCH --output=mpi.%j.out		# Output file name with Job ID

cd /home/$USER/Parallelization_Workshop/Day1/Slurm

module purge
module load intel/16.0.3
module load impi

mpirun -np 24 ./mpi-hello.x 
