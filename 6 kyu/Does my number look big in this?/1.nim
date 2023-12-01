import math

proc narcissistic*(value: int): bool =
    var digits : seq[int]
    var aux = value
    var modulo : int
    var sum : int
    while aux!=0:
        modulo = aux mod 10
        digits.add(modulo)
        aux-=modulo
        aux=aux div 10
    for digit in digits:
        sum+=(digit^(digits.len()))
    return sum==value