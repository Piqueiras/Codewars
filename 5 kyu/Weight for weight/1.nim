import strutils,sequtils,algorithm

proc digiSum*(n: int): int =
  for i in $n:
    result += parseInt($i)

type Weight = object
  n,w:int

func `<`(a,b:Weight): bool = (a.w < b.w) or (a.w == b.w and $(a.n) < $(b.n))

func `$`(a:Weight): string = $(a.n)

proc toWeight(num: int): Weight = Weight(n: num, w: num.digiSum())

proc orderWeight*(strng: string): string =
  if strng.len==0:
    return strng
  let numbers = strng.split(' ').map(parseInt)
  var weights = numbers.map(toWeight)
  weights.sort()
  result = weights.map(`$`).join(" ")