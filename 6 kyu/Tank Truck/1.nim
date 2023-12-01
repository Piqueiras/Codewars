import math
#r*(x*sqrt(r^2-x^2)/r^2 + arcsin(x/r) + PI/2)
#[proc tankvol*(h, d, vt: int): int =
  let r=d/2
  let x=float(h)-r
  let total=PI*r*r
  let disc=r*(x*sqrt(r*r-x*x)/(r*r) + arcsin(degToRad(x/r)) + PI/2)
  let percentage=disc/total
  echo percentage
  return int(float(vt)*percentage)]#

#x*sqrt(r^2-x^2) + (r^2)*(arcsin(x/r) + PI/2)
proc tankvol*(h, d, vt: int): int =
  let r=d/2
  let x=float(h)-r
  let total=PI*r*r
  let disc=(x)*sqrt(r*r-x*x) + (r*r)*(arcsin(x/r) + PI/2)
  let percentage=disc/total
  echo percentage
  return int(float(vt)*percentage)