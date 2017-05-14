import argparse
import matplotlib
import numpy as np

parser = argparse.ArgumentParser(description="Plotting speedup.")
parser.add_argument('serial', type=str, help="serial output file")
args = parser.parse_args()
