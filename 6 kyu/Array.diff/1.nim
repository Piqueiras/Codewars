proc arrayDiff*(a: seq[int], b: seq[int]): seq[int] =
  for elem in a:
    if elem notin b:
      result.add(elem)