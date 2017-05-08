#!/bin/bash

#SBATCH --job-name htc-exercise5-slurm-arrays
#SBATCH --ntasks 1
#SBATCH --array 0-9
#SBATCH --output htc-exercise5-%A.%a.out
#SBATCH --time 00:01:00

module purge
module load python

time python matrix-multiply.py data/input_${SLURM_ARRAY_TASK_ID}.csv
