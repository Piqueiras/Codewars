proc digital_root*(n: int): int =
    if n<10:
      n
    else:
      var num=n
      var sum:int
      var val:int
      while num>=10:
        val=num mod 10
        sum+=val
        num-=val
        num=num div 10
      sum+=num
      digital_root(sum)
