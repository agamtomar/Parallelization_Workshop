#!/bin/bash


time (
    python matrix-multiply.py data/input_0.csv &
    python matrix-multiply.py data/input_1.csv &
    wait
)
