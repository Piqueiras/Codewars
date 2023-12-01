def domino_train(n):
    result = [0,0]
    for i in range(1,n+1):
        for j in range(i,0,-1):
            result.append(j)
            result.append(i)
        result.append(0)
    return result