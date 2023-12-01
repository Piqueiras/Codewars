proc findNb*(m: int64): int =
  var
    i=1
    sum=0
  while sum<m:
    sum += (i*i*i)
    inc i
  result = if sum == m: i-1 else: -1