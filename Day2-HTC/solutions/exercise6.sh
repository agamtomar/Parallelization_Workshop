#!/bin/bash

#SBATCH --job-name exercise6-slurm-arrays
#SBATCH --ntasks 1
#SBATCH --array 0-9
#SBATCH --output exercise6-output-%a.txt
#SBATCH --time 0:01:00

module load gnu_parallel
time python sums.py data/sums_input_${SLURM_ARRAY_TASK_ID}.csv
