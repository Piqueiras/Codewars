proc longest*(a1, a2: string): string =
    var letters:set[char]
    for c in a1:
      letters.incl(c)
    for c in a2:
      letters.incl(c)
    for c in letters:
      result.add(c)