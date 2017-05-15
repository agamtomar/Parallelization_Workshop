#!/bin/bash
#SBATCH --nodes=1            # Number of requested nodes
#SBATCH --ntasks=4           # Number of tasks per job; ie number of cores
#SBATCH --time=0:02:00               # Max wall time
#SBATCH --reservation=parallelD1     # Specify WORKSHOP reservation
#SBATCH --partition=shas             # Specify Summit haswell nodes
#SBATCH --job-name=hostname          # Job name
#SBATCH --output=hostname.%j.out     # Output file name with Job ID

# Written by: You!
# Date: 15 May 2017 

hostname

