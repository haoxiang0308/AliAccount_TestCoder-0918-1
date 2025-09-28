def factorial(n)
  (1..n).reduce(1, :*)
end

puts factorial(0) # 1
puts factorial(1) # 1
puts factorial(5) # 120

