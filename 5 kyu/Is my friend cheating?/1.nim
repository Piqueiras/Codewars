proc removNb*(n: int): seq[seq[int]] =
  let triang=(n+1)*n div 2
  for a in (n div 2)..(n):
    var i=((triang-a) div (a+1))-a
    if a*(a+i)==triang-2*a-i:
      result.add(@[a,a+i])