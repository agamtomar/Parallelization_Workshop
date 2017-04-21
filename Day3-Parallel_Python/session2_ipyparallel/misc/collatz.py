def collatz_length(n):
    val = n
    length = 1
    while (val != 1):
        length += 1
        if ((val % 2) == 0):
            val = val//2
        else:
            val =3*val+1
        #print(val)
    return length


n = 1000
lenghts = []
max_len = 1
max_i = 1
for i in range(1,n):
    length = collatz_length(i)
    if (length > max_len):
        max_i = i
        max_len = length

msg = 'The integer with the longest collatz sequence in the interval [1,'+str(n)+'] is '
msg2 = str(max_i)+', whose sequence has length '+str(max_len)+'.'
print(msg+msg2)
