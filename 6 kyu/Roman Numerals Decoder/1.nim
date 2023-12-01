proc solution*(roman: string): int =
  var last = 'I'
  let prevI = ['V','X']
  let prevX = ['L','C']
  let prevC = ['D','M']
  for i in countdown(roman.high,0):
    case roman[i]:
      of 'I':
        if last in prevI:
          result -= 1
        else:
          result += 1
        last = 'I'
      of 'V':
        result += 5
        last = 'V'
      of 'X':
        if last in prevX:
          result -= 10
        else:
          result += 10
        last = 'X'
      of 'L':
        result += 50
        last = 'L'
      of 'C':
        if last in prevC:
          result -= 100
        else:
          result += 100
        last = 'C'
      of 'D':
        result += 500
        last = 'D'
      of 'M':
        result += 1000
        last = 'M'
      else: discard