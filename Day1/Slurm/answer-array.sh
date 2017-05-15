#!/bin/bash
#SBATCH --nodes=1	# Number of requested nodes
#SBATCH --ntasks=4	# Number of tasks per job, ie number of cores
#SBATCH --time=00:22:00	# Max wall time
#SBATCH --array=1-10
#SBATCH --reservation=parallelD1	# Specify workshop reservation
#SBATCH --partition=shas		# Specify Summit haswell nodes
#SBATCH --job-name=analyze_exp		# Job name
#SBATCH --output=analyze.%A_%a.out	# Output file name with Job ID

cd /home/$USER/Parallelization_Workshop/Day1/Slurm

module purge
# module load intel/16.0.3
# module load impi
# module load python/2.7

echo "I am Task ID: " $SLURM_ARRAY_TASK_ID

# ./analyze.py exp_run. $SLURM_ARRAY_TASK_ID   # One input file per array task
