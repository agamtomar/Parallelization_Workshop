#!/usr/bin/bash

time (
    for i in $(seq 0 9)
    do
        python sums.py data/sums_input_${i}.csv &
    done
    wait
)
