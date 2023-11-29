proc printerError*(s: string): string =
  var letters = s.len
  var errors = 0
  for c in s:
    if c notin 'a'..'m':
      inc errors
  return $errors & "/" & $letters