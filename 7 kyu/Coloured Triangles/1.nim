proc paint(x,y:char):char =
  if x==y:
    return x
  if x in ['R','B'] and y in ['R','B']:
    return 'G'
  if x in ['R','G'] and y in ['R','G']:
    return 'B'
  return 'R'

proc triangle*(row: string): string =
  result = row
  while result.len > 1:
    for i in 0..result.len-2:
      result[i] = paint(result[i],result[i+1])
    result=result[.. ^2]