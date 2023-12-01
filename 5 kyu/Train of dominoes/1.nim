proc dominoTrain*(n: int): seq[int] =
  if n==0:
    return @[0,0]
  result=dominoTrain(n-1)
  for i in countdown(n,1):
    result.add(i)
    result.add(n)
  result.add(0)

# 0 0 1 1 0 2 2 1 2 0
# [0,0]
# [0,1][1,1][1,0]
# [0,2][2,2][2,1][1,2][2,0]
# [0,3][3,3][3,1][1,3][3,2][2,3][3,0]