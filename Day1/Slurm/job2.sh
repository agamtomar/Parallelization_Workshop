#!/bin/bash
#SBATCH --nodes=1            # Number of requested nodes
#SBATCH --ntasks=1           # Number of tasks per job; ie number of cores
#SBATCH --time=0:02:00               # Max wall time
#SBATCH --reservation=parallelD1     # Specify reservation
#SBATCH --partition=shas             # Specify Summit haswell nodes
#SBATCH --job-name=job2              # Job name
#SBATCH --output=job2.%j.out         # Output file name with Job ID 

cd /home/$USER/Parallelization_Workshop/Day1/Slurm
echo “job2 starting” `date`
sleep 60
echo “job2 ending” `date`

