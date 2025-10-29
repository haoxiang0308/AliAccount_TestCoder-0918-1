proc printMultiplicationTable() =
  for i in 1..10:
    for j in 1..10:
      stdout.write((i * j).align(4))
    stdout.write("\n")

printMultiplicationTable()