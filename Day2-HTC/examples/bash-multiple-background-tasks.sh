#!/bin/bash

module purge
module load python

time (
    for input in data/input_${0..9}.csv
    do
        python sums.py ${input} &
    done
    wait
)
