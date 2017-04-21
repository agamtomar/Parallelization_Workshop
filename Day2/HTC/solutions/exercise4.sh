#!/usr/bin/bash

#SBATCH --job-name sums
#SBATCH --nodes 1
#SBATCH --output sums_output.txt
#SBATCH --time 2:00

module load gnu_parallel
time parallel python sums.py {} ::: data/sums_input_{0..9}.csv
