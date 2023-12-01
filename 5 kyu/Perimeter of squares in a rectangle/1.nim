proc fibonacci(n: int): int =
  var
    first = 1
    second = 1

  for _ in 0 .. n-1:
    swap first, second
    second += first

  result = first

proc perimeter*(n: int): int64 =
  for i in 0..n:
    result+=fibonacci(i)
  result*=4