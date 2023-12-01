import std/algorithm

#(a^2+b^2)(c^2+d^2)=(ac+bd)^2+(ad−bc)^2=(ad+bc)^2+(ac−bd)^2
proc prod2Sum*(a, b, c, d: int): seq[seq[int]] =
  #let p = a*a+b*b
  #let q = c*c+d*d
  #let n = p*q
  
  let x = abs(a*c+b*d)
  let y = abs(a*d-b*c)
  var xy = @[x,y]
  xy.sort()
  let r = abs(a*d+b*c)
  let s = abs(a*c-b*d)
  var rs = @[r,s]
  rs.sort()
#[
  if x<=r:
    if x<y:
      result.add(@[x,y])
      if x!=r:
        if r<s:
          result.add(@[r,s])
        else:
          result.add(@[s,r])
    else:
      result.add(@[y,x])
      if x!=r:
        if r<s:
          result.add(@[r,s])
        else:
          result.add(@[s,r])
  else:
    if r<s:
      result.add(@[r,s])
      if x<y:
        result.add(@[x,y])
      else:
        result.add(@[y,x])
    else:
      result.add(@[s,r])
      if x<y:
        result.add(@[x,y])
      else:
        result.add(@[y,x])
]#       
#Im sorry for this but ordering results took longer than I expected :skull:
#I am a mathematician not a programmer
  if xy[0]<rs[0]:
    result = @[xy,rs]
  elif xy[0]>rs[0]:
    result = @[rs,xy]
  else:
    result = @[xy]