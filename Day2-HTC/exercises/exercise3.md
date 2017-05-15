# Exercise 3: convert a bash loop to GNU parallel

Convert a serial bash loop to a a parallel-execution GNU parallel
command.


## Serial bash loop

    for input in data/input_{0..9}.csv
    do
        python matrix-multiply.py ${input}
    done


## Tips

* Use `{}` in stead of `${input}`
* `module load gnu_parallel` in addition to `python`
