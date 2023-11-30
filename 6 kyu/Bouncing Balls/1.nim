proc bouncingBall*(h, bounce, window: float64): int =
  if h <= 0.0 or bounce >= 1.0 or h<=window or bounce<0.0: #bruh
    return -1
  result = -1
  var next = h
  while window < next:
    result += 2
    next = next * bounce