def digitize(n):
    result=[]
    if n==0:
        result.append(n)
    while n > 0:
        val = n % 10
        result.append(val)
        n-=val
        n = n // 10
    return result