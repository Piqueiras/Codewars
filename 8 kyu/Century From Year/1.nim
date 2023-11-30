proc century*(year: int): int = 
  if (year mod 100 == 0): (year div 100) 
  else: (year div 100 + 1)