Convert the solution from exercise 2 ("background bash jobs in a Slurm
job"), exercise 4 ("GNU parallel with Slurm"), and exercise 5 ("Slurm
job arrays") to use the CURC loadbalancer a Bash loop, GNU parallel,
or Slurm arrays, and submit it as a Slurm job. Reduce the requested
`--ntasks` and observe the execution time increase.

Each task / input file line should execute a single
`matrix-multiply.py` process.


## Tips

* Use `echo` and `>>` to append lines to an input file.
* Try to avoid building the input file manually; use a Bash loop in
  stead.
* You can build the input file as part of the Slurm job.
* Don't forget to `module load python intel impi loadbalance`.
