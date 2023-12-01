import strformat
import math
from sugar import collect

type
  Fraction = object
    n,d:int

func `$`(f:Fraction): string = 
  return  &"({f.n} ,{f.d})"

func reduce(f:Fraction): Fraction =
  result = Fraction(n: f.n, d: f.d)
  if f.d<0:
    result.n *= -1
    result.d *= -1
  let gcd = gcd(abs(result.n),result.d)
  result.n = result.n div gcd
  result.d = result.d div gcd

func `+`(x,y:Fraction): Fraction =
  let num = x.n * y.d + y.n * x.d
  let den = x.d * y.d
  let sum = Fraction(n: num, d: den).reduce()
  result = sum

func `-`(f:Fraction): Fraction =
  result = Fraction(n: -f.n, d: f.d).reduce()

func toRational(x:seq[int]): Fraction =
  result.n=x[0]
  result.d=x[1]
  result.reduce()

func reduce(x:seq[Fraction]): seq[Fraction] =
  result = newSeq[Fraction](x.len)
  for i in 0..<x.len:
    result[i]=x[i].reduce()

func normalize(x:seq[Fraction]): seq[Fraction] =
  result = newSeq[Fraction](x.len)
  let denoms = collect:
    for v in x:
      v.d
  let lcm = denoms.lcm()
  for i in 0..<x.len:
    result[i].n = x[i].n * (lcm div x[i].d) #Lol it leads to underflows
    result[i].d = lcm
    
func toInt(f:Fraction): seq[int64] =
  let num:int64 = f.n
  let den:int64 = f.d
  return @[num,den]

func toInt(x:seq[Fraction]): seq[seq[int64]] =
  result = newSeq[seq[int64]](x.len)
  for i in 0..<x.len:
    result[i]=x[i].toInt()

proc convertFracts*(a: seq[seq[int]]): seq[seq[int64]] =
  let len = a.len
  #[
  var result = newSeq[seq[int]](len)
  var denoms = newSeq[int](len)
  for i in 0..a.high:
    denoms[i]=a[i][1]
  let lcm = denoms.lcm()
  var mult:int
   for i in 0..a.high:
    mult = lcm div denoms[i]
    result[i] = @[mult*a[i][0],mult*a[i][1]] ]#
  var fracs = newSeq[Fraction](len)
  for i in 0..<len:
    fracs[i]=a[i].toRational()
  let reduced = fracs.reduce()
  let normal = reduced.normalize()
  return normal.toInt()