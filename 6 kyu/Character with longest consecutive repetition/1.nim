proc longestRepetition*(str: string): (char, int) =
  result = ('\0', 0)
  var prev = '\0'
  var count = 0
  for ch in str:
    if ch == prev:
      inc count
    else:
      prev = ch
      count = 1
    if count > result[1]:
      result[0]=ch
      result[1]=count
  return result