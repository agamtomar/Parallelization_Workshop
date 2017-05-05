#!/bin/bash

#SBATCH --job-name exercise4-gnu-parallel
#SBATCH --nodes 1
#SBATCH --ntasks 10
#SBATCH --output exercise4-output.txt
#SBATCH --time 0:02:00

module load gnu_parallel

time (
    ls data/sums_input_*.csv | parallel python sums.py {}
)
