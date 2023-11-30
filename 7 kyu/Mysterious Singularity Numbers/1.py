#Substract divisible by 2, divisible by 3, divisible by 5
#Add divisible by 2 and 3 (6), divisible by 2 and 5 (10), divisible by 3 and 5 (15)
#Substract divisible by 2,3 and 5 (30)

def real_numbers(n):
    return n - (n//2 + n//3 + n//5) + (n//6 + n//10 + n//15) - n//30