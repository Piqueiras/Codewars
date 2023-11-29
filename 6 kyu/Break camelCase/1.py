def solution(s):
    result = ""
    for c in s:
        if c.isupper():
            result += " "
        result += c
    return result