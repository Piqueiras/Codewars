func `!`(n:int): int =
  result = 1
  for i in 1..n:
    result*=i

iterator factorials(n:int): int =
  for i in 0..n:
    yield !i
    
func numeric(c:char): int64 =
  case c
  of '0'..'9': return ord(c)-48
  of 'A'..'Z': return ord(c)-55
  else: discard

func ascii(c:int64): char =
  case c
  of 0..9: return char(c+48)
  of 10..35: return char(c+55)
  else: discard

proc dec2FactString*(nb: int64): string =
  var n = nb
  var list = @['0']
  var i = 1
  while n!=0:
    var val = n mod !(i+1)
    n -= val
    list.insert(ascii(val div !i),0)
    inc i
  for c in list:
    result.add(c)
    
  
proc factString2Dec*(str: string): int64 =
  let len = str.high
  for i in 0..len:
    result += !i * numeric(str[len-i])