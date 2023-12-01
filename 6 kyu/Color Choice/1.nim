#[import sequtils

func `!`(n:int): int =
  result = 1
  for i in 1..n:
    result*=i

iterator factorials(n:int): int =
  for i in 0..n:
    yield !i



#(x! * (n - x)!) = n! / m
# x<n



# x! = (n)*(n-1)*...*(n-x+1) / m

func bruteForce(m: int64, n: int): int =
  if !n mod m != 0:
    return -1
  let p = !n div m
  for i in 1..n:
    if (!i * !(n-i)) == p:
      return i
  return -1
  
proc overflow*(m: int64, n: int): int =
  for i in 1..n:
    var fact = n
    var flag = true
    for j in countdown(n-1,i+1):
      fact*=j
      echo fact
      if flag==true and fact mod m == 0:
        fact = fact div m.int
        flag = false
    if !i == fact:
      return i
  return -1

#n! / x! = n*(n-1)*...*(x+1) = q
#m = q / (n-x)!
#Idea is to divide q asap
proc quickDivision*(m: int64, n: int): int =
  if m == 1:
    return 0
  for x in countup(1,n):
    var q = 1
    var f = toSeq(2..n-x)
    for j in countdown(n,x+1):
      q *= j
      for i in f:
        if q mod i == 0:
          q = q div i
          f[f.find(i)]=1
      if m == q:
        return x
  return -1

#n! / x! = n*(n-1)*...*(n-x+1) = q
#(n-x)! = q / m
#Factorize m?

func primeFactors*(n: int64): seq[int] =
  var
    factor = 2
    m = n
  while m != 1:
    if m mod factor == 0:
      result.add(factor)
      m = m div factor
    elif factor == 2:
      factor += 1
    else:
      factor += 2
  

proc quickPrimes*(m: int64, n: int): int =
  let primes = primeFactors(m)
  for x in 1..n:
    var q = 1
    var p = primes
    for j in countdown(n,x+1):
      q *= j
      for i in p:
        if q mod i == 0:
          q = q div i
          p[p.find(i)]=1
      var f = toSeq(2..n-x)
      for i in f:
        if q mod i == 0:
          q = q div i
          f[f.find(i)]=1
      var prod = 1
      for i in f:
        prod*=i
      if prod == q:
        return x
  return -1 ]#

#CONCLUSION: NEVER USE FACTORIALS

func `@@`(n,x:int): int = 
  var res = 1.0
  for i in 1..x:
    res *= ((n-i+1) / i)
  result=res.int
  
func `@@@`(n,x:int): int =
  if x == 0:
    return 1
  return (n-x+1) * (n@@@(x-1)) div x

proc checkChoose*(m: int64, n: int): int =
  if m == 1:
    return 0
  for x in 1..n:
    if m == (n@@@x):
      return x
  return -1