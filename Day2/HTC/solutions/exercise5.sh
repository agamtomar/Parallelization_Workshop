#!/usr/bin/bash

#SBATCH --job-name sums
#SBATCH --nodes 2
#SBATCH --ntasks-per-node 5
#SBATCH --output sums_output.txt
#SBATCH --time 2:00

module load intel impi
module load loadbalance

>lb_cmd_file
for csv in data/sums_input_{0..9}.csv
do
    echo "python sums.py ${csv}" >> lb_cmd_file
done

mpirun lb lb_cmd_file
