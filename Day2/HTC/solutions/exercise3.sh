#!/usr/bin/bash

module load gnu_parallel

time parallel python sums.py {} ::: data/sums_input_{0..9}.csv
