import strutils
proc noSpace*(x: string): string =
  result = ""
  for c in x:
    if c!=' ':
      result.add(c)