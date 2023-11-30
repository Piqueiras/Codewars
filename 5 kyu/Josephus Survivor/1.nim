import sequtils

proc josephusSurvivor*(n: int, k: int): int =
  var elements = toSeq(1..n)
  var index = 0
  while elements.len>1:
    index = (index + k-1) mod elements.len
    elements.delete(index)
  return elements[0]