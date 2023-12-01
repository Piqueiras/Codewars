import strformat
import strutils
import algorithm
import sequtils

type
  Time = object
    h,m,s:int

func toSecs(t:Time): int = t.s + t.m * 60 + t.h * 3600 

func toTime(s:int): Time =
  var n = s
  let seconds = n mod 60
  n -= seconds
  n = n div 60
  let minutes = n mod 60
  n -= minutes
  n = n div 60
  let hours = n
  result = Time(h:hours,m:minutes,s:seconds)
  
func toTime(s:string): Time =
  let vals = s.strip().split('|')
  return Time(h:vals[0].parseInt(),m:vals[1].parseInt(),s:vals[2].parseInt())
  
func `$`(t:Time): string =
  var
    hour:string
    minute:string
    second:string
  if t.h<10:
    hour = &"0{t.h}"
  else:
    hour = $t.h
  if t.m<10:
    minute = &"0{t.m}"
  else:
    minute = $t.m
  if t.s<10:
    second = &"0{t.s}"
  else:
    second = $t.s
  return &"{hour}|{minute}|{second}"
  
func `+`(a,b:Time): Time = toTime(a.toSecs + b.toSecs)
func `-`(a,b:Time): Time = toTime(a.toSecs - b.toSecs)
func `/`(t:Time,n:int): Time = toTime(t.toSecs div n)
func `==`(a,b:Time): bool = a.h==b.h and a.m==b.m and a.s==b.s
func `<`(a,b:Time): bool = 
  (a.h<b.h) or 
  (a.h==b.h and a.m<b.m) or
  (a.h==b.h and a.m==b.m and a.s<b.s)

func mean(x:seq[Time]): Time =
  var secs = 0
  for v in x:
    secs += v.toSecs
  secs = secs div x.len
  return toTime(secs)

func range(x:seq[Time]): Time = x[x.high]-x[x.low]

func median(x:seq[Time]): Time =
  let len = x.len
  if len mod 2 == 1:
    return x[len div 2]
  else:
    return mean(x[len div 2 - 1 .. len div 2])

proc stati*(strg: string): string =
  if strg == "":
    return strg
  var marks = strg.split(',').mapIt(it.toTime())
  marks.sort()
  echo marks
  return &"Range: {marks.range} Average: {marks.mean} Median: {marks.median}"