#!/bin/bash
#SBATCH --nodes=2                    		# Number of requested nodes
#SBATCH --time=0:05:00               		# Max wall time
#SBATCH --qos=debug                  		# Specify debug QOS
#SBATCH --partition=shas             		# Specify Summit haswell nodes
#SBATCH --ntasks=48          	 	        # Number of tasks per job
#SBATCH --job-name=pythonhello                  # Job submission name
#SBATCH --output=PYTHON_HELLO.%j.out            # Output file name with Job ID


# Written by:	Nick Featherstone
# Date:		17 May 2017

# purge all existing modules
module purge

# load the necessary python modules
module load intel
module load impi
module load python/3.5.1

# The directory where you want the job to run from
#cd /projects/$USER/tutorials/parallelization_workshop/new

#name of the python script you want to run
PFILE='hello1.py'
mpirun -np 48 python $PFILE

