import algorithm

proc comp*(a: seq[int], b: seq[int]): bool =
  if a.len!=b.len:
    return false
  var normal = a
  normal.sort()
  var squares = b
  squares.sort()
  for i in 0..a.high:
    if normal[i]*normal[i] != squares[i]:
      return false
  return true