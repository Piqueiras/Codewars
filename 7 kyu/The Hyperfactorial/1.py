def hyperfact(num):
    if num == 0 or num == 1:
        return 1
    return (num**num % 1000000007) * (hyperfact(num-1) % 1000000007) % 1000000007