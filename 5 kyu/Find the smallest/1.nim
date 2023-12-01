import sequtils
import strutils

proc reverse[T](xs: seq[T]): seq[T] =
  result = newSeq[T](xs.len)
  for i, x in xs:
    result[xs.high-i] = x
    
proc apply(x:seq[char],i,j:int) : seq[char] =
  result = x
  let y = x[i]
  result.delete(i)
  result.insert(y,j)

proc apply(x:seq[char],v:(int,int)) : seq[char] =
  let i = v[0]
  let j = v[1]
  result = x
  let y = x[i]
  result.delete(i)
  result.insert(y,j)
  
proc minVals(x:seq[char]) : seq[char] =
  var remove = x
  while remove.len != 0:
    var min = remove.min
    result.add(min)
    while remove.find(min) >= 0:
      remove.delete(remove.find(min))

proc find(digits:seq[char]): (int,int) =
  #let inverse = digits.reverse()
  let min = digits.min()
  let max = digits.max()
  let hi = digits.high
  var ini:int
  var fin:int
  let minIdx = digits.find(min)
  let maxIdx = digits.find(max)
  #let backwardsMin = inverse.len() - inverse.find(min) - 1
  #let backwardsMax = inverse.len() - inverse.find(max) - 1

  if min==max:
    return (0,0)
  
  if minIdx == 0:
    #Minimize rest of number
    (ini,fin)=find(digits[1..hi])
    inc ini
    if digits[ini] != digits[fin]:
      inc fin
    return (ini,fin)
  
  for i in countdown(hi,0):
    if digits[i] == min and digits[i-1] != min:
      ini = i
      fin = 0
      break
  
  let t1=(ini,fin)
  
  if digits[1] == min and digits[0] > digits[1]:
    ini = 0
    fin = hi
    for i in countup(1,hi):
      if digits[i]>digits[0]:
        fin = i-1
        break
    
  let t2=(ini,fin)
  
  if digits.apply(t1).mapIt($it).join().parseInt() < digits.apply(t2).mapIt($it).join().parseInt():
    return t1
  else:
    return t2

#Sorry for brain damage
      
  
proc smallest*(n: int64): seq[int64] =
  let num:int = int(n)
  let digits = toSeq(intToStr(num).items)
  
  let (i,j)=digits.find()

  let number:int64 = digits.apply(i,j).mapIt($it).join().parseInt()
  result = @[number,i,j]