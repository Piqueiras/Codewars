proc solution*(n: int): int =
  if n<3:
    return 0
  for i in 3..<n:
    if (i mod 3 == 0) or (i mod 5 == 0):
      result += i