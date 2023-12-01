import math
import strformat

type
  Factor = object
    val:int
    mult:int

proc inc(f:var Factor) =
  inc f.mult
  
proc `$`(f:Factor): string =
  if f.mult == 0:
    return ""
  if f.mult == 1:
    return &"({f.val})"
  return &"({f.val}**{f.mult})"
  
proc primeFactors*(n: int): string =
  var num = n
  let limit:int = sqrt(n.float).int
  var factors = newSeq[Factor]()
  var curr = 2
  var prime= Factor(val:2,mult:0)
  while curr <= limit:
    if num mod curr == 0:
      num = num div curr
      inc prime
    else:
      if prime.mult!=0:
        factors.add(prime)
      inc curr
      prime = Factor(val:curr,mult:0)
  if num == 1:
    factors.add(prime)
  else:
    factors.add(Factor(val:num,mult:1))
  echo factors
  for i in factors:
    result.add($i)