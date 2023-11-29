def int32_to_ip(int32):
    vars = [0,0,0,0]
    for i in range(3, -1, -1):
        vars[i]= int(int32) % 256
        int32 -= vars[i]
        int32 /= 256
    return ".".join(map(str, vars))