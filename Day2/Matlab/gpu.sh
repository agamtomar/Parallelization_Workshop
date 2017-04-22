#!/bin/bash
#SBATCH -N 1                       # Number of requested nodes
#SBATCH --time=0:05:00             # Max wall time
#SBATCH --qos=debug                # Specify debug QOS
#SBATCH --partition=sgpu           # Specify Summit haswell nodes
#SBATCH --ntasks-per-node=24       # number of cores per node
#SBATCH --job-name=GPU             # Job submission name
#SBATCH --output=GPU.out           # Output file name


# Written by:	Shelley Knuth
# Date:		19 April 2017
# Purpose: 	This script calls a Matlab parallel program 

# load the matlab module
ml matlab

# The directory where the job was submitted from
cd /projects/knuths/tutorials/parallelization_workshop/new

# Run matlab without a GUI and ask for 24 workers
matlab -nosplash -nodesktop -r "clear; num_workers=24; gpu;"

