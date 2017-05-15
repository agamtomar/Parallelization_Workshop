#!/bin/bash
#SBATCH --nodes=1            # Number of requested nodes
#SBATCH --ntasks=4           # Number of tasks per job; ie number of cores
#SBATCH --time=0:02:00               # Max wall time
#SBATCH --reservation=parallelD1     # Specify WORKSHOP reservation
#SBATCH --partition=shas             # Specify Summit haswell nodes
#SBATCH --job-name=openmp            # Job name
#SBATCH --output=openmp.%j.out       # Output file name with Job ID 
#SBATCH --mail-type=begin,end        # Send mail when job starts and ends
#SBATCH --mail-user=first.last@somewhere.edu  # Address to send email to


cd /home/$USER/Parallelization_Workshop/Day1/Slurm
module purge
module load intel/16.0.3
export OMP_NUM_THREADS=4
./openmp-hello.x

