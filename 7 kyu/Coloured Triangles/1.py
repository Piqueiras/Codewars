def triangle(row):
    while len(row) > 1:
        new_row = ''
        for i in range(len(row) - 1):
            if row[i] == row[i+1]:
                new_row += row[i]
            else:
                if 'R' not in (row[i], row[i+1]):
                    new_row += 'R'
                elif 'G' not in (row[i], row[i+1]):
                    new_row += 'G'
                else:
                    new_row += 'B'
        row = new_row
    return row