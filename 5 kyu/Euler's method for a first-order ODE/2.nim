import std/math

func zf(x:float64): float64 =
  1+0.5*(exp(-4*x)-exp(-2*x))
  
func df(x,y:float64): float64 =
  2-exp(-4*x)-2*y

func err(y,z:float64): float64 =
  abs(y-z)/z
  
proc exEuler*(nb: int): float64 =
  let h = 1/nb
  var y = 1.0
  var error = 0.0
  for i in 0..nb:
    error+=err(y,zf(i/nb))
    y=y+h*df(i/nb,y)
  return error/float(nb+1)