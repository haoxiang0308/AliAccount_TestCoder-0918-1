# Multiplication Table Generator in Nim

import random, os, strformat

# Initialize random number generator
randomize()

proc printMultiplicationTable(size: int) =
  ## Prints a multiplication table of given size to stdout
  for i in 1..size:
    for j in 1..size:
      stdout.write(fmt"{i*j:4}")
    stdout.write("\n")

proc saveMultiplicationTable(size: int, filename: string) =
  ## Saves a multiplication table of given size to a file
  var f: File
  if open(f, filename, fmWrite):
    for i in 1..size:
      for j in 1..size:
        f.write(fmt"{i*j:4}")
      f.write("\n")
    f.close()
    echo "Table saved to ", filename
  else:
    echo "Error: Could not open file for writing"

# Generate a random filename
let randomId = rand(10000)
let filename = "multiplication_table_" & $randomId & ".txt"

# Print table to console
echo "Multiplication Table (10x10):"
printMultiplicationTable(10)

# Save table to file
saveMultiplicationTable(10, filename)