import math,strformat

proc iterPi*(epsilon: float64): string =
  var
    approx = 0.0
    iters = 0
  while abs(approx - PI) > epsilon:
    approx += 4 * (-1)^iters / (2*iters + 1)
    inc iters
  return &"[{iters}, {approx.round(10)}]"