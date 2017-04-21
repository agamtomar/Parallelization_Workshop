#!/usr/bin/bash

#SBATCH --job-name sums
#SBATCH --nodes 1
#SBATCH --array 0-9
#SBATCH --output sums_output-%a.txt
#SBATCH --time 1:00

module load gnu_parallel
time python sums.py data/sums_input_${SLURM_ARRAY_TASK_ID}.csv
