# Exercise 2: background bash jobs in a Slurm job

Submit `bash-multiple-background-tasks.sh` as a Slurm job. Reduce the
requested `--ntasks` and observe the execution time increase.


## Non-Slurm example

    $ bash examples/bash-multiple-background-tasks.sh

## Tips

* Use `sbatch` to submit a Slurm job (and run `man sbatch` for help on
  the options available)
* You may prefer to update `bash-multiple-background-tasks.sh` with
  embedded `#SBATCH` directives
* Request the same number of `--ntasks` as you want to run bash jobs
  in parallel
* Be careful to request a single node with `--nodes`
* Specify a 2-minute time limit using the `--time` parameter
* Specify an `--output` file file called `exercise2-%j.out`
* Use the `--reservation` `parallelD2`
