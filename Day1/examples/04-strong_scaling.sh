#!/bin/bash
#SBATCH --nodes=1                    		# Number of requested nodes
#SBATCH --array=2-24:2%1                        # run even number of task on a node
#SBATCH --time=0:20:00               		# Max wall time
#SBATCH --qos=normal                 		# Specify debug QOS
#SBATCH --partition=shas             		# Specify Summit haswell nodes
#SBATCH --ntasks=24          	 	        # Number of tasks per job
#SBATCH --job-name=strong_pi_bench              # Job submission name
#SBATCH --output=strong_pi_bench.%a.%j.out      # Output file name with Job ID

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

ipcluster start --n=$SLURM_ARRAY_TASK_ID &
sleep 40

# output file name
printf -v OUTFILE "strong_pi.%02d.%s.out" $SLURM_ARRAY_TASK_ID $SLURM_JOBID

# Run python code - strong scaling: problem size stays constant

problem_size=10000000

echo "Running pi benchmark with " $problem_size " samples" > $OUTFILE
time python3 $PROGRAMDIR/pi_parallel.py $problem_size >> $OUTFILE
echo "Completed" >> $OUTFILE

ipcluster stop
