import strformat
import sequtils
import strutils

type 
  Range = object
    h,l:int

func newRange(n:int): Range = Range(h:n, l:n)
func newRange(h,l:int): Range = Range(h:h, l:l)
    
func `$`(r:Range): string =
  if r.h == r.l:
    return $r.h
  if r.h == r.l+1:
    return &"{r.l},{r.h}"
  return &"{r.l}-{r.h}"

proc pop(a: var seq[int]): int =
  result = a[0]
  a.delete(0)
proc rangeExtraction*(a: seq[int]): string =
  var queue = a
  var ranges = newSeq[Range]()
  while queue.len>0:
    var ini = queue.pop()
    var next = ini
    var rang = newRange(next,ini)
    while queue.len>0 and next+1 == queue[0]:
      next=queue.pop()
      rang.h=next
    ranges.add(rang)
  var seqstring = ranges.map(proc(x: Range): string = $x)
  result = seqstring.join(",")