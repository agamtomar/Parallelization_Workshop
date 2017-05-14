def myfunc(x):
    val = x*x*x
    return val
def trapezoid_int(a, b, ntrap):
    ## Integrates myfunc(x) from a to b
    h = (b-a)/(ntrap-1)

    val = myfunc(a)
    integral = 0.5*val
    val = myfunc(b)
    integral = integral+0.5*val

    for i in range(ntrap):
        x = a+i*h
        integral = integral+myfunc(x)

    integral = integral*h
    return integral

print('Estimating the integral of x^3 on the interval [0,1]')

print('Serial mode...')

for i in range(1,7):
    n = 10**i
    ans = trapezoid_int(0.0,1.0,n)
    print('npoints: ', n, ' estimate: ', ans)
