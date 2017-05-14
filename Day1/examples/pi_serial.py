""" Computes PI using a Monte-Carlo approach
"""

nreps = 100
import numpy as np


def pi_serial(n):
    np.random.seed(0)
    x = np.random.uniform(-1, 1, n)
    y = np.random.uniform(-1, 1, n)
    f_hat = np.where(x**2 + y**2 <= 1., 1, 0)
    V = 4.0
    return V*np.sum(f_hat)/n

if __name__ == "__main__":
    import argparse
    import timeit, functools

    parser = argparse.ArgumentParser(description="Compute Pi using N samples.")
    parser.add_argument('N', type=int, help="number of samples")
    args = parser.parse_args()
    t = timeit.Timer(functools.partial(pi_serial, args.N))
    time = t.timeit(nreps)
    print("timeit timing for ", nreps, " repetitions = ", time)
