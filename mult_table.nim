proc printMultiplicationTable(maxNumber: int) =
  for i in 1..maxNumber:
    for j in 1..maxNumber:
      stdout.write($i & " * " & $j & " = " & $(i * j) & "\t")
    stdout.write("\n")

# Example usage
printMultiplicationTable(9)