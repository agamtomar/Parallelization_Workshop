#!/bin/bash
#SBATCH --nodes=1                    		# Number of requested nodes
#SBATCH --time=3:00:00               		# Max wall time
#SBATCH --qos=normal                  		# Specify debug QOS
#SBATCH --partition=shas             		# Specify Summit haswell nodes
#SBATCH --ntasks=24          	 	        # Number of tasks per job
#SBATCH --job-name=pi_serial_large_bench              # Job submission name
#SBATCH --output=pi_serial_large_bench.%j.out         # Output file name with Job ID

# purge all existing modules
module purge

# load the matlab module
module load python/3.5.1

# The directory where you want the job to run
WORKDIR=/scratch/summit/$USER/Benchmark_PI
mkdir -p $WORKDIR 
cd $WORKDIR

# Program Dir is where my program is located
PROGRAMDIR=/projects/$USER/Parallelization_Workshop/Day1/examples

# output file name
OUTFILE=pi_serial_large.$SLURM_JOBID.out

# Run python code
problem_size=1000000000

echo "Running pi benchmark with " $problem_size " samples" > $OUTFILE
time python3 $PROGRAMDIR/pi_serial.py $problem_size >> $OUTFILE
echo "Completed" >> $OUTFILE
