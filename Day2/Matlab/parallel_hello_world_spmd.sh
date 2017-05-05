#!/bin/bash
#SBATCH -N 1                       # Number of requested nodes
#SBATCH --time=0:05:00             # Max wall time
#SBATCH --qos=debug                # Specify debug QOS
#SBATCH --partition=shas           # Specify Summit haswell nodes
#SBATCH --ntasks-per-node=24       # number of cores per node
#SBATCH --job-name=HelloW          # Job submission name
#SBATCH --output=HELLOW.out        # Output file name


# Written by:	Shelley Knuth
# Date:		24 February 2014
# Updated:	19 April 2017
# Purpose: 	This script calls a Matlab parallel program 

# load the matlab module
ml matlab

# The directory where the job was submitted from
cd /projects/knuths/tutorials/parallelization_workshop/new

# Run matlab without a GUI
matlab -nosplash -nodesktop -r "clear; parallel_hello_world_spmd;"

