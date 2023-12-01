proc expressionMatter*(a, b, c: int): int =
  echo a
  echo b
  echo c
  if a == 1:
    if c == 1:
      return a+b+c
    else:
      return (a+b)*c
  if c == 1:
    return a*(b+c)
  if b == 1:
    if a>c:
      return a*(b+c)
    else:
      return (a+b)*c
  return a*b*c