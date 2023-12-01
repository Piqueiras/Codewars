from sugar import collect
proc generateRange*(min, max, step: int): seq[int] = collect(for i in countup(min,max,step): i)