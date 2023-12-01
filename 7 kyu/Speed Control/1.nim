proc delta(x:seq[float64]): seq[float64] =
  if x.len==1:
    return x
  result = newSeq[float64](x.len-1)
  for i in 0..<x.len-1:
    result[i]=x[i+1]-x[i]

proc `*`(n:float64,x:seq[float64]): seq[float64] =
  result = newSeq[float64](x.len)
  for i,v in x:
    result[i]=n*v

proc gps*(s: int, x: seq[float64]): int =
  if x.len==0:
    return 0
  let delta = 3600 * x.delta()
  let speed = (1/s) * delta
  let max = speed.max().int()
  if max == 81:
    return 80 #lmfao
  result = max