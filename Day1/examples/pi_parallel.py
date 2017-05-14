

from ipyparallel import Client

nreps=100

def pi_serial_seed(n):
    import numpy as np
    np.random.seed(id)
    x = np.random.uniform(-1, 1, n)
    y = np.random.uniform(-1, 1, n)
    f_hat = np.where(x**2 + y**2 <= 1., 1, 0)
    V = 4.0
    return V*np.sum(f_hat)/n

def pi_parallel(N, rc):
    dview = rc[:]
    dview.scatter('id', rc.ids, block=True)
    nengines = len(rc.ids)
    work = [N//nengines]*nengines
    results = dview.map_sync(pi_serial_seed, work)
    return sum(results)/nengines

if __name__ == "__main__":
    import argparse
    import timeit, functools

    parser = argparse.ArgumentParser(description="Compute Pi using N samples.")
    parser.add_argument('N', type=int, help="number of samples")
    args = parser.parse_args()
    rc = Client()
    print("Running on the following engines: ", rc.ids)
    dview = rc[:]
    dview.scatter('id', rc.ids, block=True)

    t = timeit.Timer(functools.partial(pi_parallel, args.N, rc))
    time = t.timeit(nreps)
    print("average timeit timing using ", nreps, " repetitions = ", time)
