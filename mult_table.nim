import std/[random, os, strformat]

proc printMultiplicationTable(size: int) =
  for i in 1..size:
    for j in 1..size:
      stdout.write(fmt"{i*j:4}")
    stdout.write("\n")

proc generateRandomFilename(): string =
  randomize()
  let chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
  var filename = ""
  for i in 1..10:
    filename &= chars[rand(chars.len-1)]
  return filename & ".txt"

let filename = generateRandomFilename()
echo "Saving multiplication table to: ", filename

let f = open(filename, fmWrite)
for i in 1..10:
  for j in 1..10:
    f.write(fmt"{i*j:4}")
  f.write("\n")
f.close()

# Also print to console
echo "Multiplication table (10x10):"
printMultiplicationTable(10)