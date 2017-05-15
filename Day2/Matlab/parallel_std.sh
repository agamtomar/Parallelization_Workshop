#!/bin/bash
#SBATCH --nodes=1                    		# Number of requested nodes
#SBATCH --time=0:05:00               		# Max wall time
#SBATCH --qos=debug                  		# Specify debug QOS
#SBATCH --partition=shas             		# Specify Summit haswell nodes
#SBATCH --ntasks=24        	 	        # Number of tasks per job
#SBATCH --job-name=Matlab_Gen_Parallel          # Job submission name
#SBATCH --output=MATLAB_GEN_PARALLEL.%j.out     # Output file name with Job ID
#SBATCH --reservation=parallelD2		# Reservation name


# Written by:	Shelley Knuth
# Date:		24 February 2014
# Updated:	21 April 2017
# Purpose: 	This script calls a Matlab parallel program 

# purge all existing modules
module purge

# load the matlab module
module load matlab

# Run matlab without a GUI and ask for all available workers
matlab -nosplash -nodesktop -r "clear; num_workers=$SLURM_NTASKS; parallel_std;"

