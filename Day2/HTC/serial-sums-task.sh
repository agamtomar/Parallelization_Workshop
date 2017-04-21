#!/usr/bin/bash

#SBATCH --job-name sums
#SBATCH --nodes 1
#SBATCH --output sums_output_0.out
#SBATCH --time 30:00

time python sums.py data/sums_input_0.csv
