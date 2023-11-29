import math

proc rectangleRotation*(a: int, b: int): int =
  let
    halfA = a div 2
    halfB = b div 2
    sqrt2 = sqrt(2.0)
    halfSqrt2 = sqrt2 / 2.0
    
    pointsAlongA = int(halfA.float / sqrt2)
    pointsAlongB = int(halfB.float / sqrt2)
    
    pointsNextToA = int((halfA.float + halfSqrt2) / sqrt2)
    pointsNextToB = int((halfB.float + halfSqrt2) / sqrt2)
    
    pointsInQuarter = pointsAlongA * pointsAlongB + pointsNextToA * pointsNextToB
    
  result = 4*pointsInQuarter + 2*(pointsAlongA+pointsAlongB) + 1