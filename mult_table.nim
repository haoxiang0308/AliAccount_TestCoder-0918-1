proc printMultiplicationTable() =
  for i in 1..10:
    for j in 1..10:
      stdout.write($i & " * " & $j & " = " & $(i * j) & "\t")
    stdout.write("\n")

printMultiplicationTable()