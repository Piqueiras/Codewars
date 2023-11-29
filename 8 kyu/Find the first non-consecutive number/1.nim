import options

proc first_non_consecutive*(arr: seq[int]): Option[int] =
  var prev = arr[0]
  for elem in arr[1..arr.high]:
    if elem != prev + 1:
      return some(elem)
    prev = elem
  return none(int)