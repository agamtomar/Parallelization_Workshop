#!/usr/bin/env python


import csv
import time
import sys


def main():
    for input_file in sys.argv[1:]:
        with open(input_file, 'rb') as fp:
            csv_input = csv.reader(fp)
            for x, y in csv_input:
                x = int(x)
                y = int(y)
                time.sleep(0.2)
                print "{0} + {1} = {2}".format(x, y, x+y)


if __name__ == '__main__':
    main()
