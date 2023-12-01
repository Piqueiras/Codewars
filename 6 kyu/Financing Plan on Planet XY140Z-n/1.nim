proc triang(n:int):int = (n+1)*n div 2

proc finance*(n: int): int =
  triang(n)*(n+2)