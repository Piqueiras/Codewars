import sequtils

iterator choose(a: seq[int], num_choose: int): seq[int] =
  var
    chosen = newSeqOfCap[int](num_choose)
    i = 0
    i_stack = newSeqOfCap[int](num_choose)
  
  while true:
    if chosen.len == num_choose:
      yield chosen
      discard chosen.pop()
      i = i_stack.pop() + 1
    elif i != a.len:
      chosen.add(a[i])
      i_stack.add(i)
      inc i
    elif i_stack.len > 0:
      discard chosen.pop()
      i = i_stack.pop() + 1
    else:
      break

proc chooseBestSum*(t, k: int, ls: seq[int]): int =
    if(ls.len<k):
      return -1
    var dists=toSeq(ls.choose(k)).mapIt(it.foldl(a+b)).filterIt(it<=t)
    if dists.len==0:
      return -1
    return dists.max()