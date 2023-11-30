import std/math

proc reverse(x: var seq[int]): void =
  if x.len<1:
    return
  for i in 0..x.high div 2:
    var aux = x[i]
    x[i]=x[x.high-i]
    x[x.high-i]=aux

proc integerDigits(n: int): seq[int] {.raises:[ValueError].} =
  if n<0:
    raise newException(ValueError,"n<0")
  var num = n
  var val: int
  while num > 0:
    val = num mod 10
    result.add(val)
    num-=val
    num = num div 10
  result.reverse()

proc digPow*(n, p: int): int =
  for i,x in integerDigits(n):
    result+=x^(p+i)
  if result mod n == 0:
    result=result div n
  else:
    result= -1