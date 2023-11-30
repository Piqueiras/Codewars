def buses(kids, adults, places):
    buses = 0
    while adults>=2 and kids>0:
        adults -= 2
        if kids >= places-2:
            kids -= places-2
        else:
            adults -= places-2-kids
            kids = 0
        buses += 1
    if kids > 0 and adults < 2:
        return 0
    if kids == 0 and places != 0:
        buses += -(adults // -places)
    return buses