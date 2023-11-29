from math import sqrt

def rectangle_rotation(a, b):
    x = a//sqrt(2)
    y = b//sqrt(2)
    r = (x+1) * (y+1) + x*y
    return r + r%2 -1