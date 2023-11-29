proc bonusTime*(salary: int, bonus: bool): string = 
  "$" & $(
          if bonus: 
            salary*10 
          else:salary)