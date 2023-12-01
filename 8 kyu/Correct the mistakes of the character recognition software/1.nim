from strutils import replace
proc correct*(str: string): string = str.replace("0", "O").replace("5", "S").replace("1", "I")
