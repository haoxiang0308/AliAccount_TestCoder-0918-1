-- | Computes the factorial of a non-negative integer.
factorial :: Integer -> Integer
factorial n
  | n < 0     = error "factorial is not defined for negative numbers"
  | n == 0    = 1
  | otherwise = n * factorial (n - 1)

-- Example usage:
-- factorial 5  -- Result: 120
-- factorial 0  -- Result: 1