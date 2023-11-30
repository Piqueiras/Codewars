def paint(x,y):
    if x==y:
        return x
    if x in ['R','B'] and y in ['R','B']:
        return 'G'
    if x in ['R','G'] and y in ['R','G']:
        return 'B'
    return 'R'

def triangle(row):
    charlist = [*row]
    while len(charlist) > 1:
        print(charlist)
        for i in range(len(charlist)-1):
            charlist[i] = paint(charlist[i],charlist[i+1])
        charlist.pop()
    return(charlist[0])