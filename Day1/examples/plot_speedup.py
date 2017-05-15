import sys
import re
import matplotlib
import numpy as np
import matplotlib.pyplot as plt
import string
import glob

timeReg=re.compile("[-+]?\d*\.\d+|\d+")

def serial_time(fn):
    f = open(fn)
    l = f.read()
    f.close()
    r = timeReg.findall(l)
    return float(r[-1])

def time_procs(fn, times, procs):
    i = 1
    for f in fn:
        pf = open(f)
        pl = pf.read()
        pf.close()
        np = int(f.split(".")[1])
        results = timeReg.findall(pl)
        t = float(results[-1])
        times[i] = t
        procs[i] = np
        i += 1
    

serial_file_name = glob.glob("Data/pi_serial.*.out")
time_serial = serial_time(serial_file_name[0])

serial_file_large = glob.glob("Data/pi_serial_large.*.out")
time_serial_large = serial_time(serial_file_large[0])


parallel_files_small = glob.glob("Data/strong_pi.*.*.out")
parallel_files_large = glob.glob("Data/large_strong_pi.*.*.out")
weak_files = glob.glob("Data/weak_pi.*.*.out")

times_small = np.zeros(len(parallel_files_small)+1)
times_large = np.zeros(len(parallel_files_large)+1)
times_weak = np.zeros(len(weak_files)+1)

procs = np.zeros(len(times_small))

times_small[0] = time_serial
times_large[0] = time_serial_large
times_weak[0] = time_serial
procs[0] = 1

time_procs(parallel_files_small, times_small, procs)
speedup_small = times_small[0] / times_small
speedup_ideal = procs
efficiency_small = speedup_small / procs

time_procs(parallel_files_large, times_large, procs)
speedup_large = times_large[0] / times_large
efficiency_large = speedup_large / procs

time_procs(weak_files, times_weak, procs)
efficiency_weak = times_weak[0] / times_weak

title = 'Speedup for Pi implementation'

plt.plot(procs, speedup_small, marker='.', label='small')
plt.plot(procs, speedup_large, marker='*', label='large')
plt.plot(procs, speedup_ideal, label='Ideal speedup')
plt.title(title)
plt.xlabel('processors')
plt.ylabel('speedup')
plt.legend(loc='upper left')
plt.grid()
plt.show()

title = 'Efficiency for Pi implementation'

plt.plot(procs, efficiency_small, marker='.', label='small problem size')
plt.plot(procs, efficiency_large, marker='*', label='large problem size')
plt.title(title)
plt.xlabel('processors')
plt.ylabel('efficiency')
plt.grid()
plt.show()

title = 'Weak Scaling for Pi implementation'

plt.plot(procs, efficiency_weak, marker='.')
plt.title(title)
plt.xlabel('processors')
plt.ylabel('efficiency')
plt.grid()
plt.show()
