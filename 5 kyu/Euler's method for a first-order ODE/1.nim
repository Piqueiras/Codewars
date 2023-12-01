import std/math
from std/stats import mean

func zf(x:float64): float64 =
  1+0.5*(exp(-4*x)-exp(-2*x))
  
func df(x,y:float64): float64 =
  2-exp(-4*x)-2*y

func err(y,z:float64): float64 =
  abs(y-z)/z
  
iterator partition(n,start,finish:int): float64 =
  for i in start..finish:
    yield (i/n)

proc exEuler*(nb: int): float64 =
  let h = 1/nb
  var y = newSeq[float64](nb+1)
  var z = newSeq[float64](nb+1)
  var errs = newSeq[float64](nb+1)
  y[0]=1.0
  for i in 1..nb:
    y[i]=y[i-1]+h*df((i-1)/nb,y[i-1])
  for i in 0..nb:
    z[i]=zf(i/nb)
    errs[i]=err(y[i],z[i])
  return errs.mean()

#This is a horrible solution when it comes to optimization
#Can be improved without seqs