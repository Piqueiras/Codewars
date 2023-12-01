import sequtils

proc dirReduc*(arr: seq[string]): seq[string] =
  result=arr
  var i=0
  while i<result.len-1:
    if (result[i]=="NORTH" and result[i+1]=="SOUTH") or (result[i+1]=="NORTH" and result[i]=="SOUTH") or (result[i]=="EAST" and result[i+1]=="WEST") or (result[i+1]=="EAST" and result[i]=="WEST"):
      result.delete(i..i+1)
      i=0
    else:
      i+=1