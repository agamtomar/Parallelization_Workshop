#!/bin/bash

module purge
module load python gnu_parallel

time (ls data/input_*.csv | parallel python matrix-multiply.py {})
