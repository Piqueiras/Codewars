import strutils

proc repeatStr*(r: int, str: string): string =
  str.repeat(r)