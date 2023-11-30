#x+2y = n / (x-2y)

from math import sqrt
proc solEqua*(n: int): seq[seq[int]] =
  let root = int(sqrt(n.float))
  for a in 1..root:
    if n mod a == 0:
      var x = ((n div a) + a) div 2
      var y = ((n div a) - a) div 4
      if (x-2*y)*(x+2*y) == n: #So it produces unwanted results
        result.add(@[x,y])