proc toYears*(humanYears: int): tuple[humanYears, catYears, dogYears: int] =
  var aux = humanYears - 2
  result = (humanYears, 15, 15)
  if aux >= 0:
    result[1] += 9
    result[2] += 9
  if aux > 0:
    result[1] += 4* (aux)
    result[2] += 5* (aux)