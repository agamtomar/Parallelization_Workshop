#!/usr/bin/bash

#SBATCH --job-name sums
#SBATCH --nodes 1
#SBATCH --output sums_output_0.out
#SBATCH --time 30:00

time (
    for i in $(seq 0 9)
    do
        python sums.py data/sums_input_${i}.csv &
    done
    wait
)
