import std/sequtils
from std/strutils import join

#I hate modulo
func `%%%`(a,b:int64): int64 =
  if a>=0: return a mod b
  else: return b + (a mod b)

func numeric(c:char): int64 =
  case c
  of 'A'..'Z': return ord(c)-65
  of 'a'..'z': return ord(c)-71
  else: discard

func ascii(c:int64): char =
  case c
  of 0..25: return char(c+65)
  of 26..51: return char(c+71)
  else: discard

func encode(c:char,n:int): char = 
  case c:
    of 'A'..'Z': return ascii((numeric(c) + n + 130) mod 26)
    of 'a'..'z': return ascii((numeric(c) + n + 130) mod 26 + 26)
    else: return c
func encode(s:string,n:int): string =
  for i,x in s:
    result.add(x.encode(n+i))

func decode(c:char,n:int): char = 
  case c:
    of 'A'..'Z': return ascii((numeric(c) - n + 130) mod 26)
    of 'a'..'z': return ascii((numeric(c) - n + 130) mod 26 + 26)
    else: return c

func decode(s:string,n:int): string =
  for i,x in s:
    result.add(x.decode(n+i))

func division(n:int): array[5,int] =
  var v = n
  result = [0,0,0,0,0]
  var c = n div 5
  if c * 5 != n:
    c += 1
  var i = 0
  while v>c:
    result[i]=c
    v -= c
    inc i
  result[i]=v    

proc movingShift*(s: string, shift: int): seq[string] =
  result = newSeq[string](5)
  let str = s.encode(shift)
  let divs = division(s.len)
  var j = 0
  for k in 0..4:
    for i in 0..<divs[k]:
      result[k].add(str[j])
      inc j
    
proc demovingShift*(arr: seq[string], shift: int): string =
  result = arr.join()
  result = result.decode(shift)