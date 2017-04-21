#!/usr/bin/env python


import csv
import os
import time
import socket
import sys


def main():
    for input_file in sys.argv[1:]:
        with open(input_file, 'rb') as fp:
            csv_input = csv.reader(fp)
            for x, y in csv_input:
                x = int(x)
                y = int(y)
                time.sleep(0.2)
                print "(host: {host}, pid: {pid}, time: {time}) {x} + {y} = {z}".format(
                    host=socket.gethostname(),
                    pid=os.getpid(),
                    time=time.strftime('%H:%M:%S'),
                    x=x,
                    y=y,
                    z=x+y,
                )


if __name__ == '__main__':
    main()
