#!/usr/bin/bash

#SBATCH --job-name exercise2-bash-background
#SBATCH --nodes 1
#SBATCH --ntasks 10
#SBATCH --output exercise2-output.txt
#SBATCH --time 2:00

time (
    for i in $(seq 0 9)
    do
        python sums.py data/sums_input_${i}.csv &
    done
    wait
)
