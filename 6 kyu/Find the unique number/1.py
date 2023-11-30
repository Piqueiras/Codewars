def find_uniq(arr):
    slice = arr[0:3]
    for elem in slice:
        if slice.count(elem)==1:
            return elem
    searched = slice[0]
    for elem in arr:
        if elem!=searched:
            return elem