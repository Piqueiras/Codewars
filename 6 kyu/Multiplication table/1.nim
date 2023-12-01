from sequtils import toSeq

proc `*`(n:int,x:seq[int]): seq[int] =
  result = newSeq[int](x.len)
  for i,v in x:
    result[i]=n*v

proc multiplicationTable*(size: int): seq[seq[int]] =
  let ini = (1..size).toSeq()
  for i in 1..size:
    result.add(i*ini)