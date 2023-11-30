from math import lcm

proc isDivisible*(n, x, y: int): bool = (n mod lcm(x,y)) == 0