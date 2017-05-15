Convert the solution from exercise 2 ("background bash jobs in a Slurm
job") and exercise 4 ("GNU parallel with Slurm") to use Slurm job
arrays rather than a Bash loop or GNU parallel. Each array task should
execute a single `matrix-multiply.py` process, and write to a separate
output file.


## Tips

* You may want to use `%A` in stead of `%j` in `--output` to show the
  same master job id for all array tasks.
* Include `%a` in `--output` to prevent IO conflicts by making each
  task write to a separate file.
