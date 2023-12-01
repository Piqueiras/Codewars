proc solution*(str: string): string =
  for i in 0..str.high:
    result.add(str[str.high-i])