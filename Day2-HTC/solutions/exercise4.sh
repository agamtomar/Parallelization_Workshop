#!/bin/bash

#SBATCH --job-name htc-exercise4-gnu-parallel
#SBATCH --nodes 1
#SBATCH --ntasks 10
#SBATCH --output htc-exercise4-%j.out
#SBATCH --time 00:02:00

module purge
module load python gnu_parallel

time (
    ls data/input_*.csv | parallel python matrix-multiply.py {}
)
