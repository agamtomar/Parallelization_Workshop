#!/bin/bash

#SBATCH --job-name exercise2-background-bash-jobs
#SBATCH --nodes 1
#SBATCH --ntasks 10
#SBATCH --output exercise2-%j.out
#SBATCH --time 0:02:00

module purge
module load python

time (
    for input in data/input_{0..9}.csv
    do
        python matrix-multiply.py ${input} &
    done
    wait
)
