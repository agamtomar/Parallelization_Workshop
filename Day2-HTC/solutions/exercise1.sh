#!/usr/bin/bash


time (
    python sums.py data/sums_input_0.csv &
    python sums.py data/sums_input_1.csv &
    wait
)
