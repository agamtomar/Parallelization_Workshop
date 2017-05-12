#!/bin/bash
#SBATCH --nodes=1			# Number of requested nodes
#SBATCH --time=0:05:00			# Max wall time
#SBATCH --qos=debug			# Specify debug QOS
#SBATCH --partition=shas		# Specify Summit haswell nodes
#SBATCH --ntasks=24			# Number of cores per node
#SBATCH --job-name=labsr		# Job submission name
#SBATCH --output=labsr_%j.out		# Output file name
###SBATCH --reservation=parallelD2        # Reservation name


# Written by:	Shelley Knuth
# Date:		24 February 2014
# Updated:	19 April 2017
# Purpose: 	This script calls a Matlab parallel program 

# purge all existing modules
module purge

# load the matlab module
module load matlab

# Run matlab without a GUI
matlab -nosplash -nodesktop -r "clear; labsr;"

