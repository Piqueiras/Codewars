import math

func f(x:float64): float64 =
  1.5 * sin(x)^3

proc simpson*(n: int): float64 =  
  let h = PI/n.float
  result = 0.0
  for i in 1..(n div 2):
    result += 2.0*f(float(2*i-1)*h)
  for i in 1..(n div 2 - 1):
    result += f(2.0*h*float(i))
  result *= 2/3 * h