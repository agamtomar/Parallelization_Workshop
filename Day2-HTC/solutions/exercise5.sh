#!/bin/bash

#SBATCH --job-name exercise5-loadbalancer
#SBATCH --nodes 2
#SBATCH --ntasks-per-node 5
#SBATCH --output exercise5-output.txt
#SBATCH --time 2:00

module load intel impi
module load loadbalance

(
    for csv in data/sums_input_{0..9}.csv
    do
        echo "python sums.py ${csv}"
    done
) >lb_cmd_file

time mpirun lb lb_cmd_file
